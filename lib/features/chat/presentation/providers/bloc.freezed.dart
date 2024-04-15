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
mixin _$ChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) started,
    required TResult Function(String id) setMessage,
    required TResult Function(String message) sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? started,
    TResult? Function(String id)? setMessage,
    TResult? Function(String message)? sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? started,
    TResult Function(String id)? setMessage,
    TResult Function(String message)? sendMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatEventStarted value) started,
    required TResult Function(ChatEventSetMessage value) setMessage,
    required TResult Function(ChatEventSendMessage value) sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatEventStarted value)? started,
    TResult? Function(ChatEventSetMessage value)? setMessage,
    TResult? Function(ChatEventSendMessage value)? sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatEventStarted value)? started,
    TResult Function(ChatEventSetMessage value)? setMessage,
    TResult Function(ChatEventSendMessage value)? sendMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChatEventStartedImplCopyWith<$Res> {
  factory _$$ChatEventStartedImplCopyWith(_$ChatEventStartedImpl value,
          $Res Function(_$ChatEventStartedImpl) then) =
      __$$ChatEventStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$ChatEventStartedImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$ChatEventStartedImpl>
    implements _$$ChatEventStartedImplCopyWith<$Res> {
  __$$ChatEventStartedImplCopyWithImpl(_$ChatEventStartedImpl _value,
      $Res Function(_$ChatEventStartedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ChatEventStartedImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChatEventStartedImpl implements ChatEventStarted {
  const _$ChatEventStartedImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'ChatEvent.started(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatEventStartedImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatEventStartedImplCopyWith<_$ChatEventStartedImpl> get copyWith =>
      __$$ChatEventStartedImplCopyWithImpl<_$ChatEventStartedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) started,
    required TResult Function(String id) setMessage,
    required TResult Function(String message) sendMessage,
  }) {
    return started(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? started,
    TResult? Function(String id)? setMessage,
    TResult? Function(String message)? sendMessage,
  }) {
    return started?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? started,
    TResult Function(String id)? setMessage,
    TResult Function(String message)? sendMessage,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatEventStarted value) started,
    required TResult Function(ChatEventSetMessage value) setMessage,
    required TResult Function(ChatEventSendMessage value) sendMessage,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatEventStarted value)? started,
    TResult? Function(ChatEventSetMessage value)? setMessage,
    TResult? Function(ChatEventSendMessage value)? sendMessage,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatEventStarted value)? started,
    TResult Function(ChatEventSetMessage value)? setMessage,
    TResult Function(ChatEventSendMessage value)? sendMessage,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class ChatEventStarted implements ChatEvent {
  const factory ChatEventStarted(final String id) = _$ChatEventStartedImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$ChatEventStartedImplCopyWith<_$ChatEventStartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatEventSetMessageImplCopyWith<$Res> {
  factory _$$ChatEventSetMessageImplCopyWith(_$ChatEventSetMessageImpl value,
          $Res Function(_$ChatEventSetMessageImpl) then) =
      __$$ChatEventSetMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$ChatEventSetMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$ChatEventSetMessageImpl>
    implements _$$ChatEventSetMessageImplCopyWith<$Res> {
  __$$ChatEventSetMessageImplCopyWithImpl(_$ChatEventSetMessageImpl _value,
      $Res Function(_$ChatEventSetMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ChatEventSetMessageImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChatEventSetMessageImpl implements ChatEventSetMessage {
  const _$ChatEventSetMessageImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'ChatEvent.setMessage(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatEventSetMessageImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatEventSetMessageImplCopyWith<_$ChatEventSetMessageImpl> get copyWith =>
      __$$ChatEventSetMessageImplCopyWithImpl<_$ChatEventSetMessageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) started,
    required TResult Function(String id) setMessage,
    required TResult Function(String message) sendMessage,
  }) {
    return setMessage(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? started,
    TResult? Function(String id)? setMessage,
    TResult? Function(String message)? sendMessage,
  }) {
    return setMessage?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? started,
    TResult Function(String id)? setMessage,
    TResult Function(String message)? sendMessage,
    required TResult orElse(),
  }) {
    if (setMessage != null) {
      return setMessage(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatEventStarted value) started,
    required TResult Function(ChatEventSetMessage value) setMessage,
    required TResult Function(ChatEventSendMessage value) sendMessage,
  }) {
    return setMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatEventStarted value)? started,
    TResult? Function(ChatEventSetMessage value)? setMessage,
    TResult? Function(ChatEventSendMessage value)? sendMessage,
  }) {
    return setMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatEventStarted value)? started,
    TResult Function(ChatEventSetMessage value)? setMessage,
    TResult Function(ChatEventSendMessage value)? sendMessage,
    required TResult orElse(),
  }) {
    if (setMessage != null) {
      return setMessage(this);
    }
    return orElse();
  }
}

abstract class ChatEventSetMessage implements ChatEvent {
  const factory ChatEventSetMessage(final String id) =
      _$ChatEventSetMessageImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$ChatEventSetMessageImplCopyWith<_$ChatEventSetMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatEventSendMessageImplCopyWith<$Res> {
  factory _$$ChatEventSendMessageImplCopyWith(_$ChatEventSendMessageImpl value,
          $Res Function(_$ChatEventSendMessageImpl) then) =
      __$$ChatEventSendMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ChatEventSendMessageImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$ChatEventSendMessageImpl>
    implements _$$ChatEventSendMessageImplCopyWith<$Res> {
  __$$ChatEventSendMessageImplCopyWithImpl(_$ChatEventSendMessageImpl _value,
      $Res Function(_$ChatEventSendMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ChatEventSendMessageImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChatEventSendMessageImpl implements ChatEventSendMessage {
  const _$ChatEventSendMessageImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ChatEvent.sendMessage(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatEventSendMessageImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatEventSendMessageImplCopyWith<_$ChatEventSendMessageImpl>
      get copyWith =>
          __$$ChatEventSendMessageImplCopyWithImpl<_$ChatEventSendMessageImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) started,
    required TResult Function(String id) setMessage,
    required TResult Function(String message) sendMessage,
  }) {
    return sendMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? started,
    TResult? Function(String id)? setMessage,
    TResult? Function(String message)? sendMessage,
  }) {
    return sendMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? started,
    TResult Function(String id)? setMessage,
    TResult Function(String message)? sendMessage,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatEventStarted value) started,
    required TResult Function(ChatEventSetMessage value) setMessage,
    required TResult Function(ChatEventSendMessage value) sendMessage,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatEventStarted value)? started,
    TResult? Function(ChatEventSetMessage value)? setMessage,
    TResult? Function(ChatEventSendMessage value)? sendMessage,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatEventStarted value)? started,
    TResult Function(ChatEventSetMessage value)? setMessage,
    TResult Function(ChatEventSendMessage value)? sendMessage,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class ChatEventSendMessage implements ChatEvent {
  const factory ChatEventSendMessage(final String message) =
      _$ChatEventSendMessageImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ChatEventSendMessageImplCopyWith<_$ChatEventSendMessageImpl>
      get copyWith => throw _privateConstructorUsedError;
}
