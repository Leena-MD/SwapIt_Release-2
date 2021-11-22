import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/models/goodsMod.dart';
import 'package:flutter/material.dart';
class NoteList extends StatelessWidget {
final db = FirebaseFirestore.instance;
  String uiduser = '';

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
          isEqualTo: 'uid',
        )
        .get();}


        
@override
Widget build(BuildContext context) {





  
return Scaffold(

  
appBar: AppBar(
title: Text("my goods "),
centerTitle: true,
),
body: StreamBuilder<QuerySnapshot>

(
stream: 

//querySnapshot

db.collection('goods').where("owner",isEqualTo: 'uid',).snapshots(),






builder: (context, snapshot) {
if (!snapshot.hasData) {
return Center(
child: CircularProgressIndicator(),
);
} else
return ListView(

children: snapshot.data!.docs.map((doc) {
return Card(
child: ListTile(
title: Text(doc.data()['gName']),
),
);
}).toList(),
);
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