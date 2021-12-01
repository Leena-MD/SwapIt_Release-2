import 'package:flutter/material.dart';

class MyItemCard extends StatelessWidget {
  const MyItemCard(
      {Key? key,
      this.image,
      this.name,
      this.description,
      this.status,
      this.colorStatus,
      this.onTap})
      : super(key: key);

  final String? image;
  final String? name;
  final String? description;
  final String? status;
  final Color? colorStatus;
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
              boxShadow: [
                BoxShadow(
                  color: Colors.white12,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                ),
              ],
              image: DecorationImage(
                  fit: BoxFit.fitWidth, image: NetworkImage(this.image ?? "")),
            ),
            height: 149,
            margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            // width: MediaQuery.of(context).size.width*0.8,
          ),
          Container(
            height: 149,
            margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            //  width: MediaQuery.of(context).size.width*0.8,
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
          Container(
            height: 43,
            margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black38, Colors.white70])),
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    "${this.status}",
                    style: TextStyle(
                      color: colorStatus,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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