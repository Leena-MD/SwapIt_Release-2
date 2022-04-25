// ignore_for_file: file_names

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/models/goods.dart';
import 'package:first_swap/models/goodsMod.dart';
import 'package:first_swap/provider/my_provider.dart';
import 'package:first_swap/push_notification.dart';
import 'package:first_swap/src/pages/Offers.dart';
import 'package:first_swap/src/pages/profile_page.dart';
import 'package:first_swap/src/widgets/bottom_Container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'Post_page.dart';
import 'Home_page.dart';
import 'MyItems.dart';
import 'details_page.dart';
import 'details_requests.dart';

final firebaseUser = FirebaseAuth.instance.currentUser;
String userid = firebaseUser!.uid;

class swapRequest extends StatefulWidget {
  final String image;
  final String description;
  final String owner;
  final String IDgoods;
  final String name;
  final String cate;
  final String ownerRate;
  final String ownerName;
  swapRequest(
      {required this.image,
      required this.name,
      required this.description,
      required this.owner,
      required this.cate,
      required this.IDgoods,
      required this.ownerRate,
      required this.ownerName});

  _swapRequest createState() => _swapRequest();
}

@override
class _swapRequest extends State<swapRequest> {
  String receivergoods = '';
  String receiverID = '';
  // String requeststatus='';
  // String senderID='';
  // String sendergoods='';

  final db = FirebaseFirestore.instance;

  String uiduser = '';
  // final rReqId = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  void inputData() {
    final User? user = auth.currentUser;
    final uid = user!.uid;
  }

  List<Product> MyGoodsList = [];

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.cyan[800], //or set color with: Color(0xFF0000FF)
    ));
    MyProvider provider = Provider.of<MyProvider>(context);

    provider.getMyGoods();

    MyGoodsList = provider.throwMyGoodsList;

    return SafeArea(
       top: false,
 left: false,
 right: false,
 bottom:false,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.cyan[800],
              title: Center(
                  child: Text("أختر منتج للتبادل معه",
                      style: TextStyle(fontSize: 20))),
              leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      this.context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                ownerName: widget.ownerName,
                                image: widget.image,
                                name: widget.name,
                                description: widget.description,
                                cate: widget.cate,
                                owner: widget.owner,
                                IDgoods: widget.IDgoods,
                                ownerRate: widget.ownerRate,
                              )));
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SingleChildScrollView(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 510,
                  child: MyGoodsList.isEmpty
                      ? Center(
                          child: Column(children: <Widget>[
                          Text(
                            '! ' + "لايوجد لديك منتجات للتبادل بها",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 21, color: Colors.grey.shade700),
                          ),
                          SizedBox(height: 20),
                          RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  this.context,
                                  MaterialPageRoute(
                                      builder: (context) => PostPage()));
                            },
                            child: const Text('إضافة منتج جديد',
                                style: TextStyle(fontSize: 23)),
                            color: Colors.cyan.shade800,
                            textColor: Colors.white,
                            elevation: 5,
                          ),
                        ]))
                      : GridView.count(
                          shrinkWrap: false,
                          primary: false,
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 10,
                          children: MyGoodsList.map(
                            (e) => BottomContainer(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Column(children: [
                                        Image.network(e.image,
                                            width: 200,
                                            height: 200,
                                            fit: BoxFit.cover),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          e.title,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.blueGrey[900],
                                          ),
                                        ),
                                        Text("هل تريد التبديل به؟"),
                                      ]),
                                      actions: <Widget>[
                                        SizedBox(
                                          width: 10,
                                        ),
                                        FlatButton(
                                          child: new Text("بدل",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              )),
                                          color: Colors.cyan[800],
                                          onPressed: () {
                                            SendRequest(e.title, e.IDgoods);
                                            // widget.owner;
                                            // widget.IDgoods;
                                            Navigator.of(context).pop();
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        FlatButton(
                                          child: new Text(
                                            "تراجع",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                          color: Colors.orangeAccent,
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              image: e.image,
                              name: e.title,
                            ),
                          ).toList()),
                )
              ],
            )));
  }

//To send a swap request
  SendRequest(String name, String ids) async {
    {
      var status = "waiting";
      var owner = widget.owner;
      // String token=await FirebaseFirestore.instance.collection('users').where('uid')

      await FirebaseFirestore.instance.collection('goods').doc(ids).update({
        'receiver goods': "${widget.IDgoods}",
        'receiverID': "${widget.owner}",
        'Status': status,
      });
      //get token for send notification
      var token;
      String goodsId = widget.IDgoods;
      await FirebaseFirestore.instance.collection('users').doc(owner).get()
          //.then((value) => null)
          .then((ds) {
        token = ds.data()!['token'];
        print(token);
      });
      String title = "طلب تبديل";
      String body = "تم استلام طلب تبديل جديد";
      if (token != null) {
        SendMessage.sendFcmMessage(title, body,
            token); //send notification using FireBase Cloud Message Service FCM
      }
      // SendMessage.notifiy(title, body);
      Fluttertoast.showToast(msg: "تم إرسال طلب التبديل بنجاح!");

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
