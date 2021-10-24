
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickItemTitle extends StatelessWidget {
  final String title;
  const PickItemTitle({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        this.title,
         style: TextStyle(fontWeight: FontWeight.bold ),),
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      backgroundColor: Colors.cyan[50],
      );
  }
}

