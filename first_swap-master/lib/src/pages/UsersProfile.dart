import 'package:first_swap/src/pages/Offers.dart';
import 'package:first_swap/src/pages/Post_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/src/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Home_page.dart';
import 'MyItems.dart';
import 'UsersList.dart';
import 'login_page.dart';
import 'edit_profile_page.dart';
import 'Intrests_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Post_page.dart';

class UsersProfile extends StatefulWidget {
    final String FirstName;
   final String LastName;
  final String UserName;
  final String email;
  final String phoneN;
  final String uid;
  final String NumRate;
  final String Rate;
  final bool Blacklist;
 
  UsersProfile({
    required this.FirstName,
    required this.LastName,

    required this.UserName,
    required this.email,
    required this.phoneN,
    required this.uid,
    required this.NumRate,
    required this.Rate,
   required this.Blacklist
  });

  @override
  _UsersProfileState createState() => _UsersProfileState();
}

class _UsersProfileState extends State<UsersProfile> {
  @override


  final FirebaseAuth auth = FirebaseAuth.instance;
  void inputData() {
    final User? user = auth.currentUser;
    final uid = user!.uid;
  }

 
  Widget build(BuildContext context) {
  
    return SafeArea(
      //  home: Scaffold(
        

      child: Builder(
          builder: (context) => Scaffold(
                backgroundColor: Colors.white,
                appBar:  AppBar(backgroundColor: Colors.cyan[800],
                  leading: IconButton(
                  
          onPressed: () {

              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => UsersList()));

          },
          icon: Icon(Icons.arrow_back,
          color:Colors.white,
        ),
)),

                body: Center(
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                     // future: _fetch(),
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
            '@' + widget.UserName,
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
                  title: Text(widget.email),
                ),
                Divider(
                  height: 0.6,
                  color: Colors.black87,
                ),

                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text(widget.FirstName + ' ' + widget.LastName),
                ),
                Divider(
                  height: 0.6,
                  color: Colors.black87,
                ),

                const SizedBox(height: 8),

                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(widget.phoneN),
                ),
                Divider(
                  height: 0.6,
                  color: Colors.black87,
                ),
                ListTile(
                  leading: Icon(
                    Icons.star,
                  ),
                  title: Text(widget.Rate.toString() + "/5"),
                  subtitle: Text(" مستخدم "+"("+widget.NumRate+")"),
                ),
                Divider(
                  height: 0.6,
                  color: Colors.black87,
                ),

              ],
            ),
          ),
        ),
     //  (widget.Blacklist==false)?
Visibility(
              visible: widget.Blacklist==false,
              child: Container(
                height: 100.0,
                
                child: 
        ElevatedButtonTheme(
                        data: ElevatedButtonThemeData(
                          
                            style: ElevatedButton.styleFrom(
                               alignment: Alignment.center,
                                minimumSize: Size(120, 60))),
                        child: ButtonBar(
                         
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RaisedButton(
                              
                              color: Colors.deepOrange,
                              onPressed: () {
                                blockUser();
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 5,
                              padding: EdgeInsets.fromLTRB(54, 6, 54, 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  
                                  Text(
                                    "حظر المستخدم",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
              ),
            ),

         Visibility(
              visible: widget.Blacklist,
              child: Container(
                height: 100.0,
                child:  ElevatedButtonTheme(
                        data: ElevatedButtonThemeData(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(120, 60))),
                        child: ButtonBar(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RaisedButton(
                              color: Colors.green,
                              onPressed: () {
                                unblock();
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 5,
                              padding: EdgeInsets.fromLTRB(54, 6, 54, 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " إلغاء حظر المستخدم ",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),

         
        
      ]
      );
 blockUser() async {

bool BL=true;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .update({'Blacklist': true
       });

    Fluttertoast.showToast(msg: "تم حظر المستخدم بنجاح !");


       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where("owner", isEqualTo: widget.uid)
        .where(
          "Status",
          isEqualTo: 'available',
        )
        .get();
querySnapshot.docs.forEach((element) {

FirebaseFirestore.instance
        .collection('goods').doc(element.id).update({'Status': 'blocked',});

    });





    Navigator.of(this.context)
        .pushReplacement(MaterialPageRoute(builder: (context) => UsersList()));
  }
 unblock() async {

    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .update({'Blacklist': false
       });

    Fluttertoast.showToast(msg: "تم  إلغاء حظر المستخدم بنجاح !");

       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where("owner", isEqualTo: widget.uid)
        .where(
          "Status",
          isEqualTo: 'blocked',
        )
        .get();
querySnapshot.docs.forEach((element) {

FirebaseFirestore.instance
        .collection('goods').doc(element.id).update({'Status': 'available',});

    });



    Navigator.of(this.context)
        .pushReplacement(MaterialPageRoute(builder: (context) => UsersList()));
  }

 


}


 