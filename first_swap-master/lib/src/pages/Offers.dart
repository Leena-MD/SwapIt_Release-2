import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/models/goods.dart';
import 'package:first_swap/models/goodsMod.dart';
import 'package:first_swap/models/requestModel.dart';
import 'package:first_swap/provider/my_provider.dart';
import 'package:first_swap/src/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Post_page.dart';
import 'Home_page.dart';
import 'MyItems.dart';
class Offers extends StatefulWidget {

  _Offers createState() => _Offers();
}
  @override

  class _Offers extends State<Offers> {
    String? receivergoods;
    String? receiverID;
    String? requeststatus;
    String? senderID;
    String? sendergoods;


    _Offers(
        {this.receivergoods,
          this.receiverID,
          this.requeststatus,
          this.senderID,
          this.sendergoods,
        });

    // receiving data from server
    factory _Offers.fromMap(map) {
      return _Offers(
        receivergoods: map['receiver goods'],
        receiverID: map['receiverID'],
        requeststatus: map['request status'],
        senderID: map['sender ID'],
        sendergoods: map['sender goods'],

      );
    }

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

    String uiduser = '';
    final rReqId = '';
    final FirebaseAuth auth = FirebaseAuth.instance;
    void inputData() {
      final User? user = auth.currentUser;
      final uid = user!.uid;
    }
    Future<void>  getUserList() async {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Requests')
          .get();
      querySnapshot.docs.forEach((element) {
        String rReqId=element.id;
      });

      // DocumentSnapshot snapshot =
      // await db.collection('Requests').id.get();
      //  String myData = await snapshot.data['receiverID'];

      // final firebaseUser = await FirebaseAuth.instance.currentUser;
      // if (firebaseUser != null) {
      //   await FirebaseFirestore.instance
      //       .collection('users')
      //       .doc(firebaseUser.uid)
      //       .get()
      //   //.then((value) => null)
      //       .then((ds) {
      //     uiduser = ds.data()!['uid'];
      //   }).catchError((e) {
      //     print(e);
      //   });
      // }


      List<goodsModel> posts = [];

      // QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      //     .collection('goods')
      //     .where(
      //   "owner",
      //   isEqualTo: firebaseUser!.uid,
      // )
      //     .get();





      //
      // querySnapshot.docs.forEach((element) {
      //
      //
      //
      //
      //   //    userModle = goodsModel(
      //   //   img: element.data()['image'],
      //   //       name: element.data()['gName'],
      //   //  description: element.data()['Description'],
      //   //  status: element.data()['Status'],
      //   //  owner: element.data()['owner'],
      //   //  id: element.data()['owner'],
      //   //  cate: element.data()['cate'],
      //   //     );
      //   // if (element.data()['owner'] != uiduser) {
      //   //  UserList.add(userModle);
      //   // UserList = UserList;
      //   //}
      //
      // });

    }


    Widget build(BuildContext context) {
      MyProvider provider = Provider.of<MyProvider>(context);



      final firebaseUser =  FirebaseAuth.instance.currentUser;
      final firebasereq =  FirebaseAuth.instance;
      if (firebaseUser != null) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(firebaseUser.uid)
            .get()
            .then((ds) {
          uiduser= ds.data()!['uid'];
        }).catchError((e) {
          print(e);
        });
      }
      // if (firebasereq != null) {
      //   FirebaseFirestore.instance.collection('Requests')
      //       .get()
      //       .then((ds) {
      //     rReqId= ds.id;
      //   }).catchError((e) {
      //     print(e);
      //   });
      // }
      String userid= firebaseUser!.uid;
      final SendGoods = FirebaseFirestore.instance.collection('Requests').where("receiverID",isEqualTo: userid ,).where("request status",isEqualTo:"process");
  return SafeArea(
  child: Scaffold(

  backgroundColor: Colors.white,
  bottomNavigationBar: CustomBottomNavigationBar(
  iconList: [
  Icons.home,
  Icons.add_to_photos,
  Icons.add_a_photo,
  Icons.reorder_rounded,
  Icons.person,
  ],
  onChange: (val) {
  setState(() {
  var _selectedItem = val;
  });
  },
  defaultSelectedIndex: 3,
  ),

  appBar: AppBar(
  backgroundColor: Colors.cyan[800],
  title: Center(child: Text('الطلبات', style: TextStyle(fontSize: 30))),
  automaticallyImplyLeading: false,
  ),
      body: StreamBuilder<QuerySnapshot>

  (
  stream:

//querySnapshot

          db.collection('goods').where("owner",isEqualTo: (db.collection('Requests').doc('receiverID'))).snapshots(),

    builder: (context, snapshot) {
    
    
      if (!snapshot.hasData) {
        return new Text("Loading");
      }
      else {
//
//         getListViewItems(String GoodsName,String id){
//           //id GoodsIDselected of sender
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: new Text("؟"+GoodsName+"هل تريد تبديل"),
//                 actions: <Widget>[
//                   FlatButton(
//                     child: new Text("بدل"),
//                     onPressed: () {
//                       print("i am here 1");
//
//
//                       // getAllDocs() {
//                       //          const ref = this.db.collection('items');
//                       //          return ref.valueChanges({idField: 'customIdName'});
//                       //     }
//
//
//
// // db.collection('goods').add({
// //   ''
// // });
//
//
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                   FlatButton(
//                     child: new Text("تراجع"),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               );
//             },
//           );
//         }

        String GoodsNameselected;
        // String GoodsIDselected;
        print(rReqId+"hiiiii");
        // int index=1;(db.collection('Requests').doc('receiverID'))
        if (db.collection('goods').where("id",isEqualTo:sendergoods ).where(db.collection('Requests').where("receiverID",isEqualTo:uiduser )).snapshots()!=null) {
           return ListView(

    children: snapshot.data!.docs.map((doc) =>
        ListTile(

          title: Text(GoodsNameselected = doc.data()['gName']),
          subtitle: Text(doc.data()['Description']),
          onTap: () =>
          {
            // _selectedIndex
//doc.data().doc.id,;

            // GoodsIDselected=doc.id,
            //
            // getListViewItems(GoodsNameselected,GoodsIDselected)
          },


        ),
    ).toList(),
  );

        }
        else{
          return AlertDialog(
            title: new Text("!لم تصلك اي طلبات "),
            actions: <Widget>[


            ],
          );


        }

      }
      return Text("data");
    },
  ),
  ));
  }



  @override
  State<StatefulWidget> createState() {
  // TODO: implement createState
  throw UnimplementedError();
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
                this.context, MaterialPageRoute(builder: (context) => PostPage()));

                if(_selectedIndex==3)
            Navigator.push(
                this.context, MaterialPageRoute(builder: (context) => Offers()));
                if(_selectedIndex==4)
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
              Text('اضافة'),
            if(index==3)
              Text('الطلبات'),
            if(index==4)
              Text('حسابي'),
          ],
        ),


      ),

    );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
