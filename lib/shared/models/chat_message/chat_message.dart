import 'package:isar/isar.dart';

part 'chat_message.g.dart';

@embedded
class ChatMessage {
  final String role;
  final String content;

  const ChatMessage({
    this.role = "",
    this.content = "",
  });

  Map<String, dynamic> toJson() => {
        'role': role,
        'content': content,
      };

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        role: json['role'] as String? ?? "",
        content: json['content'] as String? ?? "",
      );
}
