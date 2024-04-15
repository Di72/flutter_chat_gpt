import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_gpt/core/data/storage/isar_storage_service.dart';
import 'package:flutter_chat_gpt/features/chat/presentation/providers/state/chat_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_chat_gpt/shared/collections/chat_collection.dart';
import 'package:isar/isar.dart';

part 'bloc.freezed.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.loadChats() = LoadChats;
  const factory DashboardEvent.chatsUpdated(List<ChatCollection> chats) =
      ChatsUpdated;
  const factory DashboardEvent.deleteChat(String id) = DeleteChat;
}

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default([]) List<ChatState> chats,
    @Default(Status.initial()) Status status,
  }) = _DashboardState;
}

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final IsarStorageService isarService;

  DashboardBloc({required this.isarService}) : super(const DashboardState()) {
    on<LoadChats>(_onLoadChats);
    on<ChatsUpdated>(_onChatsUpdated);
    on<DeleteChat>(_onDeleteChat);

    _init();
  }

  Future<void> _init() async {
    final isar = await isarService.isar;
    final stream = isar.chatCollections.watchLazy(fireImmediately: true);
    stream.listen((event) async {
      final chatCollections = await isar.chatCollections.where().findAll();
      add(ChatsUpdated(chatCollections));
    });
  }

  Future<void> _onLoadChats(
      LoadChats event, Emitter<DashboardState> emit) async {
    emit(state.copyWith(status: Status.loading()));
    try {
      final isar = await isarService.isar;
      final chatCollections = await isar.chatCollections.where().findAll();
      add(ChatsUpdated(chatCollections));
    } catch (e) {
      emit(state.copyWith(status: Status.failure(e)));
    }
  }

  void _onChatsUpdated(ChatsUpdated event, Emitter<DashboardState> emit) {
    final newChats = event.chats
        .map((el) => ChatState(
              id: el.id.toString(),
              messages: el.messages,
              date: el.date,
              status: const Status.initial(),
            ))
        .toList();
    newChats.sort((a, b) => b.date!.compareTo(a.date!));
    emit(DashboardState(chats: newChats, status: Status.success()));
  }

  Future<void> _onDeleteChat(
      DeleteChat event, Emitter<DashboardState> emit) async {
    final isar = await isarService.isar;
    await isar.writeTxn(() async {
      await isar.chatCollections.delete(int.parse(event.id));
    });
    add(LoadChats());
  }
}
