import 'package:first_swap/src/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'EditItem.dart';
import 'MyItemCard.dart';
import 'MyItems.dart';
import 'Post_page.dart';
import 'Home_page.dart';
import 'Offers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyItems extends StatefulWidget {
  final db = FirebaseFirestore.instance;
  final String? userId;

  MyItems({Key? key, this.userId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyItems();
  }
}

class _MyItems extends State<MyItems> {
  @override
  Widget build(BuildContext context) {
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
        defaultSelectedIndex: 1,
      ),
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: Center(child: Text('منتجاتي', style: TextStyle(fontSize: 30))),
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: widget.db.collection('goods').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                if (doc.data()['owner'] ==
                    FirebaseAuth.instance.currentUser!.uid) {
                  if (doc.data()['Status'] == "done") {
                    return MyItemCard(
                      name: doc.data()['gName'],
                      image: doc.data()['image'],
                      description: doc.data()['Description'],
                      status: " تم التبديل",
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            builder: (context) => Container(
                                height: 170,
                                padding: EdgeInsets.symmetric(horizontal: 15) +
                                    EdgeInsets.only(bottom: 10),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 20),
                                        height: 5,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.black54,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          widget.db
                                              .collection('goods')
                                              .doc(doc.id)
                                              .delete();
                                          Fluttertoast.showToast(
                                              msg: 'تم حذف العنصر المحدد');
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.delete_outline_outlined,
                                                color: Color(0xFFFD691F),
                                                size: 28,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "حذف",
                                                style: TextStyle(
                                                    color: Color(0xFFFD691F),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          /*  Fluttertoast.showToast(
                                            msg: doc.id.toString()); */
                                          await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditItem(
                                                        docId: doc.id,
                                                        category: int.parse(doc
                                                            .data()['Category']
                                                            .toString()),
                                                        statues: doc
                                                            .data()['Status'],
                                                        numgood: int.parse(doc
                                                            .data()['numGood']
                                                            .toString()),
                                                        name:
                                                            doc.data()['gName'],
                                                        owner:
                                                            doc.data()['owner'],
                                                        cat: doc.data()['cate'],
                                                        desc: doc.data()[
                                                            'Description'],
                                                        image:
                                                            doc.data()['image'],
                                                      )));

                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.edit,
                                                color: Color(0xFF666666),
                                                size: 28,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "تعديل",
                                                style: TextStyle(
                                                    color: Color(0xFF666666),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ])));
                      },
                    );
                  } else if (doc.data()['Status'] == "waiting") {
                    return MyItemCard(
                      name: doc.data()['gName'],
                      image: doc.data()['image'],
                      description: doc.data()['Description'],
                      status: "قيد الانتظار",
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            builder: (context) => Container(
                                height: 170,
                                padding: EdgeInsets.symmetric(horizontal: 15) +
                                    EdgeInsets.only(bottom: 10),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 20),
                                        height: 5,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.black54,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          widget.db
                                              .collection('goods')
                                              .doc(doc.id)
                                              .delete();
                                          Fluttertoast.showToast(
                                              msg: 'تم حذف العنصر المحدد');
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.delete_outline_outlined,
                                                color: Color(0xFFFD691F),
                                                size: 28,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "حذف",
                                                style: TextStyle(
                                                    color: Color(0xFFFD691F),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          /*  Fluttertoast.showToast(
                                            msg: doc.id.toString()); */
                                          await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditItem(
                                                        docId: doc.id,
                                                        category: int.parse(doc
                                                            .data()['Category']
                                                            .toString()),
                                                        statues: doc
                                                            .data()['Status'],
                                                        numgood: int.parse(doc
                                                            .data()['numGood']
                                                            .toString()),
                                                        name:
                                                            doc.data()['gName'],
                                                        owner:
                                                            doc.data()['owner'],
                                                        cat: doc.data()['cate'],
                                                        desc: doc.data()[
                                                            'Description'],
                                                        image:
                                                            doc.data()['image'],
                                                      )));

                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.edit,
                                                color: Color(0xFF666666),
                                                size: 28,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "تعديل",
                                                style: TextStyle(
                                                    color: Color(0xFF666666),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ])));
                      },
                    );
                  } else {
                    return MyItemCard(
                      name: doc.data()['gName'],
                      image: doc.data()['image'],
                      description: doc.data()['Description'],
                      status: " ",
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            builder: (context) => Container(
                                height: 170,
                                padding: EdgeInsets.symmetric(horizontal: 15) +
                                    EdgeInsets.only(bottom: 10),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 20),
                                        height: 5,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.black54,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          widget.db
                                              .collection('goods')
                                              .doc(doc.id)
                                              .delete();
                                          Fluttertoast.showToast(
                                              msg: 'تم حذف العنصر المحدد');
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.delete_outline_outlined,
                                                color: Color(0xFFFD691F),
                                                size: 28,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "حذف",
                                                style: TextStyle(
                                                    color: Color(0xFFFD691F),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          /*  Fluttertoast.showToast(
                                            msg: doc.id.toString()); */
                                          await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditItem(
                                                        docId: doc.id,
                                                        category: int.parse(doc
                                                            .data()['Category']
                                                            .toString()),
                                                        statues: doc
                                                            .data()['Status'],
                                                        numgood: int.parse(doc
                                                            .data()['numGood']
                                                            .toString()),
                                                        name:
                                                            doc.data()['gName'],
                                                        owner:
                                                            doc.data()['owner'],
                                                        cat: doc.data()['cate'],
                                                        desc: doc.data()[
                                                            'Description'],
                                                        image:
                                                            doc.data()['image'],
                                                      )));

                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.edit,
                                                color: Color(0xFF666666),
                                                size: 28,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "تعديل",
                                                style: TextStyle(
                                                    color: Color(0xFF666666),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ])));
                      },
                    );
                  }
                } else {
                  return Center();
                }
              }).toList(),
            );
        },
      ),
    ));
  }

  showModal(BuildContext context, QueryDocumentSnapshot queryDocumentSnapshot,
      var instance) {}
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
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarMyItems = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarMyItems.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarMyItems,
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
