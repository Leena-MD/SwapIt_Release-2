import 'package:first_swap/fluttericon.dart';
import 'package:first_swap/src/pages/books_category.dart';
import 'package:first_swap/src/pages/computer_category.dart';
import 'package:first_swap/src/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:first_swap/fluttericon.dart';
import 'package:first_swap/src/widgets/app_outlinebutton.dart';
import 'package:first_swap/src/widgets/app_textfield.dart';
import 'package:first_swap/themes.dart';
import 'Intrests_page.dart';
import 'Post_page.dart';
import 'MyItems.dart';
import 'Offers.dart';
import 'kids_category.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CustomBottomNavigationBar(
          iconList: [
            Icons.home,
            Icons.add_to_photos,
            Icons.add_a_photo,
            Icons.reorder_rounded,
            Icons.person,
          ],
          onChange: (val) {
            setState(() {
              var _selectedItem = val;
            });
          },
          defaultSelectedIndex: 0,
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 23,
                      top: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(30, 30),
                            bottomRight: Radius.elliptical(30, 30),
                          ),
                          color: Colors.cyan[800],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Spacer(),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(letterSpacing: 1.3),
                                children: [
                                  TextSpan(
                                    text: "بــــــدّل",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Text(
                              "قديم عندك جديد عند غيرك",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 1.3,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 20,
                      right: 20,
                      child: Container(
                        height: 57,
                        alignment: Alignment.center,
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide.none),
                              hintText: "البحث",
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.blue,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                padding: EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text("الفئات  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19)),
                      SizedBox(height: 20),
                      CategoryContainer(),
                      SizedBox(
                        height: 1,
                      ),
                      Divider(),
                      SizedBox(
                        height: 1,
                      ),
                      DealsContainer(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: SizedBox(
          height: 120.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            children: <Widget>[
               Container(
                 width: 120,
            child:  GestureDetector(
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => BooksCat())),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/bookshelf.png",
                      width: 50,
                    ),
                    SizedBox(height: 15),
                    Text("المستلزمات المكتبية و الكتب",
                        textAlign: TextAlign.center),
                  ],
            ),),
              ),
              Container(
                width: 120,
                   
            child:  GestureDetector(
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ComputerCat())),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/computer.png",
                      width: 50,
                    ),
                    SizedBox(height: 15),
                    Text("الأجهزة الالكترونية و ملحقاتها",
                        textAlign: TextAlign.center)
                  ],
            ),),
              ),

             Container(
                width: 120,
                   
            child:  GestureDetector(
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MyItems())),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/kitchen.png",
                      width: 50,
                    ),
                    SizedBox(height: 15),
                    Text("المنزل و المطبخ", textAlign: TextAlign.center)
                  ],
                ),    ),
              ),
            Container(
                width: 120,
                   
            child:  GestureDetector(
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MyItems())),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/clothes-rack.png",
                      width: 50,
                    ),
                    SizedBox(height: 15),
                    Text("الملابس", textAlign: TextAlign.center)
                  ],
                ),    ),
              ),
             Container(
                width: 120,
                   
            child:  GestureDetector(
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => KidsCat())),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/brick.png",
                      width: 50,
                    ),
                    SizedBox(height: 15),
                    Text("منتجات الأطفال و الألعاب",
                        textAlign: TextAlign.center)
                  ],
               ),   ),
              ),

            Container(
                width: 120,
                   
            child:  GestureDetector(
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MyItems())),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/dumbbell.png",
                      width: 50,
                    ),
                    SizedBox(height: 15),
                    Text("الرياضة و اللياقة", textAlign: TextAlign.center)
                  ],
               ),   ),
              ),
           Container(
                width: 120,
                   
            child:  GestureDetector(
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MyItems())),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/handbag.png",
                      width: 50,
                    ),
                    SizedBox(height: 15),
                    Text("الاكسسوارات  و الحقائب و  الأحذية",
                        textAlign: TextAlign.center)
                  ],
               ),   ),
              ),

             Container(
                width: 120,
                   
            child:  GestureDetector(
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MyItems())),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/make-up.png",
                      width: 50,
                    ),
                    SizedBox(height: 15),
                    Text("الجمال و العطور", textAlign: TextAlign.center)
                  ],
              ),  ),
              ),

            Container(
                width: 120,
                   
            child:  GestureDetector(
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MyItems())),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/pet-house.png",
                      width: 50,
                    ),
                    SizedBox(height: 15),
                    Text("مستلزمات الحيوان", textAlign: TextAlign.center)
                  ],
                ),
             ), ),
            ],
          ),
        ),
      ),
    );
  }
}

class DealsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details');
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                FlatButton(
                  child: Text(
                    "..المزيد",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 15),
                  ),
                  onPressed: () {},
                ),
                Spacer(),
                Text(
                  "قد يعجبك ايضاً",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ],
            ),
            SizedBox(
              height: 9,
            ),
            Container(
              height: 150,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemBuilder: (context, id) {
                  return SingleItem();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SingleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 205,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 3.0),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 20,
            right: 3,
            bottom: 3,
            left: 0,
            child: Container(
              child: Image.asset(
                "assets/bookshelf.png",
                width: 121,
                alignment: Alignment.center,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "كتب مستعملة",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
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
          if (_selectedIndex == 0)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => HomePage()));
          if (_selectedIndex == 1)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => MyItems()));
          if (_selectedIndex == 2)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => PostPage()));

          if (_selectedIndex == 3)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => Offers()));
          if (_selectedIndex == 4)
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
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
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              color: index == _selectedIndex ? Colors.black : Colors.grey,
            ),
            if (index == 0) Text('الرئيسية'),
            if (index == 1) Text('منتجاتي'),
            if (index == 2) Text('اضافة'),
            if (index == 3) Text('الطلبات'),
            if (index == 4) Text('حسابي'),
          ],
        ),
      ),
    );
  }
}
