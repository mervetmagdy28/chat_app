import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, this.onTap,required this.text}) : super(key: key);
  final String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(text, style: TextStyle(
              color: Color(0xFF274460),fontSize: 20
          ),),
        ),
      ),
    );
  }
}
