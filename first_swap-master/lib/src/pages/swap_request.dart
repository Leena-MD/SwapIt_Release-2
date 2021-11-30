// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:first_swap/models/goods.dart';
// import 'package:first_swap/models/goodsMod.dart';
// import 'package:first_swap/provider/my_provider.dart';
// import 'package:first_swap/src/pages/Home_page.dart';
// import 'package:first_swap/src/pages/Post_page.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';
// class swapRequest extends StatefulWidget {
//   final String image;
//   final String description;
//   final String owner ;
//   final String IDgoods ;
//   final String name;
//   final String cate;
//   swapRequest(
//       {
//         required this.image,
//         required this.name,
//         required this.description,
//         required this.owner,
//         required this.cate,
//         required this.IDgoods,
//       });

//   @override
//   _swapRequest createState() => _swapRequest();
// }


// class _swapRequest extends State<swapRequest> {

//   List<Product> RequestList = [];
 


//   final db = FirebaseFirestore.instance;

//   String uiduser = '';
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   void inputData() {
//     final User? user = auth.currentUser;
//     final uid = user!.uid;
//   }

//   @override
//   Widget build(BuildContext context) {


//     final firebaseUser =  FirebaseAuth.instance.currentUser;
//     if (firebaseUser != null) {
//       FirebaseFirestore.instance
//           .collection('users')
//           .doc(firebaseUser.uid)
//           .get()
//       //.then((value) => null)
//           .then((ds) {
//         uiduser= ds.data()!['uid'];
//       }).catchError((e) {
//         print(e);
//       });
//     }
//     String userid= firebaseUser!.uid;
  


//     return Scaffold(


//       appBar: AppBar(
//         title: Text("منتجاتي  "),
//         centerTitle: true,
//       ),
//       body: StreamBuilder<QuerySnapshot>

//         (stream:

// //querySnapshot

//         db.collection('goods').where("owner",isEqualTo: userid ,).where("Status",isEqualTo:"available").snapshots(),

//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(
//               child: CircularProgressIndicator(),//علامه التحميل للداتا
//             );
//           }
//           else {
//             String GoodsNameselected;
//             String GoodsIDselected;

//             int index=1;

            


// // builder: (context, snapshot) {
// //         if (snapshot.hasData) {
// //         return ListView.builder(
// //             itemCount: snapshot.data!.docs.length,
// //             itemBuilder: (context, index) {
// //                 DocumentSnapshot doc = snapshot.data!.docs[index];
// //                 return Text(doc['name']);
// //             });
// //         } else {
// //         return Text("No data");
// //         }
// //     };
//               return ListView(

//                 children: snapshot.data!.docs.map((doc) =>  ListTile(
                  

//                   title: Text(doc.data()['gName']),
//                //   Image.network( doc.data()['image']),
//                   onTap: ()=>{
            
//                   showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                   return AlertDialog(
//                   title: new Text("؟"+doc.data()['gName']+"هل تريد تبديل"),
//                   actions: <Widget>[
//                   FlatButton(
//                   child: new Text("بدل"),
//                   onPressed: () {
//                   SendRequest(doc.data()['gName'],doc.id);
//                   widget.owner;
//                   widget.IDgoods;
//                   Navigator.of(context).pop();
//                   },
//                   ),
//                   FlatButton(
//                   child: new Text("تراجع"),
//                   onPressed: () {
//                   Navigator.of(context).pop();
//                   },
//                   ),
//                   ],
//                   );
//                   },
//                   )
//                   },



//                 ),
//                 ).toList(),
//               );


//           }
//         },
//       ),
//     );
//   }
// //Future<void>
//   SendRequest(String name ,String ids) async

//   {
//     bool sameRequedt=true;
    
//     if (sameRequedt) {


//       var status ="waiting";

// //FirebaseFirestore.instance.collection('Requests').doc(id);
// // print(ids);




//       await FirebaseFirestore.instance.collection('goods').doc(ids)
//       .update// add
//      ({
 
//         'receiver goods':"${widget.IDgoods}",//widget.IDgoods
//         'receiverID': "${widget.owner}",//widget.owner
//         'Status':status,
//        // 'request status': status,
//      //   'sender ID': uiduser,
//       //  'sender goods': id,

//       });
//       // await FirebaseFirestore.instance.collection('goods').add({
//       //   'numReq': numReq,
//       // });

//       Fluttertoast.showToast(msg: "تم إرسال الطلب بنجاح!");

//       // Navigator.of(this.context).pushReplacement(
//       //     MaterialPageRoute(builder: (context) => HomePage()));



// // widget.owner;
// // widget.IDgoods;
//     }
//     if(sameRequedt==false){
//       print("object222222");

//       Fluttertoast.showToast(msg: "تم ارسال هذا الطلب مسبقا!");

//     }
//   }
 

// }

// @override
// Widget build(BuildContext context) {
//   // TODO: implement build
//   throw UnimplementedError();
// }