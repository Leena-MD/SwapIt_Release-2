import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_swap/models/goodsMod.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_swap/models/goods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/models/goods.dart';

import 'package:flutter/cupertino.dart';


class Menugoods extends StatefulWidget {
  @override
  _Menugoods1 createState() => _Menugoods1();
}

class _Menugoods1 extends State<Menugoods> {
   String uiduser = '';

///////////////////  category 1 ////////////////
  List<goodsModel> UserList = [];
  late goodsModel userModle;
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
        .get();



    querySnapshot.docs.forEach((element) {
      userModle = goodsModel(
     //   img: element.data()['image'],
        name: element.data()['gName'],
      //  description: element.data()['Description'],
      //  status: element.data()['Status'],
      //  owner: element.data()['owner'],
      //  id: element.data()['owner'],
      //  cate: element.data()['cate'],
      );
     // if (element.data()['owner'] != uiduser) {
        UserList.add(userModle);
        UserList = UserList;
      //}

    });
   // notifyListeners();
  }
  get throwUserList {
    UserList.toList();
    return UserList;
  }
  @override
  Widget build(BuildContext context) {
 //Widget build(BuildContext context) {
   getUserList();

   UserList = throwUserList;
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Pop Menu with List'),
      ),
      body:
      
       Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SingleChildScrollView(
                reverse: true,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                  //  header(),
                    //  recipe(),
                    //   pizza(),
                    //    drink(),
                  ],
                ),
              ),
        /*      Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 510,
                child: GridView.count(
                    shrinkWrap: false,
                    primary: false,
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 10,
                   children: UserList.toList()
                       ),
              )*/


                            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 510,
                child: GridView.count(
                    shrinkWrap: false,
                    primary: false,
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 10,
                    children:UserList
          .map((e) => categoriesContainer(
           //     image: e.image,
                name: e.name,
          
              ))
          .toList(),
              )
                             ) ],
          ));




    
  }
    Widget categoriesContainer({ required  name}) {
    return Column(
      children: [
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(left: 20),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
            //  image: DecorationImage(image: NetworkImage()),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        )
      ],
    );
  }
    Widget burger() {
    return Row(
      children: UserList
          .map((e) => categoriesContainer(
           //     image: e.image,
                name: e.name,
          
              ))
          .toList(),
    );
  }

//provider.getBookCategory();



    
    


    // TODO: implement build
 //   throw UnimplementedError();
  }
