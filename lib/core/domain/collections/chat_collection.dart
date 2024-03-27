import 'package:flutter_chat_gpt/core/domain/models/chat_message/chat_message.dart';
import 'package:isar/isar.dart';

part 'chat_collection.g.dart';

@Collection()
class ChatCollection {
  ChatCollection(this.messages, this.date);

  Id id = Isar.autoIncrement;

  DateTime date;

  List<ChatMessage> messages = [];
}
