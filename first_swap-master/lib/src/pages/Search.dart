import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/fluttericon.dart';
import 'package:first_swap/src/pages/Home_page.dart';
import 'package:first_swap/src/pages/bags.dart';
import 'package:first_swap/src/pages/books_category.dart';
import 'package:first_swap/src/pages/clothes.dart';
import 'package:first_swap/src/pages/computer_category.dart';
import 'package:first_swap/src/pages/gym.dart';
import 'package:first_swap/src/pages/perfume.dart';
import 'package:first_swap/src/pages/pet.dart';
import 'package:first_swap/src/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:first_swap/fluttericon.dart';
import 'package:first_swap/src/widgets/app_outlinebutton.dart';
import 'package:first_swap/src/widgets/app_textfield.dart';
import 'package:first_swap/themes.dart';
import 'Intrests_page.dart';
import 'Post_page.dart';
import 'MyItems.dart';
import 'Offers.dart';
import 'house.dart';
import 'kids_category.dart';
import 'clothes.dart';
import 'gym.dart';
import 'bags.dart';
import 'pet.dart';

final firebaseUser = FirebaseAuth.instance.currentUser;
final FirebaseAuth auth = FirebaseAuth.instance;

final User? user = auth.currentUser;

final uid = user!.uid;

class searchPage extends StatefulWidget {
  @override
  _searchPage createState() => _searchPage();
}

class _searchPage extends State<searchPage> {
      String name ="";

 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
appBar: AppBar(
  title: Card(
    child: TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),hintText: 'Search....'  ),
      onChanged: (val){
        
        setState(() {
        name=val;

      });}

    ),

  ),

),

body: StreamBuilder<QuerySnapshot>(

  

     stream: (name != "" && name != null )
     ? FirebaseFirestore.instance
       .collection('goods')
        .where('caseSearch',arrayContains: name)
       // .where('owner',isNotEqualTo: firebaseUser!.uid)
        .where('Status',isEqualTo: 'available')
        .snapshots()
        :FirebaseFirestore.instance.collection('goods')
       //        .where('owner',isEqualTo:   FirebaseAuth.instance.currentUser!.uid)
        //.orderBy("owner", descending: true)
        .where('Status',isNotEqualTo: 'available')
        
        .snapshots(),

        
    builder: (context, snapshot){


       return(snapshot.connectionState == ConnectionState.waiting)
    ?Center(child: CircularProgressIndicator())
    :ListView.builder(
    itemCount: snapshot.data!.docs.length,
    itemBuilder:(context,index){
      DocumentSnapshot data= snapshot.data!.docs[index];
      return Container(
    padding: EdgeInsets.only(top: 16),
    child: Column(
    children: [
      ListTile(
    title: Text(data['gName'],
    style: TextStyle(
    fontSize: 20,fontWeight: FontWeight.bold
    ),),
    leading: CircleAvatar(
    child: Image.network(
    data['image'],
    width:100,
    height: 50,
    fit: BoxFit.contain,
    ),
    radius:40,
    backgroundColor: Colors.white,
    ),
    

    onTap : () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => HomePage(),
        ),
      );
     
    }

    ),
    
    Divider(thickness: 2,)

    ],
    ),
    );

    }
    );
    },
   ),

    );


  }

}