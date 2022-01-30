import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/fluttericon.dart';
import 'package:first_swap/models/goods.dart';
import 'package:first_swap/provider/my_provider.dart';
import 'package:first_swap/src/pages/Home_page.dart';
import 'package:first_swap/src/pages/bags.dart';
import 'package:first_swap/src/pages/books_category.dart';
import 'package:first_swap/src/pages/clothes.dart';
import 'package:first_swap/src/pages/computer_category.dart';
import 'package:first_swap/src/pages/gym.dart';
import 'package:first_swap/src/pages/perfume.dart';
import 'package:first_swap/src/pages/pet.dart';
import 'package:first_swap/src/pages/profile_page.dart';
import 'package:first_swap/src/widgets/bottom_Container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_swap/fluttericon.dart';
import 'package:first_swap/src/widgets/app_outlinebutton.dart';
import 'package:first_swap/src/widgets/app_textfield.dart';
import 'package:first_swap/themes.dart';
import 'package:provider/provider.dart';
import 'Intrests_page.dart';
import 'Post_page.dart';
import 'MyItems.dart';
import 'Offers.dart';
import 'details_page.dart';
import 'details_search.dart';
import 'house.dart';
import 'kids_category.dart';
import 'clothes.dart';
import 'gym.dart';
import 'bags.dart';
import 'pet.dart';
final db = FirebaseFirestore.instance;
final d01=db.collection('goods').snapshots();


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
      List<Product> searchList = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
appBar: AppBar(
  leading: IconButton(
    onPressed: () {

      Navigator.push(this.context,
          MaterialPageRoute(builder: (context) => HomePage()));

    },
    icon: Icon(Icons.arrow_back),
  ),
  backgroundColor: Colors.cyan[800],
  toolbarHeight: 145,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(60),
    ),
  ),
  title: Card(
    child: TextField(
      textAlign: TextAlign.right,
      decoration: InputDecoration(


        prefixIcon: Icon(Icons.search),hintText: 'البحث'  ),
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
        .where('Status',isEqualTo: 'available')
        .snapshots()
        :FirebaseFirestore.instance.collection('goods')
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


        onTap: () {
          //     (e) => BottomContainer(
          //     onTap: () {
          //   Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(
          //       builder: (context) => DetailPage(
          //         image: e.image,
          //         name: e.title,
          //         description: e.description,
          //         cate: e.cate,
          //         owner: e.owner,
          //         IDgoods: e.IDgoods,
          //         ownerRate: e.ownerRate,
          //         ownerName: e.ownerName,
          //       ),
          //     ),
          //   );
          // }, image: e.image, name: e.title
          //     );
if(data['owner']==uid){
  Navigator.push(this.context,
      MaterialPageRoute(builder: (context) => MyItems()));
}
else{
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => DetailSPage(
                        name: data['gName'],
                        owner: data['owner'],
                        image: data['image'],
                        ownerName: data['ownerName'],
                        description: data['Description'],
                        ownerRate: data['ownerRate'].toString(),
                        cate: data['cate'],
                        IDgoods: data.id,
                      ),
              ),
          );}


        },

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