import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/models/goods.dart';
import 'package:first_swap/models/goodsMod.dart';
import 'package:first_swap/provider/my_provider.dart';
import 'package:first_swap/src/pages/Home_page.dart';
import 'package:first_swap/src/pages/Post_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
class swapRequest extends StatefulWidget {
  final String image;
  final String description;
  final String owner ;
  final String IDgoods ;
  final String name;
  final String cate;
  swapRequest(
      {
        required this.image,
        required this.name,
        required this.description,
        required this.owner,
        required this.cate,
        required this.IDgoods,
      });

  @override
  _swapRequest createState() => _swapRequest();
}


class _swapRequest extends State<swapRequest> {

  List<Product> RequestList = [];
  Widget burger() {
    return Row(
      // children: RequestList
      //     .map((e) => categoriesContainer(
      //           image: e.image,
      //           name: e.title,

      //         ))
      //     .toList(),
    );
  }











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
        .get();






    querySnapshot.docs.forEach((element) {




      //    userModle = goodsModel(
      //   img: element.data()['image'],
      //       name: element.data()['gName'],
      //  description: element.data()['Description'],
      //  status: element.data()['Status'],
      //  owner: element.data()['owner'],
      //  id: element.data()['owner'],
      //  cate: element.data()['cate'],
      //     );
      // if (element.data()['owner'] != uiduser) {
      //  UserList.add(userModle);
      // UserList = UserList;
      //}

    });

  }



  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    //provider.


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
    final SendGoods = FirebaseFirestore.instance
        .collection('goods').where("owner",isEqualTo: userid ,).where("Status",isEqualTo:"available");



    return Scaffold(


      appBar: AppBar(
        title: Text("منتجاتي  "),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>

        (
        stream:

//querySnapshot

        db.collection('goods').where("owner",isEqualTo: userid ,).where("Status",isEqualTo:"available").snapshots(),
//SendGoods.snapshots(),

        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),//علامه التحميل للداتا
            );
          }
          else {

//             getListViewItems(String GoodsName,String id){
//               //id GoodsIDselected of sender
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: new Text("؟"+GoodsName+"هل تريد تبديل"),
//                     actions: <Widget>[
//                       FlatButton(
//                         child: new Text("بدل"),
//                         onPressed: () {
//                           print("i am here 1");
//                           SendRequest(GoodsName,id);
//                           widget.owner;
//                           widget.IDgoods;
//
//                           // getAllDocs() {
//                           //          const ref = this.db.collection('items');
//                           //          return ref.valueChanges({idField: 'customIdName'});
//                           //     }
//
//
//
// // db.collection('goods').add({
// //   ''
// // });
//
//
//                           Navigator.of(context).pop();
//                         },
//                       ),
//                       FlatButton(
//                         child: new Text("تراجع"),
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               );
//             }

            String GoodsNameselected;
            String GoodsIDselected;

            int index=1;

            if (db.collection('goods').where("owner",isEqualTo: userid,)
            .where("Status",isEqualTo:"available")
            .snapshots()!=null) {


              return ListView(

                children: snapshot.data!.docs.map((doc) =>  ListTile(

                  title: Text(doc.data()['gName']),
                  onTap: ()=>{
                    // _selectedIndex
//doc.data().doc.id,;

                    // GoodsIDselected=doc.id,
                  showDialog(
                  context: context,
                  builder: (BuildContext context) {
                  return AlertDialog(
                  title: new Text("؟"+doc.data()['gName']+"هل تريد تبديل"),
                  actions: <Widget>[
                  FlatButton(
                  child: new Text("بدل"),
                  onPressed: () {
                  print("i am here 1");
                  SendRequest(doc.data()['gName'],doc.id);
                  widget.owner;
                  widget.IDgoods;
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
                  )
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
//Future<void>
  SendRequest(String name ,String ids) async

  {
    bool sameRequedt=true;
     if(db.collection("Requests")
        .where("receiver goods",isEqualTo: "${widget.IDgoods}",)
        .where("receiverID",isEqualTo:"${widget.owner}",)
        .where("sender ID",isEqualTo:uiduser,)
        .where("sender goods",isEqualTo: ids,)
        ==null){
sameRequedt==false;
        };
    if (sameRequedt) {
print("object11");


      var status ="waiting";

//FirebaseFirestore.instance.collection('Requests').doc(id);
// print(ids);




      await FirebaseFirestore.instance.collection('goods').doc(ids)
      .update// add
     ({
 
        'receiver goods':"${widget.IDgoods}",//widget.IDgoods
        'receiverID': "${widget.owner}",//widget.owner
        'Status':status,
       // 'request status': status,
     //   'sender ID': uiduser,
      //  'sender goods': id,

      });
      // await FirebaseFirestore.instance.collection('goods').add({
      //   'numReq': numReq,
      // });

      Fluttertoast.showToast(msg: "تم إرسال الطلب بنجاح!");

      // Navigator.of(this.context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => HomePage()));



// widget.owner;
// widget.IDgoods;
    }
    if(sameRequedt==false){
      print("object222222");

      Fluttertoast.showToast(msg: "تم ارسال هذا الطلب مسبقا!");

    }
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}