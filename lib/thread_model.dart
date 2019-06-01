import 'message_model.dart';

class ThreadModel {
  int id;
  String title;
  String description;
  String username;
  DateTime date;
  List<Message> messages;

  ThreadModel({int id, String title, String description, String username, DateTime date}) {
    this.id = id;
    this.title = title;
    this.description = description;
    this.username = username;
    this.date = date;
  }
}
