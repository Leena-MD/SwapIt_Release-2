import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
  

  AppTextField({
    required this.icon,
    required this.hint, bool? autocorrect, TextAlign? textAlign, InputDecoration? decoration, String? hintText,
  
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black38),
            prefixIcon: Icon(icon),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
          ),
        ),
       
      ],
    );
  }
}