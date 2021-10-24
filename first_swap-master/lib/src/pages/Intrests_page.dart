import 'package:first_swap/fluttericon.dart';
import 'package:first_swap/src/pages/pick_item_title.dart';
import 'package:first_swap/src/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:first_swap/fluttericon.dart';
import 'package:first_swap/src/widgets/app_outlinebutton.dart';
import 'package:first_swap/src/widgets/app_textfield.dart';
import 'package:first_swap/themes.dart';
import 'package:first_swap/models/product.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:first_swap/src/pages/login_page.dart';

import 'Item.dart';

class InterstsPage extends StatefulWidget {
  @override
  State<InterstsPage> createState() => _InterstsPageState();
}


class _InterstsPageState extends State<InterstsPage> {
   List<Product> pickItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[dashBg, content],
      ),
    );
  }

  get dashBg => Column(
        children: <Widget>[
          Expanded(
            child: Container(color: Color(0xff51878d)),
            flex: 2,
          ),
          Expanded(
            child: Container(color: Colors.transparent),
            flex: 5,
          ),
        ],
      );

  get content => Container(
        child: Column(
          children: <Widget>[
            header,
            grid,
            footer,
          ],
        ),
      );

  get header => ListTile(
    contentPadding: EdgeInsets.only(left: 20, right: 20, top: 70),
    title: Text(
      'اختر مفضلاتك',
      style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.bold),
      textAlign: TextAlign.right,
      
    ),
    
    leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
  );

  get grid => Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: GridView.count(
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 2,
            childAspectRatio: .90,

children: [
                  ...List.generate(
                    productlist.length,
                    
                    (index) => Item(
                      product: productlist[index],
                      onSelected: (bool value) {
                        //take value
                        if (value) {
                          pickItems.remove(productlist[index]);
                        } else {
                          pickItems.add(productlist[index]);
                        }
                        //pass function
                        setState(() {});
                      },
                    ),
                  
                  )

                ],


          ),
         
        ),
       
      );
get footer => Container(

child:   FlatButton(
   
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () => {},
              color: Color(0xff51878d),
              padding: EdgeInsets.all(10.0),
              child: Wrap(
               
                // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  
                  
                  Icon(Icons.save , color: Colors.white),
                  Text(
                    "  حفظ   ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),

                ],

              ),),);


}

