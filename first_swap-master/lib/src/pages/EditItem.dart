import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_swap/models/goodsMod.dart';
import 'package:first_swap/src/pages/Home_page.dart';
import 'package:first_swap/src/pages/MyItems.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'image_storage.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

String userID = "";
int num = 1;

class EditItem extends StatefulWidget {
  final String? docId;
  final String? name;
  final String? cat;
  final String? desc;
  final String? image;
  final int? category;
  final String? statues;
  final int? numgood;
  final String? owner;
  const EditItem(
      {Key? key,
      this.name,
      this.cat,
      this.desc,
      this.image,
      this.category,
      this.statues,
      this.numgood,
      this.owner,
      this.docId})
      : super(key: key);
  @override
  _EditItem createState() => _EditItem();
}

class _EditItem extends State<EditItem> {
  final _formKey = GlobalKey<FormState>();
  final Storage storage = Storage();

  String _currentSelectedValue = "one";
  int _value = 42;
  String cate = "42", owner = "", numGood = "", status = "", doc = "";

  String imagePath = "";
  String imageName = "";
  bool Path = false;

  final picker = ImagePicker();

  final goodName = new TextEditingController();
  final goodDesc = new TextEditingController();
  final GoodsCController = new TextEditingController();
  final GoodMController = new TextEditingController();

