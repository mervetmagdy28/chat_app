import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({Key? key, this.onChanged, required this.hintText, this.obscureText=false}) : super(key: key);
  final String hintText;
  final bool obscureText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (data){
        if(data!.isEmpty)
          return "field is required";
      },
      onChanged: onChanged,
      cursorColor: Colors.white,

      style: TextStyle(
          color: Colors.white
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.white
        ),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1),),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1),),

      ),
    );
  }
}
