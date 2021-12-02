import 'package:first_swap/constants.dart';
import 'package:first_swap/src/pages/Home_page.dart';
import 'package:first_swap/src/pages/SwapRequest.dart';
import 'package:first_swap/src/pages/bags.dart';
import 'package:first_swap/src/pages/clothes.dart';
import 'package:first_swap/src/pages/computer_category.dart';
import 'package:first_swap/src/pages/gym.dart';
import 'package:first_swap/src/pages/house.dart';
import 'package:first_swap/src/pages/kids_category.dart';
import 'package:first_swap/src/pages/perfume.dart';
import 'package:first_swap/src/pages/pet.dart';
import 'package:flutter/material.dart';
import 'package:first_swap/provider/my_provider.dart';
import 'package:provider/provider.dart';
import 'books_category.dart';

class DetailPage extends StatefulWidget {
  final String image;
  final String description;
  final String owner ;
  final String IDgoods ;

  final String name;
  final String cate;
  DetailPage(
      {required this.image,
      required this.name,
      required this.description,
      required this.owner,
      required this.cate,
      required this.IDgoods,
       });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: Center(
            child: Text('معلومات المنتج   ', style: TextStyle(fontSize: 23))),
        leading: IconButton(
          onPressed: () {
            if (widget.cate == "2") {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => houseK()));
            }
            if (widget.cate == "0") {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => ComputerCat()));
            }
            if (widget.cate == "1") {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => KidsCat()));
            }
            if (widget.cate == "3") {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => BooksCat()));
            }
            if (widget.cate == "4") {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => bags()));
            }
            if (widget.cate == "5") {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => perfume()));
            }
            if (widget.cate == "6") {
              Navigator.push(
                  this.context, MaterialPageRoute(builder: (context) => gym()));
            }
            if (widget.cate == "7") {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => clothes()));
            }
            if (widget.cate == "8") {
              Navigator.push(
                  this.context, MaterialPageRoute(builder: (context) => pet()));
            }
            if (widget.cate == "9") {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => HomePage()));
            }
            if (widget.cate == "42") {
              Navigator.push(this.context,
                  MaterialPageRoute(builder: (context) => HomePage()));
            }
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          color: Colors.white,
          shadowColor: Colors.grey,
          elevation: 9,
          child: Column(
            children: [
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
                    tag: "${widget.name}",
                    child: Image.network(widget.image),
                  ),
                ),
              ),
              /* Expanded( ////////old image style//////
                  child: Container(
                padding: EdgeInsets.only(top: 15.0),

                /*padding: EdgeInsets.symmetric(horizontal: 15),
            width: 250,
            height: 200,
            color: Colors.white,
            child: Image.network(
              widget.image,
              fit: BoxFit.scaleDown,
            ),*/
                alignment: Alignment.center,
                child: Container(
                  width: 300.0,
                  height: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                          image: NetworkImage(
                            widget.image,
                          ),
                          fit: BoxFit.fill)),
                ),
              )),*/
              SizedBox(height: 10),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  width: double.infinity,
                  // color: Colors.white,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        selected: true,
                        selectedTileColor: Colors.white70,
                        // selectedTileColor: Colors.white38,
                        leading:
                            Icon(Icons.production_quantity_limits_outlined),
                        title: Text(
                          " المنتج ",
                          textScaleFactor: 1,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        minLeadingWidth: double.minPositive,
                      ),
                      Divider(
                        height: 0.2,
                        color: Colors.grey,
                      ),   
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        selected: true,
                        selectedTileColor: Colors.white70,
                        title: Text(
                          widget.name,
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        minLeadingWidth: double.minPositive,
                      ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        selected: true,
                        selectedTileColor: Colors.white70,
                        //selectedTileColor: Colors.white38,
                        title: Text(
                          " وصف المنتج ",
                          textScaleFactor: 1,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                        ),
                        minLeadingWidth: double.minPositive,
                      ),
                      Divider(
                        height: 0.2,
                        color: Colors.grey,
                      ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        selected: true,
                        selectedTileColor: Colors.white70,
                        title: Text(
                          widget.description,
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        
                        subtitle: Text(''),
                        isThreeLine: true,
                        minLeadingWidth: double.minPositive,
                      ),
                      SizedBox(height: 15),
                      RaisedButton(
                        color: Colors.cyan[800],
                        onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => swapRequest(

                                    image: widget.image,
                                    name: widget.name,
                                    description: widget.description,
                                    cate: widget.cate,
                                    owner:widget.owner,
                                    IDgoods:widget.IDgoods,

                                  ),
                                ),
                              );
                            },
                        
                        
                  
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.swap_calls_rounded,
                              color: Colors.white,
                            ),
                            Text(
                              "بدّل",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