  @override
  void initState() {
    cate = "42";
    doc = widget.docId.toString();
    numGood = widget.numgood.toString();
    status = widget.statues.toString();
    owner = widget.owner.toString();
    goodName.text = widget.name.toString();
    goodDesc.text = widget.desc.toString();
    cate = widget.cat.toString();
    imagePath = widget.image.toString();
    Path = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var studentNumberController;
    var validateStudentNumber;
    var studentEmailController;
    var studentPhoneNumberController;
    var queryController;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.cyan[800],
          title:
              Center(child: Text('تعديل منتج', style: TextStyle(fontSize: 30))),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
            top: false,
            bottom: false,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 15.0, bottom: 15.0, left: 17.0, right: 17.0),
                      child: Card(
                        elevation: 9,
                        child: Form(
                            key: _formKey,
                            child: ListView(
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 15.0,
                                      bottom: 15.0,
                                      left: 17.0,
                                      right: 17.0),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                      autofocus: false,
                                      textAlign: TextAlign.right,
                                      controller: goodName,
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyle(
                                          fontSize: 16.0, color: Colors.black),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        hintText: 'اسم المنتج',
                                        labelText: 'اسم المنتج',
                                      ),
                                      validator: (value) {
                                        RegExp regex = new RegExp(r'^.{3,15}$');
                                        if (value!.isEmpty) {
                                          return ("*الحقل مطلوب");
                                        }
                                        if (!regex.hasMatch(value)) {
                                          return ("اسم المنتج حد أدنى ٣ واعلى ١٥ ");
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        goodName.text = val!;
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 15.0,
                                        bottom: 15.0,
                                        left: 17.0,
                                        right: 17.0),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: FormField(
                                        builder: (FormFieldState state) {
                                          return InputDecorator(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              labelText: 'الفئة',
                                              hintText: ("الفئة"),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0,
                                                  bottom: 0,
                                                  left: 17.0,
                                                  right: 17.0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: ButtonTheme(
                                                    alignedDropdown: true,
                                                    child:
                                                        DropdownButtonFormField(
                                                            icon: Icon(Icons
                                                                .category_outlined),
                                                            isDense: true,
                                                            isExpanded: true,
                                                            value: cate,
                                                            items: <
                                                                DropdownMenuItem<
                                                                    String>>[
                                                              new DropdownMenuItem(
                                                                child: new Text(
                                                                    'اختر فئة المنتج'),
                                                                enabled: false,
                                                                value: '42',
                                                              ),
                                                              new DropdownMenuItem(
                                                                child: new Text(
                                                                    'الأجهزة الإلكترونية و ملحقاتها'),
                                                                value: '0',
                                                              ),
                                                              new DropdownMenuItem(
                                                                child: new Text(
                                                                    'منتجات الأطفال و الألعاب'),
                                                                value: '1',
                                                              ),
                                                              new DropdownMenuItem(
                                                                child: new Text(
                                                                    'المنزل و المطبخ'),
                                                                value: '2',
                                                              ),
                                                              new DropdownMenuItem(
                                                                child: new Text(
                                                                    'المستلزمات المكتبية و الكتب'),
                                                                value: '3',
                                                              ),
                                                              new DropdownMenuItem(
                                                                child: new Text(
                                                                    'الاكسسوارات و الحقائب و الأحذية'),
                                                                value: '4',
                                                              ),
                                                              new DropdownMenuItem(
                                                                child: new Text(
                                                                    'الجمال والعطور'),
                                                                value: '5',
                                                              ),
                                                              new DropdownMenuItem(
                                                                child: new Text(
                                                                    'الرياضة و اللياقة'),
                                                                value: '6',
                                                              ),
                                                              new DropdownMenuItem(
                                                                child: new Text(
                                                                    ' الملابس'),
                                                                value: '7',
                                                              ),
                                                              new DropdownMenuItem(
                                                                child: new Text(
                                                                    'مستلزمات الحيوان '),
                                                                value: '8',
                                                              ),
                                                              new DropdownMenuItem(
                                                                child: new Text(
                                                                    'اخرى'),
                                                                value: '9',
                                                              ),
                                                            ],
                                                            validator: (value) =>
                                                                value == '42'
                                                                    ? 'الحقل مطلوب *'
                                                                    : null,
                                                            onChanged: (String?
                                                                value) {
                                                              setState(() {
                                                                cate = value!;
                                                              });
                                                            }),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 15.0,
                                      bottom: 15.0,
                                      left: 17.0,
                                      right: 17.0),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                      maxLines: 4,
                                      autofocus: false,
                                      textAlign: TextAlign.right,
                                      controller: goodDesc,
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyle(
                                          fontSize: 16.0, color: Colors.black),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        hintText: 'وصف المنتج',
                                        labelText: 'وصف المنتج',
                                      ),
                                      validator: (value) {
                                        RegExp regex =
                                            new RegExp(r'^.{10,200}$');
                                        if (value!.isEmpty) {
                                          return ("*الحقل مطلوب");
                                        }
                                        if (!regex.hasMatch(value)) {
                                          return ("اسم المنتج حد أدنى و اعلى ٢٠٠ ");
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        goodDesc.text = val!;
                                      },
                                    ),
                                  ),
                                ),
                                new ListTile(
                                  leading: new Icon(Icons.image),
                                  title: new Text(
                                    'مكتبة الصور',
                                    textAlign: TextAlign.right,
                                  ),
                                  onTap: () async {
                                    final pickedFile = await picker.getImage(
                                        source: ImageSource.gallery);

                                    if (pickedFile != null) {
                                      setState(() {
                                        imagePath = pickedFile.path;
                                        imageName = goodName.text;
                                        Path = true;
                                      });
                                    }
                                  },
                                ),
                                imagePath == widget.image
                                    ? Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Image.network(
                                          imagePath,
                                        ),
                                      )
                                    : Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Image.file(File(imagePath)),
                                      ),
                                Container(
                                  margin: EdgeInsets.only(top: 6.0, bottom: 5),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Color(0xFF008ECC),
                                        offset: Offset(0.0, 0.0),
                                        //blurRadius: 20.0,
                                      ),
                                      BoxShadow(
                                        color: Color(0xFF008ECC),
                                        offset: Offset(0.0, 0.0),
                                        //blurRadius: 20.0,
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFFFFFFF),
                                          Color(0xFFFFFFFF),
                                        ],
                                        begin: FractionalOffset(0.2, 0.2),
                                        end: FractionalOffset(1.0, 1.0),
                                        stops: [0.0, 1.0],
                                        tileMode: TileMode.clamp),
                                  ),
                                  height: 60.0,
                                  padding: const EdgeInsets.all(10.0),
                                  child: RaisedButton.icon(
                                    color: Colors.cyan[800],
                                    label: Text(
                                      "",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    icon: Icon(
                                      Icons.system_update,
                                      size: 30.0,
                                    ),
                                    onPressed: () {
                                      if (submitAction(context) == true) {
                                        num = num + 1;
                                      } else {
                                        num = num;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  String url = "";

  String uiduser = userID = FirebaseAuth.instance.currentUser!.uid;
  String st = "available";
  update(String doc, String name, String des, int cat, String url,
      String userID, int num, String st, String cate, bool path) async {
    final _auth = FirebaseAuth.instance;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    this.url = url;
    goodsModel goodsMo = goodsModel();

    goodsMo.name = goodName.text;
    goodsMo.desc = goodDesc.text;
    goodsMo.cat = _value;
    goodsMo.img = url;
    goodsMo.gnum = num;
    goodsMo.stat = st;
    goodsMo.own = uiduser;
    goodsMo.cate = cate;

    final firebaseUser = await FirebaseAuth.instance.currentUser;

    if (_formKey.currentState!.validate()) {
      if (Path == true) {
        storage.uploadImage(imagePath, imageName).then((value) => url = value);
        url = await Storage().uploadImage(imagePath, imageName);
        print("1");
      } else if (imagePath == "") {
        Fluttertoast.showToast(msg: "يجب اضافة صورة ");
      }

      if (firebaseUser != null)
        await FirebaseFirestore.instance
            .collection('users')
            .doc(firebaseUser.uid)
            .get()
            .then((ds) {
          uiduser = ds.data()!['uid'];
          print(uiduser);
        }).catchError((e) {
          print(e);
        });
      print("2");

      print("3");
      if (imagePath != "" && path == true) {
        //   FirebaseFirestore.instance.collection("goods").doc(doc).delete();
        var ref = FirebaseFirestore.instance.collection("goods").doc(doc);

        ref.update({
          'gName': name,
          'Description': des,
          'Category': cat,
          'image': url,
          'numGood': num,
          'Status': st,
          'owner': uiduser,
          'cate': cate,
        });

        Fluttertoast.showToast(msg: "تم التعديل بنجاح ");

        Navigator.of(this.context).pushReplacement(MaterialPageRoute(
            builder: (context) => MyItems(
                  userId: userID,
                )));
        return true;
      } else if (imagePath != "" && path == false) {
        //   FirebaseFirestore.instance.collection("goods").doc(doc).delete();
        var ref = FirebaseFirestore.instance.collection("goods").doc(doc);
        goodsModel goodsMo = goodsModel();
        // // storage.uploadImage(imagePath, imageName).then((value) => url = value);
        url = await goodsMo.img.toString();
        ref.update({
          'gName': name,
          'Description': des,
          'Category': cat,
          'numGood': num,
          'Status': st,
          'owner': uiduser,
          'cate': cate,
        });

        Fluttertoast.showToast(msg: "تم التعديل بنجاح ");

        Navigator.of(this.context).pushReplacement(MaterialPageRoute(
            builder: (context) => MyItems(
                  userId: userID,
                )));
        return true;
      }
    }

    userID = firebaseUser!.uid;
  }

  addadata(
    String doc,
    String name,
    String des,
    int cat,
    String url,
    String id,
    int num,
    String st,
    String cate,
  ) async {
    await update(
      doc,
      name,
      des,
      cat,
      url,
      id,
      num,
      st,
      cate,
      Path,
    );
  }

  submitAction(BuildContext context) {
    update(
      doc,
      goodName.text,
      goodDesc.text,
      _value,
      url,
      userID,
      num,
      st,
      cate,
      Path,
    );
  }
}
