import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/constants.dart';
import 'package:first_swap/models/goodsMod.dart';
import 'package:first_swap/src/pages/Home_page.dart';
import 'package:first_swap/src/pages/bags.dart';
import 'package:first_swap/src/pages/clothes.dart';
import 'package:first_swap/src/pages/computer_category.dart';
import 'package:first_swap/src/pages/gym.dart';
import 'package:first_swap/src/pages/history_page.dart';
import 'package:first_swap/src/pages/house.dart';
import 'package:first_swap/src/pages/kids_category.dart';
import 'package:first_swap/src/pages/perfume.dart';
import 'package:first_swap/src/pages/pet.dart';
import 'package:flutter/material.dart';
import 'package:first_swap/provider/my_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:first_swap/models/user_model.dart';
import 'Offers.dart';
import 'books_category.dart';

class DetailContact extends StatefulWidget {
  final String image;
  final String description;
  final String owner;
  final String IDgoods;

  final String name;
  final String cate;
  DetailContact({
    required this.image,
    required this.name,
    required this.description,
    required this.owner,
    required this.cate,
    required this.IDgoods,
  });

  @override
  _Details createState() => _Details();
}

final db = FirebaseFirestore.instance;

class _Details extends State<DetailContact> {
  String FName = '';
  String LName = '';
  String phoneN = '';
  String userName = '';
  double ratep = 0;
  double userRate = 0;
  double userRateNum = 0;
  double userRate1 = 0;
  double userRate2 = 0;
  double userRate3 = 0;
  double userRate4 = 0;
  double userRate5 = 0;
  double AvgUserRate = 0;
  int quantity = 1;
  bool Rcount = false;
  bool isVisible = true;

  String goodRate = "";

  @override
  Widget build(BuildContext context) {
    accept();
    MyProvider provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: Center(
            child: Text('معلومات المنتج   ', style: TextStyle(fontSize: 23))),
        leading: IconButton(
          onPressed: () {
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => History()));
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
                child: Container(
                  padding: EdgeInsets.all(kDefaultPaddin),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Hero(
                    tag: "${widget.name}",
                    child: Image.network(widget.image),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                flex: 5,
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
                          " التبادل سيكون بهذا المنتج ",
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
                      // SizedBox(height: 15),

                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        selected: true,
                        selectedTileColor: Colors.white70,
                        //selectedTileColor: Colors.white38,

                        title: Text(
                          LName + ' ' + FName + " يمكنك التواصل مع ",
                          textScaleFactor: 1,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
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
                          phoneN + " : رقم الهاتف",
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
                      SizedBox(height: 10),

                      Visibility(
                          visible: isVisible,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0)),
                            selected: true,
                            selectedTileColor: Colors.white70,
                            //selectedTileColor: Colors.white38,

                            title: Text(
                              " يمكنك تقيم  " +
                                  widget.name +
                                  ' / ' +
                                  FName +
                                  " ",
                              textScaleFactor: 1,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
                            ),

                            leading: TextButton.icon(
                              onPressed: () {
                                rate(context);
                              },
                              style: ButtonStyle(
                                  alignment: Alignment.center,
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.yellow.withOpacity(0.1))),
                              icon: Icon(
                                Icons.stars,
                                color: Colors.yellow.withOpacity(0.9),
                              ),
                              label: Text(
                                "قيمّ",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            minLeadingWidth: double.minPositive,
                          )),

                      /*Visibility(
                        visible: isVisible2,
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0)),
                          selected: true,
                          selectedTileColor: Colors.white70,
                          //selectedTileColor: Colors.white38,
                          title: Visibility(
                            visible: isVisible2,
                            child: Text(
                              "  تقيمك للمنتج   ",
                              textScaleFactor: 1,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          leading: Visibility(
                            visible: isVisible2,
                            child: RatingBarIndicator(
                              textDirection: TextDirection.rtl,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4),
                              rating: ratep,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 13,
                              direction: Axis.horizontal,
                            ),
                          ),
                        ),
                      ),

                      Visibility(
                        visible: isVisible2,
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0)),
                          selected: true,
                          selectedTileColor: Colors.white70,
                          //selectedTileColor: Colors.white38,

                          title: Visibility(
                            visible: isVisible2,
                            child: Text(
                              "  تقيمك لصاحب المنتج   ",
                              textScaleFactor: 1,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          leading: Visibility(
                            visible: isVisible2,
                            child: RatingBarIndicator(
                              textDirection: TextDirection.rtl,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4),
                              rating: userRate,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 13,
                              direction: Axis.horizontal,
                            ),
                          ),
                          minLeadingWidth: double.minPositive,
                        ),
                      ),*/
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

  accept() async {
    String goodsId = widget.IDgoods;
    String receivergoodsId = "";
    String ownerGoods = "";

    await FirebaseFirestore.instance.collection('goods').doc(goodsId).get()
        //.then((value) => null)
        .then((ds) {
      receivergoodsId = ds.data()!['receiver goods'];
      ownerGoods = ds.data()!['owner'];
      goodRate = ds.data()!['rate'].toString();
    });
    await FirebaseFirestore.instance
        .collection('users')
        .doc(ownerGoods)
        .get()
        .then((ds) {
      FName = ds.data()!['FirstName'];

      LName = ds.data()!['LastName'];

      phoneN = ds.data()!['phoneN'];

      userName = ds.data()!['UserName'];
      userRateNum = double.parse(ds.get('NumRate'));
      userRate1 = double.parse(ds.get('rate1'));
      userRate2 = double.parse(ds.get('rate2'));
      userRate3 = double.parse(ds.get('rate3'));
      userRate4 = double.parse(ds.get('rate4'));
      userRate5 = double.parse(ds.get('rate5'));
    });
    if (goodRate == "0") {
      isVisible = true;
    } else {
      isVisible = false;
    }
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

  final _auth = FirebaseAuth.instance;
  rate(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.white70,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 30),
                Text(
                  "   قيّم المنتج   ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueGrey[900],
                  ),
                ),
                RatingBar.builder(
                    textDirection: TextDirection.rtl,
                    initialRating: ratep,
                    maxRating: 5,
                    minRating: 1,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4),
                    itemSize: 25,
                    updateOnDrag: true,
                    itemBuilder: (context, _) =>
                        Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (ratep) async {
                      setState(() {
                        this.ratep = ratep;
                      });
                      FirebaseFirestore firebaseFirestore =
                          FirebaseFirestore.instance;
                      User? user = _auth.currentUser;

                      goodsModel goodsmodel = goodsModel();

                      // writing  the values

                      goodsmodel.PRate = ratep;
                      String goodsId = widget.IDgoods;
                      final firebaseUser =
                          await FirebaseAuth.instance.currentUser;
                      if (ratep != null) {
                        if (firebaseUser != null)
                          await FirebaseFirestore.instance
                              .collection('goods')
                              .doc(goodsId)
                              .update({'rate': ratep});
                      }
                      ;
                    }),

                // Text("  التقيم هو $ratep "),
                SizedBox(height: 15),

                SizedBox(height: 15),
                Text(
                  "  قيّم صاحب المنتج  ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueGrey[900],
                  ),
                ),

