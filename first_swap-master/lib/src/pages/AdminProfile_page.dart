import 'package:first_swap/src/pages/GoodsList.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/src/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'AdminHomePage.dart';

import 'MyItems.dart';
import 'UsersList.dart';
import 'login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Post_page.dart';

class AdminProfilePage extends StatefulWidget {
  @override
  _AdminProfilePageState createState() => _AdminProfilePageState();
}

class _AdminProfilePageState extends State<AdminProfilePage> {
  @override

  //  final collRef = FirebaseFirestore.instance.collection('users');

  String Email = '';
  String FName = '';
  String LName = '';
  String phoneN = '';
  String userName = '';
 

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

  Widget build(BuildContext context) {
    return SafeArea(
      //  home: Scaffold(

      child: Builder(
          builder: (context) => Scaffold(
                backgroundColor: Colors.white,
                bottomNavigationBar: CustomBottomNavigationBar(
                  iconList: [
                    // Icons.home,
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
                body: Center(
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                      future: _fetch(),
                      builder: (context, snapshot) {
                        //  if (snapshot.connectionState != ConnectionState.done)
                        //return Text("");
                        return buildName();
                      },
                    ),
                  ),
                ),
              )),
    );

//display userName,FName,LName,email,phoneN
  }

  Widget buildName() => Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                        "assets/Screen Shot 1443-03-02 at 6.09.18 PM.png"))),
          ),
        ),
        Container(
            child: Center(
          child: Text(
            '@' + userName,
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
          ),
        )),
        Container(
            child: ListTile(
          title: Text(
            "المعلومات الشخصية",
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 16),
          ),
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text(Email),
                ),
                Divider(
                  height: 0.6,
                  color: Colors.black87,
                ),

                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text(FName + ' ' + LName),
                ),
                Divider(
                  height: 0.6,
                  color: Colors.black87,
                ),

              
              
                Divider(
                  height: 0.6,
                  color: Colors.black87,
                ),

                //  const SizedBox(height: 24),
              ],
            ),
          ),
        ),
        const SizedBox(height: 65),
        const SizedBox(height: 65),
        const SizedBox(height: 65),
        Center(child: signOut()),
      ]);



  Widget signOut() {
    return InkWell(
      onTap: () {
        FirebaseAuth.instance.signOut();
        Navigator.push(
            this.context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
          color: Colors.cyan[800],
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "تسجيل الخروج",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
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

  //navigation bar
  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);

        setState(() {
          _selectedIndex = index;
          // if (_selectedIndex == 0)
          //   Navigator.push(this.context,
          //       MaterialPageRoute(builder: (context) => AdminHomePage()));
          if (_selectedIndex == 0)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => UsersList()));
          if (_selectedIndex == 1)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => GoodsList()));

          if (_selectedIndex == 2)
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
         //   if (index == 0) Text('الرئيسية'),
            if (index == 0) Text('المستخدمين'),
            if (index == 1) Text('المنتجات'),
            if (index == 2) Text('حسابي'),
          ],
        ),
      ),
    );
  }
}
