import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_swap/constants.dart';
import 'package:first_swap/models/product.dart';
import 'package:first_swap/src/pages/Home_page.dart';
import 'package:first_swap/src/pages/bags.dart';
import 'package:first_swap/src/pages/clothes.dart';
import 'package:first_swap/src/pages/computer_category.dart';
import 'package:first_swap/src/pages/gym.dart';
import 'package:first_swap/src/pages/house.dart';
import 'package:first_swap/src/pages/kids_category.dart';
import 'package:first_swap/src/pages/perfume.dart';
import 'package:first_swap/src/pages/pet.dart';
import 'package:flutter/material.dart';
import 'package:first_swap/provider/my_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'Offers.dart';
import 'books_category.dart';

class Detailwaiting extends StatefulWidget {
  final String image;
  final String description;
  final String owner ;
  final String IDgoods ;

  final String name;
  final String cate;
  Detailwaiting(
      {required this.image,
        required this.name,
        required this.description,
        required this.owner,
        required this.cate,
        required this.IDgoods,

      });

  @override
  _Detailwaiting createState() => _Detailwaiting();

}
final db = FirebaseFirestore.instance;

class _Detailwaiting extends State<Detailwaiting> {

  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: Center(
            child: Text('معلومات المنتج   ', style: TextStyle(fontSize: 23))),
        leading: IconButton(
          onPressed: () {

            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => Offers()));

          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          elevation: 9,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(kDefaultPaddin),
                  // For  demo we use fixed height  and width
                  // Now we dont need them
                  // height: 180,
                  // width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Hero(
                    tag: "${widget.name}",
                    child: Image.network(widget.image),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  width: double.infinity,
                  // color: Colors.white,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        selected: true,
                        selectedTileColor: Colors.white70,
                        // selectedTileColor: Colors.white38,
                        leading:
                        Icon(Icons.production_quantity_limits_outlined),
                        title: Text(
                          " المنتج ",
                          textScaleFactor: 1,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        minLeadingWidth: double.minPositive,
                      ),
                      Divider(
                        height: 0.2,
                        color: Colors.grey,
                      ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        selected: true,
                        selectedTileColor: Colors.white70,
                        title: Text(
                          widget.name,
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        minLeadingWidth: double.minPositive,
                      ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        selected: true,
                        selectedTileColor: Colors.white70,
                        //selectedTileColor: Colors.white38,
                        title: Text(
                          " وصف المنتج ",
                          textScaleFactor: 1,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                        ),
                        minLeadingWidth: double.minPositive,
                      ),
                      Divider(
                        height: 0.2,
                        color: Colors.grey,
                      ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        selected: true,
                        selectedTileColor: Colors.white70,
                        title: Text(
                          widget.description,
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),

                        subtitle: Text(''),
                        isThreeLine: true,
                        minLeadingWidth: double.minPositive,
                      ),
                       Divider(
                        height: 0.2,
                        color: Colors.grey,
                      ),
                      ListTile(
                        shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(0.0)),
                        selected: true,
                        selectedTileColor: Colors.white70,
                        //selectedTileColor: Colors.white38,

                        leading:FlatButton(onPressed: () {
                          mygoods();

                        }, child: Column(

                          children: <Widget>[
                            Icon(Icons.launch , color: Colors.green ,size: 30,),






                          ],
                        ),

                        ),
                        title: Text(
                          "لقد أرسلت طلب تبادل على هذا المنتج",
                          textScaleFactor: 1,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                        ),
                        minLeadingWidth: double.minPositive,
                      ),
                      ElevatedButtonTheme(
                        data: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(minimumSize: Size(120,60))) ,
                        child: ButtonBar(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            
                            SizedBox(
                                width: 50),
                            new SizedBox(
                              width: 100.0,
                              height: 60.0,
                              child:RaisedButton(

                                child: Text('إلغاء الطلب',textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),

                                color: Colors.redAccent,
                                onPressed: () {
                                  reject();
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),

                                ),
                                elevation: 5,
                                padding: EdgeInsets.fromLTRB(20, 15, 2, 5),

                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //     children: [
                                //       Container(
                                //         margin: EdgeInsets.all(1.0),
                                //         padding: EdgeInsets.all(2.0),),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),

    );

  }
  accept() async

  {






    String goodsId =widget.IDgoods;
    String receivergoodsId="" ;
    String ownerGoods="";
    // print(widget.IDgoods);

    var status ="done";



    await FirebaseFirestore.instance.collection('goods').doc(goodsId)
        .update
      ({

      'Status':status

    });
    await FirebaseFirestore.instance
        .collection('goods')
        .doc(goodsId)
        .get()
    //.then((value) => null)
        .then((ds) {
      receivergoodsId = ds.data()!['receiver goods'];
      ownerGoods=ds.data()!['owner'];

    });
    await FirebaseFirestore.instance.collection('goods').doc(receivergoodsId)
        .update
      ({
'receiver goods':goodsId,
      'Status':status,
'receiverID':ownerGoods

    });

    QuerySnapshot querySnapshot = (await FirebaseFirestore.instance
        .collection('goods')
        .where("Status", isEqualTo:
    "waiting"
    )
        .where("receiver goods", isEqualTo:
    receivergoodsId
    )
        .get());

    querySnapshot.docs.forEach((element) {

      rejecOtherGoods(element.id);


    });


    Fluttertoast.showToast(msg: "تم قبول الطلب بنجاح!");




  }
  reject() async

  {



    String goodsId =widget.IDgoods;



    var status ="available";



    await FirebaseFirestore.instance.collection('goods').doc(goodsId)
        .update
      ({

      'Status':status,
      'receiver goods':'',
      'receiverID':''

    });





    Fluttertoast.showToast(msg: "تم إلغاء الطلب بنجاح !");



  }


  rejecOtherGoods(String ids) async

  {



    var status ="available";



    await FirebaseFirestore.instance.collection('goods').doc(ids)
        .update
      ({

      'Status':status,
      'receiver goods':'',
      'receiverID':''

    });





    Fluttertoast.showToast(msg: "تم رفض بقية الطلبات بنجاح !");




  }
  mygoods () async {
    var  myimage;
     

    var receivergoodsId;
    String goodsId =widget.IDgoods;
await FirebaseFirestore.instance
        .collection('goods')
        .doc(goodsId)
        .get()
    //.then((value) => null)
        .then((ds) {
      receivergoodsId = ds.data()!['receiver goods'];

    });







String mygoodsName='';

 await FirebaseFirestore.instance
        .collection('goods')
        .doc(receivergoodsId)
        .get()
        .then((ds) {
      mygoodsName = ds.data()!['gName'];
      myimage= ds.data()!['image'];


    });
// categoriesContainer1(myimage,mygoodsName);
      
        showDialog(





          
                  context: context,
                  builder: (BuildContext context) {
                  return AlertDialog( 


          title:Column(
          children:[
            Image.network(myimage,
              width: 200, height: 200, fit: BoxFit.cover

              ),
              SizedBox(
          height: 10,
        ),
            Text(mygoodsName,
            style: TextStyle(
            fontSize: 20,
            color: Colors.blueGrey[900],
          ),)
            ]
          ),
                  actions: <Widget>[
                  FlatButton(
                  child: new Text("تراجع",
                   style: TextStyle(
            fontSize: 20,
            color: Colors.blueGrey[900],
          ),),
                  onPressed: () {               
                   Navigator.of(context).pop();
                  },
                  ),
                 
                  ],
                  );
                  },
                  );
         

  }
   
}
