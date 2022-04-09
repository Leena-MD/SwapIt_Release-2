import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/constants.dart';
import 'package:first_swap/src/pages/Home_page.dart';
import 'package:first_swap/src/pages/SwapRequest.dart';
import 'package:first_swap/src/pages/bags.dart';
import 'package:first_swap/src/pages/clothes.dart';
import 'package:first_swap/src/pages/computer_category.dart';
import 'package:first_swap/src/pages/gym.dart';
import 'package:first_swap/src/pages/house.dart';
import 'package:first_swap/src/pages/kids_category.dart';
import 'package:first_swap/src/pages/perfume.dart';
import 'package:first_swap/src/pages/pet.dart';
import 'package:flutter/material.dart';
import 'package:first_swap/provider/my_provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'books_category.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailPage extends StatefulWidget {
  final String image;
  final String description;
  final String owner;
  final String IDgoods;
  final String ownerRate;
  final String name;
  final String cate;
  final String ownerName;

  DetailPage({
    required this.image,
    required this.name,
    required this.description,
    required this.owner,
    required this.cate,
    required this.ownerRate,
    required this.IDgoods,
    required this.ownerName,
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

final FirebaseAuth auth = FirebaseAuth.instance;

class _DetailPageState extends State<DetailPage> {
  final User? user = auth.currentUser;

//To retrieve the string

  int quantity = 1;
  double orate = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.cyan[800], //or set color with: Color(0xFF0000FF)
    ));
    MyProvider provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: Center(
            child: Text('معلومات المنتج   ', style: TextStyle(fontSize: 23))),
        leading: IconButton(
          onPressed: () {
            if (widget.cate == "2") {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => houseK()));
            }
            if (widget.cate == "0") {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => ComputerCat()));
            }
            if (widget.cate == "1") {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => KidsCat()));
            }
            if (widget.cate == "3") {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => BooksCat()));
            }
            if (widget.cate == "4") {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => bags()));
            }
            if (widget.cate == "5") {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => perfume()));
            }
            if (widget.cate == "6") {
              Navigator.push(
                  this.context, MaterialPageRoute(builder: (context) => gym()));
            }
            if (widget.cate == "7") {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => clothes()));
            }
            if (widget.cate == "8") {
              Navigator.push(
                  this.context, MaterialPageRoute(builder: (context) => pet()));
            }
            if (widget.cate == "9") {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => HomePage()));
            }
            if (widget.cate == "42") {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => HomePage()));
            }
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          elevation: 9,
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
        showDialog(
        context: context,
        builder: (BuildContext context) {
        return AlertDialog(
        title: Column(children: [
        Image.network(widget.image,
        width: 300,
        height: 300,
        fit: BoxFit.cover),
        SizedBox(
        height: 10,
        ),
        Text(
          widget.name,
        style: TextStyle(
        fontSize: 20,
        color: Colors.blueGrey[900],
        ),
        ),

        ]),
        actions: <Widget>[


        SizedBox(
        width: 50,
        ),

        SizedBox(
        width: 10,
        ),
        ],
        );
        },
        );
        },
                child: Container(
                  child: Hero(
                    tag: "${widget.name}",
                    child: Image.network(widget.image),

                  ),
                  padding: EdgeInsets.all(kDefaultPaddin),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),

                  ),





                ),),

              ),



              SizedBox(height: 10),

              Expanded(

                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      /* RatingBarIndicator(
                        itemCount: 5,
                        textDirection: TextDirection.rtl,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4),
                        itemSize: 20,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),*/
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        selected: true,
                        selectedTileColor: Colors.white70,
                        title: Text(
                          " المنتج ",
                          textScaleFactor: 1,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        minLeadingWidth: double.minPositive,
                      ),
                      Divider(
                        height: 0.2,
                        color: Colors.grey,
                      ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        selected: true,
                        selectedTileColor: Colors.white70,
                        title: Text(
                          widget.name,
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        minLeadingWidth: double.minPositive,
                      ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        selected: true,
                        selectedTileColor: Colors.white70,
                        title: Text(
                          " وصف المنتج ",
                          textScaleFactor: 1,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                        ),
                        minLeadingWidth: double.minPositive,
                      ),
                      Divider(
                        height: 0.2,
                        color: Colors.grey,
                      ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        selected: true,
                        selectedTileColor: Colors.white70,
                        title: Text(
                          widget.description,
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        subtitle: Text(''),
                        isThreeLine: true,
                        minLeadingWidth: double.minPositive,
                      ),
                      Divider(
                        height: 0.2,
                        color: Colors.grey,
                      ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        selected: true,
                        selectedTileColor: Colors.white70,
                        title: Text(
                          "تقيم صاحب المنتج \n" +
                              widget.ownerName +
                              "   " +
                              widget.ownerRate +
                              '/5',
                          textScaleFactor: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        leading: RatingBarIndicator(
                          textDirection: TextDirection.rtl,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4),
                          rating: double.parse(widget.ownerRate),
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 10,
                          direction: Axis.horizontal,
                        ),
                        minLeadingWidth: double.minPositive,
                      ),
                      SizedBox(height: 10),
                      RaisedButton(
                        color: Colors.cyan[800],
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => swapRequest(
                                ownerName: widget.ownerName,
                                image: widget.image,
                                name: widget.name,
                                description: widget.description,
                                cate: widget.cate,
                                owner: widget.owner,
                                IDgoods: widget.IDgoods,
                                ownerRate: widget.ownerRate,
                              ),
                            ),
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.swap_calls_rounded,
                              color: Colors.white,
                            ),
                            Text(
                              "بدّل",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