                RatingBar.builder(
                    textDirection: TextDirection.rtl,
                    initialRating: userRate,
                    maxRating: 5,
                    minRating: 1,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4),
                    itemSize: 25,
                    updateOnDrag: true,
                    itemBuilder: (context, _) =>
                        Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (userRate) async {
                      if (ratep != 0) {
                        if (Rcount == false) {
                          setState(() {
                            print("this is the userRate $userRate");
                            this.userRate = userRate;
                            print("this is the num of r $userRateNum");
                            userRateNum = userRateNum + 1;
                          });

                          if (userRate == 1) {
                            userRate1 = userRate1 + 1;
                          }
                          if (userRate == 2) {
                            userRate2 = userRate2 + 1;
                          }
                          if (userRate == 3) {
                            userRate3 = userRate3 + 1;
                          }
                          if (userRate == 4) {
                            userRate4 = userRate4 + 1;
                          }
                          if (userRate == 5) {
                            userRate5 = userRate5 + 1;
                          }
                          AvgUserRate = (1 * userRate1 +
                                  2 * userRate2 +
                                  3 * userRate3 +
                                  4 * userRate4 +
                                  5 * userRate5) /
                              userRateNum;
                          String ur1 = userRate1.toString();
                          String ur2 = userRate2.toString();
                          String ur3 = userRate3.toString();
                          String ur4 = userRate4.toString();
                          String ur5 = userRate5.toString();
                          String urNum = userRateNum.toString();
                          String avgrate = AvgUserRate.toString();
                          FirebaseFirestore firebaseFirestore =
                              FirebaseFirestore.instance;
                          User? user = _auth.currentUser;

                          UserModel Usermodel = UserModel();

                          // writing  the values
                          print(avgrate);
                          double c = double.parse(avgrate);
                          int roundedRate = c.round();
                          print("rounded rate $roundedRate");
                          double DRR = roundedRate.toDouble();
                          Usermodel.Rate = DRR;
                          print(DRR);

                          String ownerId = widget.owner;
                          final firebaseUser =
                              await FirebaseAuth.instance.currentUser;
                          if (ratep != null) {
                            if (firebaseUser != null)
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(ownerId)
                                  .update({
                                'Rate': DRR,
                                'rate1': ur1,
                                'rate2': ur2,
                                'rate3': ur3,
                                'rate4': ur4,
                                'rate5': ur5,
                                'NumRate': urNum
                              });
                          }

                          setState(() {
                            isVisible = false;
                          });
                          if (ratep != null) {
                            FirebaseFirestore.instance
                                .collection('goods')
                                .where('owner', isEqualTo: ownerId)
                                .get()
                                .then((querySnapshot) {
                              querySnapshot.docs.forEach((documentSnapshot) {
                                documentSnapshot.reference
                                    .update({'ownerRate': DRR});
                              });
                            });
                          }

                          ;
                          Rcount = true;
                        } else {
                          if (Rcount == true) {
                            Fluttertoast.showToast(
                                msg: "لقد قيمت صاحب المنتج سابقاً !");
                          }
                        }
                      } else {
                        Icon(Icons.star, color: Colors.blue);
                        Fluttertoast.showToast(msg: " قيم  المنتج اولاً !");
                      }
                    }),
                SizedBox(height: 15),
                Divider(
                  height: 0.2,
                  color: Colors.grey,
                ),
                TextButton(
                  child: Text(
                    "تم",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    if (userRate != 0 && ratep != 0) {
                      Navigator.pop(context);
                      Fluttertoast.showToast(msg: " تم التقييم بنجاح");
                      setState(() {
                        isVisible = false;
                      });
                    } else if (userRate == 0 && ratep == 0)
                      Fluttertoast.showToast(
                          msg: " الرجاء التأكد من تقيم المنتج و صاحب المنتج!");
                    else if (userRate == 0)
                      Fluttertoast.showToast(msg: "تقيم صاحب المنتج مطلوب !");
                    else if (ratep == 0)
                      Fluttertoast.showToast(msg: "تقيم المنتج مطلوب !");
                  },
                )
              ],
            ),
          );
        });
  }
}
