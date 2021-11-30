import 'package:cloud_firestore/cloud_firestore.dart';

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

class request {
  final String 
  //receivergoods,
  //receiverID,
    // requeststatus,
    // senderID,
     sendergoods;

  request(
      {
      //   required this.receivergoods,
      //  required this.receiverID,
      //  required this.requeststatus,
      //   required this.senderID,
       required this.sendergoods,
});

}

