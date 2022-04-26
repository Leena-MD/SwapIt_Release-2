import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:first_swap/constants.dart';
import 'package:first_swap/models/product.dart';
import 'package:first_swap/push_notification.dart';
import 'package:first_swap/src/pages/Home_page.dart';
import 'package:first_swap/src/pages/bags.dart';
import 'package:first_swap/src/pages/clothes.dart';
import 'package:first_swap/src/pages/computer_category.dart';
import 'package:first_swap/src/pages/details_contact.dart';
import 'package:first_swap/src/pages/gym.dart';
import 'package:first_swap/src/pages/history_page.dart';
import 'package:first_swap/src/pages/house.dart';
import 'package:first_swap/src/pages/kids_category.dart';
import 'package:first_swap/src/pages/perfume.dart';
import 'package:first_swap/src/pages/pet.dart';
import 'package:flutter/material.dart';
import 'package:first_swap/provider/my_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'Offers.dart';
import 'books_category.dart';

class DetailRequest extends StatefulWidget {
  final String image;
  final String description;
  final String owner;
  final String IDgoods;
  final String ownerName;
  final String ownerRate;

  final String name;
  final String cate;
  DetailRequest(
      {required this.image,
      required this.name,
      required this.description,
      required this.owner,
      required this.cate,
      required this.IDgoods,
      required this.ownerName,
      required this.ownerRate});

  @override
  _DetailRequestState createState() => _DetailRequestState();
}

List<String> csvList = [];
List csvFileContentList = [];
List CsvModuleList = [];

final db = FirebaseFirestore.instance;

class _DetailRequestState extends State<DetailRequest> {
  int quantity = 1;
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
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => Offers()));
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
                flex: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  width: double.infinity,
                  // color: Colors.white,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        selected: true,
                        selectedTileColor: Colors.white70,
                        // selectedTileColor: Colors.white38,

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
                        //selectedTileColor: Colors.white38,
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
                        //selectedTileColor: Colors.white38,

                        leading: FlatButton(
                          onPressed: () {
                            mygoods();
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.launch,
                                color: Colors.green,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                        title: Text(
                          " يريد التبادل معك بهذا المنتج",
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
                      SizedBox(height: 20),
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
                      SizedBox(width: 20),
                      ElevatedButtonTheme(
                        data: ElevatedButtonThemeData(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(120, 60))),
                        child: ButtonBar(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            new SizedBox(
                              width: 100.0,
                              height: 50.0,
                              child: RaisedButton(
                                child: Text('رفض الطلب ',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                color: Colors.redAccent,
                                onPressed: () {
                                  reject();
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5,
                                padding: EdgeInsets.fromLTRB(20, 15, 2, 5),
                              ),
                            ),
                            SizedBox(width: 20),
                            new SizedBox(
                              width: 100.0,
                              height: 50.0,
                              child: RaisedButton(
                                child: Text('قبول الطلب ',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                color: Colors.lightGreen,
                                onPressed: () {
                                  accept();
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5,
                                padding: EdgeInsets.fromLTRB(20, 15, 2, 5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
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

//to accept  the swapping
  accept() async {
    String goodsId = widget.IDgoods;
    String receivergoodsId = "";
    String ownerGoods = "";
    String Categorty = "";

    var status = "done";

    await FirebaseFirestore.instance
        .collection('goods')
        .doc(goodsId)
        .update({'Status': status});
    await FirebaseFirestore.instance.collection('goods').doc(goodsId).get()
        //.then((value) => null)
        .then((ds) {
      receivergoodsId = ds.data()!['receiver goods'];
      ownerGoods = ds.data()!['owner'];
      Categorty = ds.data()!['cate'];
    });
    await FirebaseFirestore.instance
        .collection('goods')
        .doc(receivergoodsId)
        .update({
      'receiver goods': goodsId,
      'Status': status,
      'receiverID': ownerGoods
    });

    QuerySnapshot querySnapshot = (await FirebaseFirestore.instance
        .collection('goods')
        .where("Status", isEqualTo: "waiting")
        .where("receiver goods", isEqualTo: receivergoodsId)
        .get());

    querySnapshot.docs.forEach((element) {
      rejecOtherGoods(element.id);
    });

    //get token from Firebase and send notification to OwnerGood
    var token;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(ownerGoods)
        .get()
        .then((ds) {
      token = ds.data()!['token'];
      print(token);
    });
    String title = "تم قبول طلب التبديل";
    String body = "تم قبول طلب التبديل المرسل";
    if (token != null) {
      SendMessage.sendFcmMessage(title, body, token);
    }
    //SendMessage.notifiy(title, body); local Notification
    Fluttertoast.showToast(msg: "تم قبول الطلب بنجاح!");
    Navigator.push(
        this.context,
        MaterialPageRoute(
          builder: (context) => DetailContact(
            image: widget.image,
            name: widget.name,
            description: widget.description,
            cate: widget.cate,
            owner: widget.owner,
            IDgoods: widget.IDgoods,
          ),
        ));
    List<List<dynamic>> csvList = [];

  }
//to reject the swapping

  reject() async {
    String goodsId = widget.IDgoods;

    var status = "available";

    String reGoodsId;

    await FirebaseFirestore.instance
        .collection('goods')
        .doc(goodsId)
        .update({'Status': status, 'receiver goods': '', 'receiverID': ''});

    Fluttertoast.showToast(msg: "تم رفض الطلب  !");

    Navigator.push(
        this.context, MaterialPageRoute(builder: (context) => Offers()));
  }
//If a good that had more than one request is accept, the rest of the requests will be rejected

  rejecOtherGoods(String ids) async {
    var status = "available";

    await FirebaseFirestore.instance
        .collection('goods')
        .doc(ids)
        .update({'Status': status, 'receiver goods': '', 'receiverID': ''});
  }
  //To view the goods that swapping with

  mygoods() async {
    var myimage;

    var receivergoodsId;
    String goodsId = widget.IDgoods;
    await FirebaseFirestore.instance.collection('goods').doc(goodsId).get()
        //.then((value) => null)
        .then((ds) {
      receivergoodsId = ds.data()!['receiver goods'];
    });

    String mygoodsName = '';

    await FirebaseFirestore.instance
        .collection('goods')
        .doc(receivergoodsId)
        .get()
        .then((ds) {
      mygoodsName = ds.data()!['gName'];
      myimage = ds.data()!['image'];
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(children: [
            FlatButton(
              child: new Text(
                  "                                                         X",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey[900],
                  ),
                  textAlign: TextAlign.right),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Image.network(myimage, width: 200, height: 200, fit: BoxFit.cover),
            SizedBox(
              height: 10,
            ),
            Text(
              mygoodsName,
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey[900],
              ),
            )
          ]),
        );
      },
    );
  }
}

class CsvModule {
  final String field1;
  final String field2;
  final String field3;
  CsvModule({
    this.field1 = '',
    this.field2 = '',
    this.field3 = '',
  });

  // List to class Module
  CsvModule.fromList(List items)
      : this(
            field1: items[0].trim(),
            field2: items[1].trim(),
            field3: items[3].trim());

  // Convert Data to JSON
  Map toJson() {
    return {
      'receiverID': field1,
      'interested goods ID': field2,
      'cate': field3
    };
  }

  // Convert Data to list
  List toList() {
    return [field1, field2, field3];
  }

  // JSON to class Module
  factory CsvModule.fromData(Map data) {
    return CsvModule(
        field1: data['receiverID'],
        field2: data['interested goods ID'],
        field3: data['cate']);
  }
}
