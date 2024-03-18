import 'package:freezed_annotation/freezed_annotation.dart';
part 'completions_response_model.freezed.dart';
part 'completions_response_model.g.dart';

@freezed
class CompletionsResponseModel with _$CompletionsResponseModel {
  factory CompletionsResponseModel({
    String? id,
    @Default('') String object,
    @Default(0) int created,
    @Default('') String model,
    required List<Choice> choices,
    Map<String, dynamic>? usage,
  }) = _CompletionsResponseModel;

  factory CompletionsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CompletionsResponseModelFromJson(json);
}

@freezed
class Choice with _$Choice {
  factory Choice({
    @Default(0) int index,
    required Message message,
  }) = _Choice;

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
}

@freezed
class Message with _$Message {
  factory Message({
    @Default('') String role,
    @Default('') String content,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
