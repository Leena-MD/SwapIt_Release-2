import 'package:flutter/material.dart';
class Search extends StatelessWidget {
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
          title: Center(child: Text('البحث', style: TextStyle(fontSize: 30))),
        ),
        body: ListView(
          children: const <Widget>[
            Card(
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: "ابحث",
                  hintStyle: TextStyle(),
                ),
              ),
            ),
            Icon(
              Icons.search,
            ),
            Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xff51878d),
                    backgroundImage: AssetImage(
                        "images/1802 - Phone.png"), // no matter how big it is, it won't overflow
                  ),
                  title: Text(
                    'الكترونيات',
                    textAlign: TextAlign.right,
                  ),
                )),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xff51878d),
                  backgroundImage: AssetImage(
                      "images/1804 - Play Station.png"), // no matter how big it is, it won't overflow
                ),
                title: Text(
                  'أالعاب',
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xff51878d),
                  backgroundImage: AssetImage(
                      "images/1814 - Table Lamp.png"), // no matter how big it is, it won't overflow
                ),
                title: Text(
                  'أثاث',
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xff51878d),
                  backgroundImage: AssetImage(
                      "images/6_books.png"), // no matter how big it is, it won't overflow
                ),
                title: Text(
                  'كتب',
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xff51878d),
                  backgroundImage: AssetImage(
                      "images/JEWELRY.png"), // no matter how big it is, it won't overflow
                ),
                title: Text(
                  'اكسسوارات',
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                    backgroundColor: Color(0xff51878d),
                    backgroundImage: AssetImage("images/1402661.png")
                  // no matter how big it is, it won't overflow
                ),
                title: Text(
                  'الجمال',
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xff51878d),
                  backgroundImage: AssetImage(
                      "images/Ball 2 - Pentagons.png"), // no matter how big it is, it won't overflow
                ),
                title: Text(
                  'الرياضه واللياقة',
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xff51878d),
                  backgroundImage: AssetImage(
                      "images/Dress 2.png"), // no matter how big it is, it won't overflow
                ),
                title: Text(
                  'الملابس',
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xff51878d),
                  backgroundImage: AssetImage(
                      "images/1790 - Headphones.png"), // no matter how big it is, it won't overflow,(size: 72.0),
                ),
                title: Text(
                  'اكسسوارات إلكترونيه',
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ));
  }
}
