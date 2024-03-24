import 'package:isar/isar.dart';
import 'package:equatable/equatable.dart';

part 'chat_message.g.dart';

@embedded
class ChatMessage extends Equatable {
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

  @override
  List<Object?> get props => [content, role];

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        role: json['role'] as String? ?? "",
        content: json['content'] as String? ?? "",
      );
}
