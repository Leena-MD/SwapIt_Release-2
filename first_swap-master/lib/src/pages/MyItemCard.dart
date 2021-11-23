import 'package:flutter/material.dart';

class MyItemCard extends StatelessWidget {
  const MyItemCard(
      {Key? key, this.image, this.name, this.description, this.onTap})
      : super(key: key);

  final String? image;
  final String? name;
  final String? description;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 4.0,
                  //spreadRadius: 1.0,
                ),
              ],
              image: DecorationImage(
                  fit: BoxFit.fitWidth, image: NetworkImage(this.image ?? "")),
            ),
            height: 149,
          ),
          Container(
            height: 149,
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black38, Colors.transparent])),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${this.name}",
                    style: TextStyle(
                      color: Color(0xFFFFFFFFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "${this.description}",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
