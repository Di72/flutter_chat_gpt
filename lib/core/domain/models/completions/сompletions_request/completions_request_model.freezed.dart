// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'completions_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CompletionsRequestModel _$CompletionsRequestModelFromJson(
    Map<String, dynamic> json) {
  return _CompletionsRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CompletionsRequestModel {
  String get model => throw _privateConstructorUsedError;
  List<ChatMessage> get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompletionsRequestModelCopyWith<CompletionsRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompletionsRequestModelCopyWith<$Res> {
  factory $CompletionsRequestModelCopyWith(CompletionsRequestModel value,
          $Res Function(CompletionsRequestModel) then) =
      _$CompletionsRequestModelCopyWithImpl<$Res, CompletionsRequestModel>;
  @useResult
  $Res call({String model, List<ChatMessage> messages});
}

/// @nodoc
class _$CompletionsRequestModelCopyWithImpl<$Res,
        $Val extends CompletionsRequestModel>
    implements $CompletionsRequestModelCopyWith<$Res> {
  _$CompletionsRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompletionsRequestModelImplCopyWith<$Res>
    implements $CompletionsRequestModelCopyWith<$Res> {
  factory _$$CompletionsRequestModelImplCopyWith(
          _$CompletionsRequestModelImpl value,
          $Res Function(_$CompletionsRequestModelImpl) then) =
      __$$CompletionsRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String model, List<ChatMessage> messages});
}

/// @nodoc
class __$$CompletionsRequestModelImplCopyWithImpl<$Res>
    extends _$CompletionsRequestModelCopyWithImpl<$Res,
        _$CompletionsRequestModelImpl>
    implements _$$CompletionsRequestModelImplCopyWith<$Res> {
  __$$CompletionsRequestModelImplCopyWithImpl(
      _$CompletionsRequestModelImpl _value,
      $Res Function(_$CompletionsRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? messages = null,
  }) {
    return _then(_$CompletionsRequestModelImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompletionsRequestModelImpl implements _CompletionsRequestModel {
  _$CompletionsRequestModelImpl(
      {this.model = DEFAULT_MODEL, required final List<ChatMessage> messages})
      : _messages = messages;

  factory _$CompletionsRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompletionsRequestModelImplFromJson(json);

  @override
  @JsonKey()
  final String model;
  final List<ChatMessage> _messages;
  @override
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'CompletionsRequestModel(model: $model, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompletionsRequestModelImpl &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, model, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompletionsRequestModelImplCopyWith<_$CompletionsRequestModelImpl>
      get copyWith => __$$CompletionsRequestModelImplCopyWithImpl<
          _$CompletionsRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompletionsRequestModelImplToJson(
      this,
    );
  }
}

abstract class _CompletionsRequestModel implements CompletionsRequestModel {
  factory _CompletionsRequestModel(
          {final String model, required final List<ChatMessage> messages}) =
      _$CompletionsRequestModelImpl;

  factory _CompletionsRequestModel.fromJson(Map<String, dynamic> json) =
      _$CompletionsRequestModelImpl.fromJson;

  @override
  String get model;
  @override
  List<ChatMessage> get messages;
  @override
  @JsonKey(ignore: true)
  _$$CompletionsRequestModelImplCopyWith<_$CompletionsRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
