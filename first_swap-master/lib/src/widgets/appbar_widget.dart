import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_swap/src/pages/profile_page.dart';

AppBar buildAppBar(BuildContext context) {
 

  return AppBar(
  //  leading: BackButton(),
    //backgroundColor: Color(0xff51878d),
   // elevation: 0,
    

 leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
            
          },
        ),
 backgroundColor: Color(0xff51878d),




  );
}
