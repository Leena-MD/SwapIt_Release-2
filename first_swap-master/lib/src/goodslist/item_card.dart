import 'package:first_swap/src/goodslist/body.dart';
import 'package:first_swap/src/pages/Home_page.dart';
import 'package:first_swap/src/pages/MyItems.dart';
import 'package:first_swap/src/pages/Offers.dart';
import 'package:first_swap/src/pages/Post_page.dart';
import 'package:first_swap/src/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:first_swap/fluttericon.dart';
import 'package:first_swap/src/widgets/app_outlinebutton.dart';
import 'package:first_swap/src/widgets/app_textfield.dart';
import 'package:first_swap/themes.dart';

import 'package:flutter/src/material/colors.dart';
import 'package:first_swap/src/pages/login_page.dart';
import 'package:first_swap/constants.dart';
import 'package:first_swap/models/goods.dart';



class ItemCard extends StatelessWidget {
  
  final Product product;
  //final Function press;
  const ItemCard({
     Key? key,
    required this.product,
    // required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
     
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
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
                tag: "${product.id}",
                child: Image.network(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              product.title,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "price",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}