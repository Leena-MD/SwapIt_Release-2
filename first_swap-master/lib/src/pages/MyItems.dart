import 'package:first_swap/src/pages/profile_page.dart';
import 'package:flutter/material.dart';

import 'Home_page.dart';
import 'Offers.dart';
class MyItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
        bottomNavigationBar: CustomBottomNavigationBar(
          iconList: [
            Icons.home,
            Icons.add_to_photos,
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
          backgroundColor: Colors.cyan[800],
          title: Center(child: Text('منتجاتي', style: TextStyle(fontSize: 30))),
        )
      );

  }

  void setState(Null Function() param0) {}
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
                this.context, MaterialPageRoute(builder: (context) => Offers()));
          if(_selectedIndex==3)
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
              Text('الطلبات'),
            if(index==3)
              Text('حسابي'),
          ],
        ),


      ),

    );
  }
}
