import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/models/goods.dart';
import 'package:first_swap/models/goodsMod.dart';
import 'package:first_swap/provider/my_provider.dart';
import 'package:first_swap/src/pages/Offers.dart';
import 'package:first_swap/src/pages/profile_page.dart';
import 'package:first_swap/src/widgets/bottom_Container.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'Post_page.dart';
import 'Home_page.dart';
import 'MyItems.dart';
import 'details_page.dart';
import 'details_requests.dart';
final firebaseUser =  FirebaseAuth.instance.currentUser;
String userid= firebaseUser!.uid;

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

  _swapRequest createState() => _swapRequest();
}
@override

class _swapRequest extends State<swapRequest> {
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




   List<Product> MyGoodsList = [];




  Widget build(BuildContext context)



  {
    

   
    MyProvider provider = Provider.of<MyProvider>(context);

    provider.getMyGoods();
    
      MyGoodsList = provider.throwMyGoodsList;

  
   if(MyGoodsList.isEmpty){

     print(":hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
    //return 
    Text("لاتوجد لديك منتجات للتبادل بها!");
   }

    return SafeArea(

        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.cyan[800],
              title: Center(
                  child: Text("منتجاتي",
                      style: TextStyle(fontSize: 20))),
              leading: IconButton(
                onPressed: () {

                  Navigator.push(this.context,
                      MaterialPageRoute(builder: (context) => DetailPage(image: widget.image,
                        name: widget.name,
                        description: widget.description,
                        cate: widget.cate,
                        owner:widget.owner,
                        IDgoods:widget.IDgoods,)));

                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            body:         
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

                      children: MyGoodsList

                          .map(
                            (e) => BottomContainer(
                          onTap: () {

showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog( 


          title:Column(
          children:[
            Image.network( e.image,
              width: 200, height: 200, fit: BoxFit.cover

              ),
              SizedBox(
          height: 10,
        ),
            Text(e.title,
            style: TextStyle(
            fontSize: 20,
            color: Colors.blueGrey[900],
          ),),
         Text("هل تريد التبديل به؟"),
            ]
          ),
                  actions: <Widget>[
                    SizedBox(width: 10,),
                    FlatButton(
                  child: new Text("بدل" ,textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 20,
                      color: Colors.white,

                    )
                  ),

                      color: Colors.cyan[800],
                  onPressed: () {
                  SendRequest(e.title,e.IDgoods);
                  // widget.owner;
                  // widget.IDgoods;
                  Navigator.of(context).pop();
                  },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),

                      ),
                  ),
                   SizedBox(width: 50,),
                  FlatButton(
                  child: new Text("تراجع",textAlign: TextAlign.center,
                   style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),),
                    color: Colors.orangeAccent,
                  onPressed: () {               
                   Navigator.of(context).pop();
                  },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),

                    ),
                  ),
                    SizedBox(width: 10,),
                 
                  ],
                  );



                  },
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
        )
    );
  }

  SendRequest(String name ,String ids) async

  {
   
    {


      var status ="waiting";

      await FirebaseFirestore.instance.collection('goods').doc(ids)
      .update
     ({
       
 
        'receiver goods':"${widget.IDgoods}",//widget.IDgoods
        'receiverID': "${widget.owner}",//widget.owner
        'Status':status,
       // 'request status': status,
     //   'sender ID': uiduser,
      //  'sender goods': id,

      });
             print(ids);
             print(widget.owner);
             print(name);
             print(widget.IDgoods);


      Fluttertoast.showToast(msg: "تم إرسال الطلب بنجاح!");

      Navigator.of(this.context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()));

    }
 
  }

}






