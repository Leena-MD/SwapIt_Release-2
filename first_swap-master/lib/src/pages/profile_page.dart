import 'package:first_swap/src/pages/Offers.dart';
import 'package:flutter/material.dart';

import 'package:first_swap/models/user_model.dart';
import 'package:first_swap/src/widgets/app_textfield.dart';
import 'package:first_swap/themes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:first_swap/src/widgets/appbar_widget.dart';
import 'package:first_swap/src/widgets/profile_widget.dart';
import 'package:first_swap/src/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'Home_page.dart';
import 'MyItems.dart';
import 'login_page.dart';
import 'edit_profile_page.dart';
import 'Intrests_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class ProfilePage extends StatefulWidget {





  @override
  _ProfilePageState createState() => _ProfilePageState();
}



class _ProfilePageState extends State<ProfilePage> {

  @override

  //  final collRef = FirebaseFirestore.instance.collection('users');

  String Email='';
  String FName='';
  String LName='';
  String phoneN='';
  String userName='';


  final FirebaseAuth auth = FirebaseAuth.instance;
  void inputData() {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    // here you write the codes to input the data into firestore
  }




  // CollectionReference users = FirebaseFirestore.instance.collection('users');

  final userRef= FirebaseFirestore.instance.collection('users');

  Future<void> _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;//(); شلتها لان تطلع لي ايرور
    if (firebaseUser != null)// the user sign in
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
      //.then((value) => null)
          .then((ds) {
        Email = ds.data()!['email'];
        print(Email);
        FName = ds.data()!['FirstName'];
        print(FName);
        LName = ds.data()!['LastName'];
        print(LName);
        phoneN = ds.data()!['phoneN'];
        print(phoneN);
        userName = ds.data()!['UserName'];
        print(userName);

      })
          .catchError((e) {
        print(e);
      });
  }

  //final LoginPage _auth = LoginPage();




  Widget build(BuildContext context) {



    return  Container(
      //  home: Scaffold(


      child: Builder(
        builder: (context) => Scaffold(

          bottomNavigationBar: CustomBottomNavigationBar(
            iconList: [
              Icons.home,
              Icons.add_to_photos,

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
            backgroundColor: Colors.transparent,
            elevation: 0,
            /*
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff51878d)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        */
          ),
          body:Center(




            child: FutureBuilder(

              future: _fetch(),
              builder: (context, snapshot) {
                //  if (snapshot.connectionState != ConnectionState.done)
                //return Text("");
                return buildName();
              },
            ),
          ),




          /*  ListView(
            physics: BouncingScrollPhysics(),
            children: [/*
              ProfileWidget(
                imagePath: user.imagePath,//
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
              ),done
              const SizedBox(height: 24),
              buildName(UserModel),
              const SizedBox(height: 24),
              Center(child: buildUpgradeButton()), */
            ],


          ),
          */


        ),



      ),

    );



//Uid,userName,FName,LName,email,phoneN
  }
  Widget buildName() => Column(


    children:

    <Widget>[
      const SizedBox(height: 18),
      SizedBox(
        //gh-1421@hotmail.com
        //Ghzh1234@
          height: 150,
          child: Image.asset(
            "assets/Screen Shot 1443-03-02 at 6.09.18 PM.png",
            //fit: BoxFit.contain,
            height: 1000,
            width:1000,
          )),

      Text(
        '@'+ userName,
        style: TextStyle(color: Color(0xff737373),fontSize: 18),
      ),
      const SizedBox(height: 8),
      Text(
        Email,style: TextStyle(color: Color(0xff737373),fontSize: 18),
      ),
      const SizedBox(height: 8),

      Text(
        FName+' '+LName,
        style: TextStyle(color: Color(0xff737373),fontSize: 18),
      ),
      /* Text(
            LName,
            style: TextStyle(color: Color(0xff737373)),
          ), */
      const SizedBox(height: 8),

      Text(
        phoneN,
        style: TextStyle(color: Color(0xff737373),fontSize: 18),
      ),

      //  const SizedBox(height: 24),

      const SizedBox(height: 20),
      Center(child: MyInterest() ),
      const SizedBox(height: 20),

      Center(child: buildUpgradeButton() ),
      const SizedBox(height: 20),

      Center(child: signOut() ),




      /*  FlatButton.icon(
              onPressed: () {

                FirebaseAuth.instance.signOut();
                Navigator.push(this.context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(
                Icons.person_outline,
                color: Color(0xff51878d),
              ),
              label: Text(
                'تسجيل خروج',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color:Color(0xff51878d)),
              )) */
    ],












  );



  Widget buildUpgradeButton() => ButtonWidget(

    text: 'تعديل الملف الشخصي',


    onClicked: () {

      Navigator.of(this.context).push(
        MaterialPageRoute(builder: (context) =>EditProfilePage()),// EditProfilePage()
      );
    },

  );


  Widget signOut() => ButtonWidget(

    text: 'تسجيل خروج',


    onClicked: () {


      FirebaseAuth.instance.signOut();
      Navigator.push(this.context,
          MaterialPageRoute(builder: (context) => LoginPage()));



    },

  );
  Widget MyInterest() => ButtonWidget(

    text: 'المفضلات',


    onClicked: ()  {

      Navigator.of(this.context).push(
        MaterialPageRoute(builder: (context) =>InterstsPage()),// EditProfilePage()
      );
    },

  );




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
          if(_selectedIndex==0)
            Navigator.push(
                this.context, MaterialPageRoute(builder: (context) => HomePage()));
                if(_selectedIndex==1)
            Navigator.push(
                this.context, MaterialPageRoute(builder: (context) => MyItems()));
                if(_selectedIndex==2)
            Navigator.push(
                this.context, MaterialPageRoute(builder: (context) => Offers()));
                if(_selectedIndex==3)
            Navigator.push(
                this.context, MaterialPageRoute(builder: (context) => ProfilePage()));

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
        child:

        Column (
          children: <Widget>[
            Icon(icon,

              color: index ==_selectedIndex ? Colors.black : Colors.grey,),


            if(index==0)
              Text('الرئيسية'),
            if(index==1)
              Text('منتجاتي'),

            if(index==2)
              Text('الطلبات'),
            if(index==3)
              Text('حسابي'),
          ],
        ),


      ),

    );
  }
}