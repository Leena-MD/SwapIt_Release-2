import 'package:flutter/material.dart';
class Offers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          iconList: [
            Icons.home,
            Icons.add_to_photos,
            Icons.search,
            Icons.reorder_rounded,
            Icons.person,
          ],
          onChange: (val) {
            setState(() {
              var _selectedItem = val;
            });
          },
          defaultSelectedIndex: 1,
        ),
        appBar: AppBar(
          backgroundColor: Color(0xff51878d),
          title: Center(child: Text('الطلبات', style: TextStyle(fontSize: 30))),

        ));
  }
}