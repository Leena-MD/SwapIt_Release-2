import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/models/goodsMod.dart';
import 'package:flutter/material.dart';
class NoteList extends StatelessWidget {
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
title: Text("my goods "),
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

  for (int i = 0; i < snapshot.data!.docs.length; i++) {
  DocumentSnapshot snap = snapshot.data!.docs[i];}


  return ListView(


    children: snapshot.data!.docs.map((doc) {
      return Card(

        child: new RadioListTile(

          title: Text(doc.data()['gName']),
          groupValue: null,
          onChanged: (Null? value) {  },
          value: null,


        ),
      );
    }).toList(),
  );
}
},
),
);
}
}

  @override
  Widget build(BuildContext context) {


        List<goodsModel> posts = [];

    // TODO: implement build
    throw UnimplementedError();
  }