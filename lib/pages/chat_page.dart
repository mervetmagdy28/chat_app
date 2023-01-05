import 'package:chat_app/components/chat_buble.dart';
import 'package:chat_app/components/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  static String id="ChatPage";
  CollectionReference messages =FirebaseFirestore.instance.collection(KMessagesCollections);
  TextEditingController controller=TextEditingController();
  final _controller= ScrollController();
  @override
  Widget build(BuildContext context) {
    var email=ModalRoute.of(context)!.settings.arguments ;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(KCreatAt,descending: true).snapshots(),
      builder: (context, snapshot)  {
        if(snapshot.hasData){
          List<Message>messagesList=[];
          for(int i=0; i<snapshot.data!.docs.length; i++){
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return  Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage(kImage),height: 60,),
                    Text("chat")
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagesList.length,
                      itemBuilder:(context, index) {
                        return
                          messagesList[index].idd==email ?
                          ChatBuble(message: messagesList[index],):
                          ChatBubleForFriend(message: messagesList[index],);

                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    child: TextField(
                        controller: controller,
                        onSubmitted: (data){
                          messages.add({
                            KMessage:data,
                            KCreatAt:DateTime.now(),
                            KId:email,
                          });
                          controller.clear();
                          _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeIn);
                        },
                        style: TextStyle(fontSize: 16,color: kPrimaryColor),
                        cursorColor: kPrimaryColor,
                        decoration:InputDecoration(
                            hintText: "Send Message",
                            suffixIcon: Icon(Icons.send, color: kPrimaryColor,),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: kPrimaryColor, width: 1, ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: kPrimaryColor, width: 1, ),

                            )
                        )
                    ),
                  ),
                ],
              )
            //ChatBuble(),
          );
        }else{
          return Text("loading...");
        }
      },
    );
  }
}
