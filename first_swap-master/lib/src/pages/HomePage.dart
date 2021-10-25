import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
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
          title: Center(child: Text('الصفحه الرئيسيه', style: TextStyle(fontSize: 30))),
        ),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(top: 30),
          alignment: Alignment.topCenter,
          child: Text(
            "_______ الموصى به _______",
            style: TextStyle(
                fontSize: 23,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
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
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / _iconList.length,
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
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              color: index == _selectedIndex ? Colors.black : Colors.grey,
            ),
            if (index == 0) Text('الرئيسية'),
            if (index == 1) Text('منتجاتي'),
            if (index == 2) Text('البحث'),
            if (index == 3) Text('الطلبات'),
            if (index == 4) Text('حسابي'),
          ],
        ),
      ),
    );
  }
}