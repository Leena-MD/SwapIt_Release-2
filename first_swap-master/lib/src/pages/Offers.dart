// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/models/goods.dart';
import 'package:first_swap/models/goodsMod.dart';
import 'package:first_swap/provider/my_provider.dart';
import 'package:first_swap/src/pages/profile_page.dart';
import 'package:first_swap/src/pages/waiting.dart';
import 'package:first_swap/src/widgets/bottom_Container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Post_page.dart';
import 'Home_page.dart';
import 'MyItems.dart';
import 'details_page.dart';
import 'details_requests.dart';
import 'history_page.dart';

final firebaseUser = FirebaseAuth.instance.currentUser;
String userid = firebaseUser!.uid;

class Offers extends StatefulWidget {
  _Offers createState() => _Offers();
}

@override
class _Offers extends State<Offers> {
  String receivergoods = '';
  String receiverID = '';
  String requeststatus = '';
  String senderID = '';
  String sendergoods = '';
  List<String> selectedCategory = [];
  String category1 = 'الطلبات';
  String category2 = ' الأرشيف';
  String category3 = 'قائمة الانتظار';
  bool index = true;
  final db = FirebaseFirestore.instance;

  String uiduser = '';
  // final rReqId = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  void inputData() {
    final User? user = auth.currentUser;
    final uid = user!.uid;
  }

  List<Product> GoodsList = [];

  Widget header() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding:
              EdgeInsets.only(top: 4.0, left: 0.0, right: 0.0, bottom: 6.0),
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 4.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          splashColor: Colors.cyan[100],
                          onTap: () {
                            selectedCategory = [];
                            selectedCategory.add(category1);

                            setState(() {});
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Offers()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 3.0, horizontal: 30.0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.blueGrey.withOpacity(0.3),
                                    Colors.blueGrey.withOpacity(0.015),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter),

                              borderRadius:
                                  BorderRadius.circular(0), // Creates border
                            ),
                            child: Text(
                              'الطلبات',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        InkWell(
                          splashColor: Colors.cyan[100],
                          onTap: () {
                            selectedCategory = [];
                            selectedCategory.add(category2);

                            setState(() {});
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => History()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 3.0, horizontal: 30.0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.blueGrey.withOpacity(0.3),
                                    Colors.blueGrey.withOpacity(0.015),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)),
                            ),
                            child: Text(
                              ' الأرشيف',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        InkWell(
                          splashColor: Colors.cyan[100],
                          onTap: () {
                            selectedCategory = [];
                            selectedCategory.add(category3);

                            setState(() {});
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => waiting()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 3.0, horizontal: 20.0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.blueGrey.withOpacity(0.3),
                                    Colors.blueGrey.withOpacity(0.015),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)),
                            ),
                            child: Text(
                              ' قائمة الانتظار',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);

    provider.getGoodsReceiving();

    GoodsList = provider.throwGoodsReceivingList;

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: CustomBottomNavigationBar(
              iconList: [
                Icons.home,
                Icons.add_to_photos,
                Icons.add_a_photo,
                Icons.reorder_rounded,
                Icons.person,
              ],
              onChange: (val) {
                setState(() {
                  var _selectedItem = val;
                });
              },
              defaultSelectedIndex: 3,
            ),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.cyan[800],
              title: Center(
                  child: Text("الطلبات", style: TextStyle(fontSize: 20))),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SingleChildScrollView(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      header(),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 510,
                  child: GoodsList.isEmpty
                      ? Text(
                          " لاتوجد لديك أي طلبات تبادل! ",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        )
                      : GridView.count(
                          shrinkWrap: false,
                          primary: false,
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 10,
                          children: GoodsList.map(
                            (e) => BottomContainer(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => DetailRequest(
                                      // بغيرها تصير صفحه خاصه في القبول والخ
                                      image: e.image,
                                      name: e.title,
                                      description: e.description,
                                      cate: e.cate,
                                      owner: e.owner,
                                      IDgoods: e.IDgoods,
                                      ownerName: e.ownerName,
                                      ownerRate: e.ownerRate,
                                    ),
                                  ),
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
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
      required this.iconList,
      required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);

        setState(() {
          _selectedIndex = index;
          if (_selectedIndex == 0)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => HomePage()));
          if (_selectedIndex == 1)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => MyItems()));
          if (_selectedIndex == 2)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => PostPage()));

          if (_selectedIndex == 3)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => Offers()));
          if (_selectedIndex == 4)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(this.context).size.width / _iconList.length,
        decoration: index == _selectedIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 4, color: Colors.blueGrey),
                ),
                gradient: LinearGradient(colors: [
                  Colors.blueGrey.withOpacity(0.3),
                  Colors.blueGrey.withOpacity(0.015),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)

                //color: index == _selectedItemIndex ? Colors.green : Colors.white,

                )
            : BoxDecoration(),
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              color: index == _selectedIndex ? Colors.black : Colors.grey,
            ),
            if (index == 0) Text('الرئيسية'),
            if (index == 1) Text('منتجاتي'),
            if (index == 2) Text('اضافة'),
            if (index == 3) Text('الطلبات'),
            if (index == 4) Text('حسابي'),
          ],
        ),
      ),
    );
  }
}
