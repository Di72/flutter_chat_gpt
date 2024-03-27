// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completions_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompletionsRequestModelImpl _$$CompletionsRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletionsRequestModelImpl(
      model: json['model'] as String? ?? DEFAULT_MODEL,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CompletionsRequestModelImplToJson(
        _$CompletionsRequestModelImpl instance) =>
    <String, dynamic>{
      'model': instance.model,
      'messages': instance.messages,
    };
