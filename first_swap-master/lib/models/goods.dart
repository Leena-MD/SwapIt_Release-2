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



class Product {
  final String image, title, description;
  final int  size, id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
   
    required this.description,
    required this.size,
    required this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Office Code",
      
      size: 12,
      description: dummyText,
      image: "assets/bookshelf.png",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Belt Bag",
      
      size: 8,
      description: dummyText,
      image: "assets/bookshelf.png",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Hang Top",
  
      size: 10,
      description: dummyText,
      image: "assets/bookshelf.png",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Old Fashion",
      
      size: 11,
      description: dummyText,
      image: "assets/bookshelf.png",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Office Code",
      
      size: 12,
      description: dummyText,
      image: "assets/bookshelf.png",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Office Code",

    size: 12,
    description: dummyText,
    image: "assets/bookshelf.png",
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";