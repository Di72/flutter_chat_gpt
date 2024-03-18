// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completions_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompletionsResponseModelImpl _$$CompletionsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletionsResponseModelImpl(
      id: json['id'] as String?,
      object: json['object'] as String? ?? '',
      created: json['created'] as int? ?? 0,
      model: json['model'] as String? ?? '',
      choices: (json['choices'] as List<dynamic>)
          .map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
      usage: json['usage'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CompletionsResponseModelImplToJson(
        _$CompletionsResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'choices': instance.choices,
      'usage': instance.usage,
    };

_$ChoiceImpl _$$ChoiceImplFromJson(Map<String, dynamic> json) => _$ChoiceImpl(
      index: json['index'] as int? ?? 0,
      message: Message.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChoiceImplToJson(_$ChoiceImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'message': instance.message,
    };

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      role: json['role'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };
