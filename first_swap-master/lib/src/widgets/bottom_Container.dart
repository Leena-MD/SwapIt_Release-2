import 'package:flutter/material.dart';
class BottomContainer extends StatelessWidget {

  final String image;
  final String name;

  final VoidCallback onTap;

  BottomContainer({required this. image , required this.name, required this.onTap});
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      
 onTap:onTap ,
 
child: Column(
  
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
           Card(
             
    clipBehavior: Clip.antiAlias,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 18.0 / 11.0,
          child: Image.network(image),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text( name , style: TextStyle(fontWeight: FontWeight.bold) , textAlign: TextAlign.right),
           
            ],
          ),
        ),
      ],
    ),
  )
          ,
         ] ),
    );
  }
}