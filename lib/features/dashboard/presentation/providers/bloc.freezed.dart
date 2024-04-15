// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChats,
    required TResult Function(List<ChatCollection> chats) chatsUpdated,
    required TResult Function(String id) deleteChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChats,
    TResult? Function(List<ChatCollection> chats)? chatsUpdated,
    TResult? Function(String id)? deleteChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChats,
    TResult Function(List<ChatCollection> chats)? chatsUpdated,
    TResult Function(String id)? deleteChat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChats value) loadChats,
    required TResult Function(ChatsUpdated value) chatsUpdated,
    required TResult Function(DeleteChat value) deleteChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChats value)? loadChats,
    TResult? Function(ChatsUpdated value)? chatsUpdated,
    TResult? Function(DeleteChat value)? deleteChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChats value)? loadChats,
    TResult Function(ChatsUpdated value)? chatsUpdated,
    TResult Function(DeleteChat value)? deleteChat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardEventCopyWith<$Res> {
  factory $DashboardEventCopyWith(
          DashboardEvent value, $Res Function(DashboardEvent) then) =
      _$DashboardEventCopyWithImpl<$Res, DashboardEvent>;
}

/// @nodoc
class _$DashboardEventCopyWithImpl<$Res, $Val extends DashboardEvent>
    implements $DashboardEventCopyWith<$Res> {
  _$DashboardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadChatsImplCopyWith<$Res> {
  factory _$$LoadChatsImplCopyWith(
          _$LoadChatsImpl value, $Res Function(_$LoadChatsImpl) then) =
      __$$LoadChatsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadChatsImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$LoadChatsImpl>
    implements _$$LoadChatsImplCopyWith<$Res> {
  __$$LoadChatsImplCopyWithImpl(
      _$LoadChatsImpl _value, $Res Function(_$LoadChatsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadChatsImpl implements LoadChats {
  const _$LoadChatsImpl();

  @override
  String toString() {
    return 'DashboardEvent.loadChats()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadChatsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChats,
    required TResult Function(List<ChatCollection> chats) chatsUpdated,
    required TResult Function(String id) deleteChat,
  }) {
    return loadChats();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChats,
    TResult? Function(List<ChatCollection> chats)? chatsUpdated,
    TResult? Function(String id)? deleteChat,
  }) {
    return loadChats?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChats,
    TResult Function(List<ChatCollection> chats)? chatsUpdated,
    TResult Function(String id)? deleteChat,
    required TResult orElse(),
  }) {
    if (loadChats != null) {
      return loadChats();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChats value) loadChats,
    required TResult Function(ChatsUpdated value) chatsUpdated,
    required TResult Function(DeleteChat value) deleteChat,
  }) {
    return loadChats(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChats value)? loadChats,
    TResult? Function(ChatsUpdated value)? chatsUpdated,
    TResult? Function(DeleteChat value)? deleteChat,
  }) {
    return loadChats?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChats value)? loadChats,
    TResult Function(ChatsUpdated value)? chatsUpdated,
    TResult Function(DeleteChat value)? deleteChat,
    required TResult orElse(),
  }) {
    if (loadChats != null) {
      return loadChats(this);
    }
    return orElse();
  }
}

abstract class LoadChats implements DashboardEvent {
  const factory LoadChats() = _$LoadChatsImpl;
}

/// @nodoc
abstract class _$$ChatsUpdatedImplCopyWith<$Res> {
  factory _$$ChatsUpdatedImplCopyWith(
          _$ChatsUpdatedImpl value, $Res Function(_$ChatsUpdatedImpl) then) =
      __$$ChatsUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ChatCollection> chats});
}

/// @nodoc
class __$$ChatsUpdatedImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$ChatsUpdatedImpl>
    implements _$$ChatsUpdatedImplCopyWith<$Res> {
  __$$ChatsUpdatedImplCopyWithImpl(
      _$ChatsUpdatedImpl _value, $Res Function(_$ChatsUpdatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
  }) {
    return _then(_$ChatsUpdatedImpl(
      null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatCollection>,
    ));
  }
}

/// @nodoc

class _$ChatsUpdatedImpl implements ChatsUpdated {
  const _$ChatsUpdatedImpl(final List<ChatCollection> chats) : _chats = chats;

