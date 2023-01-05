import '../components/constants.dart';

class Message{
  final String message;
  final String idd;

  Message(this.message, this.idd);
  factory Message.fromJson(jsonData){
    return Message(jsonData[KMessage],jsonData[KId]);
  }
}