import 'package:first_swap/fluttericon.dart';
import 'package:flutter/material.dart';
import 'package:first_swap/fluttericon.dart';
import 'package:first_swap/src/widgets/app_outlinebutton.dart';
import 'package:first_swap/src/widgets/app_textfield.dart';
import 'package:first_swap/themes.dart';
import 'Intrests_page.dart';






class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff7f7f7),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.grey[500],
          unselectedItemColor: Colors.grey[400],
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
           
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket), title: Text("Basket")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), title: Text("Profile")),
          ],
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
                                borderSide: BorderSide.none
                              ),
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
                       SizedBox(height: 30),
                       
                        Text("الفئات  ",  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19) ),
                        SizedBox(height: 30),
                      CategoryContainer(),
                      SizedBox(
                        height: 9,
                      ),
                      Divider(),
                      SizedBox(
                        height: 9,
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
           
            height: 150.0,
            child: ListView(
              
              scrollDirection: Axis.horizontal,
               reverse:true,
              children: <Widget>[

                   Container(
                     width: 120.0,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/bookshelf.png",
                      width: 50,
                    ),
                    SizedBox(height: 15),
                    Text("المستلزمات المكتبية و الكتب", textAlign: TextAlign.center)
                  ],
                ),
              ),
               Container(
                     width: 120.0,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/computer.png",
                      width: 50,
                    ),
                    SizedBox(height: 15),
                    Text("الأجهزة الالكترونية و ملحقاتها", textAlign: TextAlign.center)
                  ],
                ),
              ),
               
              Container(
                     width: 120.0,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/kitchen.png",
                      width: 50,
                    ),
                    SizedBox(height: 15),
                    Text("المنزل و المطبخ", textAlign: TextAlign.center)
                  ],
                ),
              ),
               
               Container(
                     width: 120.0,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/clothes-rack.png",
                      width: 50,
                    ),
                    SizedBox(height: 15),
                    Text("الملابس", textAlign: TextAlign.center)
                  ],
                ),
              ),
               
               Container(
                     width: 120.0,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/brick.png",
                      width: 50,
                    ),
                    SizedBox(height: 15),
                    Text("منتجات الأطفال و الألعاب", textAlign: TextAlign.center)
                  ],
                ),
              ),
               
               Container(
                     width: 120.0,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/dumbbell.png",
                      width: 50,
                    ),
                    SizedBox(height: 15),
                    Text("الرياضة و اللياقة", textAlign: TextAlign.center)
                  ],
                ),
              ),
               
               Container(
                     width: 120.0,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/handbag.png",
                      width: 50,
                    ),
                    SizedBox(height: 15),
                    Text("الاكسسوارات  و الحقائب و  الأحذية", textAlign: TextAlign.center)
                  ],
                ),
              ),
               
               Container(
                     width: 120.0,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/make-up.png",
                      width: 50,
                    ),
                    SizedBox(height: 15),
                    Text("الجمال و العطور", textAlign: TextAlign.center)
                  ],
                ),
              ),
               
               Container(
                     width: 120.0,
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
              ),
               

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
              height: 171,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                reverse:true,
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
      width: 251,
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
            bottom: 0,
            left: 0,
            child: Container(
              child: Image.asset(
                "assets/bookshelf.png",
                width: 121,
              ),
            ),
          ),
          Container(
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