  final List<ChatCollection> _chats;
  @override
  List<ChatCollection> get chats {
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chats);
  }

  @override
  String toString() {
    return 'DashboardEvent.chatsUpdated(chats: $chats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatsUpdatedImpl &&
            const DeepCollectionEquality().equals(other._chats, _chats));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_chats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatsUpdatedImplCopyWith<_$ChatsUpdatedImpl> get copyWith =>
      __$$ChatsUpdatedImplCopyWithImpl<_$ChatsUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChats,
    required TResult Function(List<ChatCollection> chats) chatsUpdated,
    required TResult Function(String id) deleteChat,
  }) {
    return chatsUpdated(chats);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChats,
    TResult? Function(List<ChatCollection> chats)? chatsUpdated,
    TResult? Function(String id)? deleteChat,
  }) {
    return chatsUpdated?.call(chats);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChats,
    TResult Function(List<ChatCollection> chats)? chatsUpdated,
    TResult Function(String id)? deleteChat,
    required TResult orElse(),
  }) {
    if (chatsUpdated != null) {
      return chatsUpdated(chats);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChats value) loadChats,
    required TResult Function(ChatsUpdated value) chatsUpdated,
    required TResult Function(DeleteChat value) deleteChat,
  }) {
    return chatsUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChats value)? loadChats,
    TResult? Function(ChatsUpdated value)? chatsUpdated,
    TResult? Function(DeleteChat value)? deleteChat,
  }) {
    return chatsUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChats value)? loadChats,
    TResult Function(ChatsUpdated value)? chatsUpdated,
    TResult Function(DeleteChat value)? deleteChat,
    required TResult orElse(),
  }) {
    if (chatsUpdated != null) {
      return chatsUpdated(this);
    }
    return orElse();
  }
}

abstract class ChatsUpdated implements DashboardEvent {
  const factory ChatsUpdated(final List<ChatCollection> chats) =
      _$ChatsUpdatedImpl;

  List<ChatCollection> get chats;
  @JsonKey(ignore: true)
  _$$ChatsUpdatedImplCopyWith<_$ChatsUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteChatImplCopyWith<$Res> {
  factory _$$DeleteChatImplCopyWith(
          _$DeleteChatImpl value, $Res Function(_$DeleteChatImpl) then) =
      __$$DeleteChatImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DeleteChatImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$DeleteChatImpl>
    implements _$$DeleteChatImplCopyWith<$Res> {
  __$$DeleteChatImplCopyWithImpl(
      _$DeleteChatImpl _value, $Res Function(_$DeleteChatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteChatImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteChatImpl implements DeleteChat {
  const _$DeleteChatImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'DashboardEvent.deleteChat(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteChatImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteChatImplCopyWith<_$DeleteChatImpl> get copyWith =>
      __$$DeleteChatImplCopyWithImpl<_$DeleteChatImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadChats,
    required TResult Function(List<ChatCollection> chats) chatsUpdated,
    required TResult Function(String id) deleteChat,
  }) {
    return deleteChat(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadChats,
    TResult? Function(List<ChatCollection> chats)? chatsUpdated,
    TResult? Function(String id)? deleteChat,
  }) {
    return deleteChat?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadChats,
    TResult Function(List<ChatCollection> chats)? chatsUpdated,
    TResult Function(String id)? deleteChat,
    required TResult orElse(),
  }) {
    if (deleteChat != null) {
      return deleteChat(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadChats value) loadChats,
    required TResult Function(ChatsUpdated value) chatsUpdated,
    required TResult Function(DeleteChat value) deleteChat,
  }) {
    return deleteChat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadChats value)? loadChats,
    TResult? Function(ChatsUpdated value)? chatsUpdated,
    TResult? Function(DeleteChat value)? deleteChat,
  }) {
    return deleteChat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadChats value)? loadChats,
    TResult Function(ChatsUpdated value)? chatsUpdated,
    TResult Function(DeleteChat value)? deleteChat,
    required TResult orElse(),
  }) {
    if (deleteChat != null) {
      return deleteChat(this);
    }
    return orElse();
  }
}

abstract class DeleteChat implements DashboardEvent {
  const factory DeleteChat(final String id) = _$DeleteChatImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$DeleteChatImplCopyWith<_$DeleteChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DashboardState {
  List<ChatState> get chats => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
  @useResult
  $Res call({List<ChatState> chats, Status status});

  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      chats: null == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatState>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get status {
    return $StatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardStateImplCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$DashboardStateImplCopyWith(_$DashboardStateImpl value,
          $Res Function(_$DashboardStateImpl) then) =
      __$$DashboardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ChatState> chats, Status status});

  @override
  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$DashboardStateImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardStateImpl>
    implements _$$DashboardStateImplCopyWith<$Res> {
  __$$DashboardStateImplCopyWithImpl(
      _$DashboardStateImpl _value, $Res Function(_$DashboardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
    Object? status = null,
  }) {
    return _then(_$DashboardStateImpl(
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatState>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$DashboardStateImpl implements _DashboardState {
  const _$DashboardStateImpl(
      {final List<ChatState> chats = const [],
      this.status = const Status.initial()})
      : _chats = chats;

  final List<ChatState> _chats;
  @override
  @JsonKey()
  List<ChatState> get chats {
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chats);
  }

  @override
  @JsonKey()
  final Status status;

  @override
  String toString() {
    return 'DashboardState(chats: $chats, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStateImpl &&
            const DeepCollectionEquality().equals(other._chats, _chats) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_chats), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      __$$DashboardStateImplCopyWithImpl<_$DashboardStateImpl>(
          this, _$identity);
}

abstract class _DashboardState implements DashboardState {
  const factory _DashboardState(
      {final List<ChatState> chats,
      final Status status}) = _$DashboardStateImpl;

  @override
  List<ChatState> get chats;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
