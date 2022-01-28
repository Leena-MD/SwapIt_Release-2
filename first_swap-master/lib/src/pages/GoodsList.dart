import 'package:first_swap/models/goods.dart';
import 'package:first_swap/src/widgets/bottom_Container.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/src/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'AdminHomePage.dart';
import 'package:first_swap/provider/my_provider.dart';
import 'AdminProfile_page.dart';
import 'MyItems.dart';
import 'UsersList.dart';
import 'login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Post_page.dart';

class GoodsList extends StatefulWidget {
  @override
  _GoodsListState createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {
  @override

  //  final collRef = FirebaseFirestore.instance.collection('users');

  String Email = '';
  String FName = '';
  String LName = '';
  String phoneN = '';
  String userName = '';
 List<Product> AllGoodsList = [];

  final FirebaseAuth auth = FirebaseAuth.instance;
  void inputData() {
    final User? user = auth.currentUser;
    final uid = user!.uid;
  }

  Future<void> _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) // the user sign in
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        Email = ds.data()!['email'];
        FName = ds.data()!['FirstName'];
        LName = ds.data()!['LastName'];
        phoneN = ds.data()!['phoneN'];
        userName = ds.data()!['UserName'];
   
      }).catchError((e) {
        print(e);
      });
  }

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
  
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    
provider.getAllGoods();
    AllGoodsList = provider.throwAllGoodsList;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: CustomBottomNavigationBar(
            iconList: [
             Icons.home,
                    Icons.people,
                    Icons.reorder_rounded,
                    Icons.person,
            ],
            onChange: (val) {
              setState(() {
                var _selectedItem = val;
              });
            },
            defaultSelectedIndex: 2,
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.cyan[800],
            title: Center(
                child:
                    Text('جميع المنتجات ', style: TextStyle(fontSize: 20))),
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
                child: AllGoodsList.isEmpty
                    ? Text(
                        " لا يوجد منتجات لهذه الفئة",
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
                        children: AllGoodsList
                            .map(
                              (e) => BottomContainer(
                                onTap: () {
                                 // Navigator.of(context).pushReplacement(
                                   // MaterialPageRoute(
                                    //  builder: (context) => DetailPage(
                                     //   image: e.image,
                                      //  name: e.title,
                                      //  description: e.description,
                                      //  cate: e.cate,
                                      //  owner: e.owner,
                                      //  IDgoods: e.IDgoods,
                                      //  ownerRate: e.ownerRate,
                                      //  ownerName: e.ownerName,
                                      //),
                                  //  ),
                                 // );
                                },
                                image: e.image,
                                name: e.title,
                              ),
                            )
                            .toList()),
              )
            ],
          )),
    );
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
                MaterialPageRoute(builder: (context) => AdminHomePage()));
          if (_selectedIndex == 1)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => UsersList()));
          if (_selectedIndex == 2)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => GoodsList()));

          if (_selectedIndex == 3)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => AdminProfilePage()));
         
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
            if (index == 1) Text('المستخدمين'),
            if (index == 2) Text('المنتجات'),
            if (index == 3) Text('حسابي'),
          ],
        ),
      ),
    );
  }
}
