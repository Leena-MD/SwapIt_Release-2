import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/models/goods.dart';
import 'package:first_swap/models/goodsMod.dart';
import 'package:first_swap/models/request.dart';
import 'package:first_swap/models/requestModel.dart';
import 'package:first_swap/provider/my_provider.dart';
import 'package:first_swap/src/pages/profile_page.dart';
import 'package:first_swap/src/widgets/bottom_Container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Post_page.dart';
import 'Home_page.dart';
import 'MyItems.dart';
import 'details_page.dart';
import 'details_requests.dart';
final firebaseUser =  FirebaseAuth.instance.currentUser;
String userid= firebaseUser!.uid;

class Offers extends StatefulWidget {

  _Offers createState() => _Offers();
}
@override

class _Offers extends State<Offers> {
  String receivergoods='';
  String receiverID='';
  String requeststatus='';
  String senderID='';
  String sendergoods='';

  final db = FirebaseFirestore.instance;

  String uiduser = '';
  // final rReqId = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  void inputData() {
    final User? user = auth.currentUser;
    final uid = user!.uid;
  }



  Future<bool> _fetchReq() async {
    final testo= db.collection('goods')
        .where("owner",isEqualTo: userid ,)
        .where("Status",isEqualTo:"available").snapshots();
    // فيه ايرور بالسناب شوت كابشن

    final myRequest=  db.collection('Requests')
        .where("receiverID",isEqualTo: userid )
        .where("request status",isEqualTo:"process")
        .snapshots();

    // QuerySnapshot myRequest = await
    // FirebaseFirestore.instance
    //       .collection('Requests')
    //       .where("receiverID", isEqualTo: userid)
    //       .where("request status",isEqualTo:"process")
    //       .get()

        ;
    if (myRequest==null) {

      //alert msj
      AlertDialog(
        title: new Text("!لم تصلك اي طلبات "),);
      print("لا توجد لديك طلبات");
      return  false;

    }else{

//   late  request Offers1;

//  myRequest.docs.forEach((element) {
//        Offers1 = request(

//         receivergoods:element.data()['receiver goods'],
//         receiverID:element.data()['receiverID'],
//         senderID:element.data()['sender ID'],
//         sendergoods:element.data()['sender goods'],
// requeststatus:element.data()['request status'],

//       );
//       //   db.collection('goods')
//       //  .where(db.collection('goods').id
//      // if (element.data()['sender goods'] == uiduser) {
//  //   db.collection('goods')
//       //  .where(db.collection('goods').id,isEqualTo:
//       //   (db.collection('Requests').doc('sender goods')))
//       //    .snapshots()

//     });

      //  _getGoodsReceiving();
      print("كففوو");

      return true;
    }
  }



  List<Product> GoodsList = [];

  late Product GoodsReceivingData;

  Future<void> _getGoodsReceiving() async {


    QuerySnapshot GoodsReceiving = await FirebaseFirestore.instance
        .collection('goods')
        .where((db.collection('goods').doc()),
        isEqualTo: sendergoods)
        .get()
        .catchError((e) {
      print(e);
    });;

    // if (GoodsReceiving==null) {

    //   print("لا تجد لديك طلبات");
    //   return false;

    // }
    List<Product> newGoodsList = [];

    GoodsReceiving.docs.forEach((element) {
      GoodsReceivingData = Product(
          image: element.data()['image'],
          title: element.data()['gName'],
          description: element.data()['Description'],
          status: element.data()['Status'],
          owner: element.data()['owner'],
          id: element.data()['owner'],
          cate: element.data()['cate'],
          IDgoods:element.id,

      );

      newGoodsList.add(GoodsReceivingData);
      GoodsList = newGoodsList;
    });
    //   notifyListeners();

  }
  get throwGoodsReceivingList {
    return GoodsList;
  }




  Widget build(BuildContext context)



  {
    //    _fetchReq();


    MyProvider provider = Provider.of<MyProvider>(context);

    provider.getGoodsReceiving();
    GoodsList = provider.throwGoodsReceivingList;


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
              automaticallyImplyLeading: false,
              backgroundColor: Colors.cyan[800],
              title: Center(
                  child: Text("المفروض عروضي او وات ايفر",
                      style: TextStyle(fontSize: 20))),
            ),
            body:
//            StreamBuilder<QuerySnapshot>
//         (stream:

// //querySnapshot

// db.collection('Requests')
//       .where("receiverID",isEqualTo: userid )
//      .where("request status",isEqualTo:"process")
//       .snapshots(),     //SendGoods.snapshots(),

//         builder: (context, snapshot) {
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [

                SingleChildScrollView(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // header(),
                      //  recipe(),
                      //   pizza(),
                      //    drink(),
                    ],
                  ),
                ),
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

                      children: GoodsList
                          .map(
                            (e) => BottomContainer(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => DetailRequest(// بغيرها تصير صفحه خاصه في القبول والخ
                                  image: e.image,
                                  name: e.title,
                                  description: e.description,
                                  cate: e.cate,
                                  owner:e.owner,
                                  IDgoods:e.IDgoods,


                                ),
                              ),
                            );
                          },
                          image: e.image,
                          name: e.title,
                        ),
                      )
                          .toList()),
                )
              ],
            )
          // throw UnimplementedError();
          //       }
        )
      //),

      //}else here{}

    );
  }




/*
     {

  return SafeArea(
      child: Builder(

        builder: (context) => Scaffold(
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
            defaultSelectedIndex:4,
          ),
          body:Center(

 child: SingleChildScrollView(
            child: FutureBuilder(
              future: _fetchReq(),
              builder: (context, snapshot) {

                //  if (snapshot.connectionState != ConnectionState.done)
                //return Text("");
                return buildOffers();

              },

            ),

          ),
 ),
        )  ),
        );
  }//bulid conext
*/




  Widget buildOffers()  => Column(


      children:

      <Widget>[



        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(



                image: DecorationImage(

                    fit: BoxFit.fitWidth,

                    image: AssetImage("assets/Screen Shot 1443-03-02 at 6.09.18 PM.png"))

            ),
          ),
        ),

        Container(
            child: Center(
              child: Text(

                '@'+ 'title',
                style: TextStyle(
                    color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
              ),)),
        Container(
            child:
            ListTile(
              title: Text(  "المعلومات الشخصية",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 16),

              ),)

        ),


        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4,
            child: Column(
              children: [

                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email'),

                ),
                Divider(
                  height: 0.6,
                  color: Colors.black87,
                ),

                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('FName'+' '+ 'LName'),
                ),
                Divider(
                  height: 0.6,
                  color: Colors.black87,
                ),

                const SizedBox(height: 8),

                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('phoneN'),
                ),
                Divider(
                  height: 0.6,
                  color: Colors.black87,
                ),

                //  const SizedBox(height: 24),










              ],





            ),

          ),

        ),
        const SizedBox(height: 20),
        // Center(child: MyInterest() ),
        const SizedBox(height: 20),

        // Center(child: buildUpgradeButton() ),
        const SizedBox(height: 23),

        //Center(child: signOut() ),
      ]


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