import 'package:chat_app/components/constants.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/custom_button.dart';
import '../components/custom_text_field.dart';
import '../components/helper.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);
  static String id='RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState>formKey=GlobalKey();

  String? email;

  String? password;

  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      Image(image: AssetImage("assets/images/icons8-discord-new-50.png")),
                      Text("App Chat", style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily:"Pacifico",
                          color: Colors.white
                      ),),
                      SizedBox(height: 60,),
                      Row(
                        children: [
                          Text("REGISTER", style: TextStyle(
                              color: Colors.white,
                              fontSize: 22
                          ),),
                        ],
                      ),
                      SizedBox(height: 15,),
                      CustomTextField(onChanged:(data){
                        email=data;
                      },hintText: "Email"),
                      SizedBox(height: 20,),
                      CustomTextField(
                        obscureText: true,
                        onChanged: (data){
                        password=data;
                      }, hintText: 'Password',),
                      SizedBox(height: 20,),
                      CustomButton(
                        onTap: ()async{
                         if(formKey.currentState!.validate()){
                           isLoading=true;
                           setState(() {

                           });
                           try{
                             await registerUser();
                             showMessage(context, "success");
                             Navigator.pop(context);
                           }on FirebaseAuthException  catch(ex){
                             print(ex.code);
                             if (ex.code=="weak-password")
                               showMessage(context, "weak password");
                             else if (ex.code=="email-already-in-use")
                               showMessage(context, "Email already exists");

                           } catch(ex){
                            // print(ex);
                             showMessage(context, "hufivhfjcc");
                           }
                           isLoading=false;
                           setState(() {

                           });

                         }
                        },
                        text: "REGISTER",),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          SizedBox(width: 30,),
                          Text("already have an account? ", style: TextStyle(color: Colors.white, fontSize: 16),),
                          GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Text("LOGIN ", style: TextStyle(color: Color(0xFFC7EDE6), fontSize: 16),)),
                        ],
                      )

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }



  Future<void> registerUser() async {
     UserCredential user= await  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!);

  }
}
