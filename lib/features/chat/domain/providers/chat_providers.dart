import 'package:flutter_chat_gpt/core/data/network/network_service.dart';
import 'package:flutter_chat_gpt/core/domain/providers/dio_network_service_provider.dart';
// import 'package:flutter_chat_gpt/features/Chat/data/datasource/Chat_remote_datasource.dart';
import 'package:flutter_chat_gpt/features/chat/data/repositories/chat_repository.dart';
import 'package:flutter_chat_gpt/features/chat/domain/repositories/chat_repository.dart';
import 'package:flutter_chat_gpt/shared/commom_libs.dart';

// final chatDatasourceProvider =
//     Provider.family<ChatRemoteDatasource, NetworkService>(
//   (_, networkService) => ChatRemoteDatasource(networkService),
// );

// final chatRepositoryProvider = Provider<ChatRepository>((ref) {
//   final dioService = ref.watch(dioServiceProvider);
//   final datasource = ref.watch(chatDatasourceProvider(dioService));
//   final repository = ChatRepositoryImpl(datasource);

//   return repository;
// });
