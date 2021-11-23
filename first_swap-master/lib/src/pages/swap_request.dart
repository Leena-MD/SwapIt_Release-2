import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/models/goodsMod.dart';
import 'package:first_swap/src/pages/Home_page.dart';
import 'package:first_swap/src/pages/Post_page.dart';
import 'package:flutter/material.dart';
class swapRequest extends StatelessWidget {
final db = FirebaseFirestore.instance;
var a;
  String uiduser = '';
final FirebaseAuth auth = FirebaseAuth.instance;
void inputData() {
  final User? user = auth.currentUser;
  final uid = user!.uid;
}
   Future<void>  getUserList() async {
        final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          //.then((value) => null)
          .then((ds) {
        uiduser = ds.data()!['uid'];
      }).catchError((e) {
        print(e);
      });
    }

    
    List<goodsModel> posts = [];
    
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('goods')
        .where(
          "owner",
          isEqualTo: firebaseUser!.uid,
        )
        .get();}


        
@override
Widget build(BuildContext context) {


  final firebaseUser =  FirebaseAuth.instance.currentUser;
  if (firebaseUser != null) {
     FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .get()
    //.then((value) => null)
        .then((ds) {
      uiduser= ds.data()!['uid'];
    }).catchError((e) {
      print(e);
    });
  }
String userid= firebaseUser!.uid;


  
return Scaffold(

  
appBar: AppBar(
title: Text("منتجاتي  "),
centerTitle: true,
),
body: StreamBuilder<QuerySnapshot>

(
stream:

//querySnapshot

db.collection('goods').where("owner",isEqualTo: userid,).snapshots(),

builder: (context, snapshot) {
if (!snapshot.hasData) {
return const Center(
child: CircularProgressIndicator(),
);
}
else {

  getListViewItems(String item){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("؟"+item+"هل تريد تبديل"),
          actions: <Widget>[
            FlatButton(
              child: new Text("بدل"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: new Text("تراجع"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String _selectedIndex;
int index=1;

if (db.collection('goods').where("owner",isEqualTo: userid,).snapshots()!=null) {
  

  return ListView(

    children: snapshot.data!.docs.map((doc) =>  ListTile(

          title: Text(_selectedIndex=doc.data()['gName']),
          onTap: ()=>{
            getListViewItems(_selectedIndex)
          },



        ),
  ).toList(),
  );

}
else{
   return AlertDialog(
          title: new Text("!لايوجد لديك منتجات للتبادل بها"),
          actions: <Widget>[
            FlatButton(
              child: new Text("!يجب عليك إضافة منتج جديد "),
              onPressed: () {
        
                Navigator.of(context).pop();
              },
            ),
          
          ],
        );

  
}

}
},
),
);
}
}