import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
class ChatBuble extends StatelessWidget {
  const ChatBuble({Key? key, required this.message}) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
        child: Text(message.message, style: TextStyle(color: Colors.white, fontSize: 15),),
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
              bottomRight: Radius.circular(24),
            )
        ),
      ),
    );
  }
}

class ChatBubleForFriend extends StatelessWidget {
  const ChatBubleForFriend({Key? key, required this.message}) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
        child: Text(message.message, style: TextStyle(color: Colors.white, fontSize: 15),),
        decoration: BoxDecoration(
            color: kSecoundPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            )
        ),
      ),
    );
  }
}
