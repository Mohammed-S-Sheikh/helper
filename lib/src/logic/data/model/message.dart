import 'package:jserializer/jserializer.dart';

@jSerializable
class MessageModel {
  const MessageModel({required this.message});

  final String message;
}
