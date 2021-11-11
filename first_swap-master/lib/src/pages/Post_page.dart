import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/fluttericon.dart';
import 'package:first_swap/models/goodsMod.dart';
import 'package:first_swap/src/pages/Home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/material.dart';
import 'package:first_swap/fluttericon.dart';
import 'package:first_swap/src/widgets/app_outlinebutton.dart';
import 'package:first_swap/src/widgets/app_textfield.dart';
import 'package:first_swap/themes.dart';
import 'package:flutter/services.dart';
import 'Intrests_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'image_storage.dart';

String userID = "";
int num = 1;

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);
  @override
  _PostPage createState() => _PostPage();
}

class _PostPage extends State<PostPage> {
  final _formKey = GlobalKey<FormState>();
  final Storage storage = Storage();

  String _currentSelectedValue = "one";
  int _value = 42;

  String imagePath = "";
  String imageName = "";

  final picker = ImagePicker();

  final GoodsNController = new TextEditingController();
  final GoodsDController = new TextEditingController();
  final GoodsCController = new TextEditingController();
  final GoodMController = new TextEditingController();

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
          defaultSelectedIndex: 2,
        ),
        appBar: AppBar(
          backgroundColor: Colors.cyan[800],
          title:
              Center(child: Text('منتج جديد', style: TextStyle(fontSize: 30))),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
            top: false,
            bottom: false,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "الرجاء إدخال معلومات المنتج",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        letterSpacing: 1.3,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
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
                                //===>Goods name <===
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
                                      controller: GoodsNController,
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
                                      /*     validator: (value) {
                                        RegExp regex =
                                            new RegExp(r'^[a-zA-Z]{3,}$');
                                        if (value!.isEmpty) {
                                          return ("*الحقل مطلوب");
                                        }
                                        if (!regex.hasMatch(value)) {
                                          return ("اسم المنتج حد أدنى ٣ أحرف");
                                        }
                                        return null;
                                     },  */
                                      onSaved: (val) {
                                        GoodsNController.text = val!;
                                      },
                                    ),
                                  ),
                                ),
                                //===> Drop Down Menu starts from here <===
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
                                                    child: DropdownButton(
                                                        isDense: true,
                                                        isExpanded: true,
                                                        value: _value,
                                                        items: <
                                                            DropdownMenuItem<
                                                                int>>[
                                                          new DropdownMenuItem(
                                                            child: new Text(
                                                                'اختر فئة المنتج'),
                                                            enabled: false,
                                                            value: 42,
                                                          ),
                                                          new DropdownMenuItem(
                                                            child: new Text(
                                                                'الأجهزة الإلكترونية و ملحقاتها'),
                                                            value: 0,
                                                          ),
                                                          new DropdownMenuItem(
                                                            child: new Text(
                                                                'منتجات الأطفال و الألعاب'),
                                                            value: 1,
                                                          ),
                                                          new DropdownMenuItem(
                                                            child: new Text(
                                                                'المنزل و المطبخ'),
                                                            value: 2,
                                                          ),
                                                          new DropdownMenuItem(
                                                            child: new Text(
                                                                'المستلزمات المكتبية و الكتب'),
                                                            value: 3,
                                                          ),
                                                          new DropdownMenuItem(
                                                            child: new Text(
                                                                'الاكسسوارات و الحقائب و الأحذية'),
                                                            value: 4,
                                                          ),
                                                          new DropdownMenuItem(
                                                            child: new Text(
                                                                'الجمال والعطور'),
                                                            value: 5,
                                                          ),
                                                          new DropdownMenuItem(
                                                            child: new Text(
                                                                'الرياضة و اللياقة'),
                                                            value: 6,
                                                          ),
                                                          new DropdownMenuItem(
                                                            child: new Text(
                                                                ' الملابس'),
                                                            value: 7,
                                                          ),
                                                          new DropdownMenuItem(
                                                            child: new Text(
                                                                'مستلزمات الحيوان '),
                                                            value: 8,
                                                          ),
                                                          new DropdownMenuItem(
                                                            child: new Text(
                                                                'اخرى'),
                                                            value: 9,
                                                          ),
                                                        ],
                                                        onChanged:
                                                            (int? value) {
                                                          setState(() {
                                                            _value = value!;
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
                                      controller: GoodsDController,
                                      keyboardType: TextInputType.emailAddress,
                                      /*    validator: (value) {
                                        RegExp regex =
                                            new RegExp(r'^[a-zA-Z]{10,}$');
                                        if (value!.isEmpty) {
                                          return ("*الحقل مطلوب");
                                        }
                                        if (!regex.hasMatch(value)) {
                                          return ("الرجاء إدخال وصف كافي");
                                        }
                                        return null;
                                      }, */
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
                                      onSaved: (val) {
                                        GoodsDController.text = val!;
                                      },
                                      // keyboardType: TextInputType.text,
                                      //   style: TextStyle(
                                      //    fontSize: 16.0,
                                      //    color: Colors.black),
                                      //   maxLines: 3,
                                    ),
                                  ),
                                ),
                                Text(
                                  "اضف صورة",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    letterSpacing: 1.3,
                                  ),
                                ),
//new ListTile(
                                //       leading: new Icon(Icons.photo_camera),
                                //     title: new Text(
                                //      'التقط صورة',
                                //     textAlign: TextAlign.right,
                                //    ),
                                //   onTap: () {},
                                //  ),
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
                                        imageName = GoodsNController.text;
                                      });
                                    }
                                  },
                                ),
                                imagePath != ""
                                    ? Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Image.file(File(imagePath)),
                                      )
                                    : Container(),

                                //===> Goods descerption<===

                                // TextFormField(
                                //    textAlign: TextAlign.right,
                                // onSaved: (String val) {
                                //    _query = val;
                                //  },
                                //   controller: queryController,
                                //   decoration: InputDecoration(
                                //   border: OutlineInputBorder(
                                //    borderRadius: BorderRadius.circular(10.0),
                                //  ),
                                //  hintText: 'وصف المنتج',
                                //  labelText: 'وصف المنتج',
                                //  ),
                                //  keyboardType: TextInputType.text,
                                // style: TextStyle(
                                //  fontSize: 16.0,
                                //   color: Colors.black),
                                // maxLines: 3,
                                //  ),

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
                                      Icons.post_add_outlined,
                                      size: 30.0,
                                    ),
                                    onPressed: () {
                                      if (submitAction(context) == true) {
                                        num = num + 1;
                                      } else {
                                        num = num;
                                      }

                                      // Validate returns true if the form is valid, or false otherwise.
                                      /* if (_formKey.currentState!.validate()) {
                                         storage
   .uploadImage(imagePath, imageName)
   .then((value) => print("done")); */
                                      // If the form is valid, display a snackbar. In the real world,
                                      // you'd often call a server or save the information in a database.
                                      /*  ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text('Processing Data')),
                                        ); */
                                      // }
                                    },
                                  ),
                                ),
                                /*  child: MaterialButton(
                                
                                      color: Colors.cyan[800],
                                      onPressed: () {},
                          
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 65.0),
                                          child: Text(
                                            "آرسل ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          )),
                                    )),*/
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
  String uiduser = '';
  String st = "available";
  addgood(String name, String des, int cat, String img, String userID, int num,
      String st) async {
    final _auth = FirebaseAuth.instance;

    // calling our firestore
    // calling our user model
    // updateing Data
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    //int num = 1;

    //  String st = "avalible";
    goodsModel goodsMo = goodsModel();

    // writing  the values

    goodsMo.name = GoodsNController.text;
    goodsMo.desc = GoodsDController.text;
    goodsMo.cat = _value;
    goodsMo.img = GoodMController.text;
    goodsMo.gnum = num;
    goodsMo.stat = st;
    goodsMo.own = uiduser;

    final firebaseUser = await FirebaseAuth.instance.currentUser;

    if (_formKey.currentState!.validate()) {
     if (imagePath != ""){
      storage
   .uploadImage(imagePath, imageName)
   .then((value) => print("done"));}
   else {

      Fluttertoast.showToast(msg: "يجب اضافة صورة ");
   }
      if (firebaseUser != null)
        await FirebaseFirestore.instance
            .collection('users')
            .doc(firebaseUser.uid)
            .get()
            //.then((value) => null)
            .then((ds) {
          uiduser = ds.data()!['uid'];
          print(uiduser);
        }).catchError((e) {
          print(e);
        });
      await FirebaseFirestore.instance.collection('goods').add({
        'gName': name,
        'Description': des,
        'Category': cat,
        'image': img,
        'numGood': num,
        'Status': st,
        'owner': uiduser,
      });
      Fluttertoast.showToast(msg: "تم الإضافة بنجاح!");

      Navigator.of(this.context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
      return true;
    }

    userID = firebaseUser!.uid;
  }

  addadata(
    String name,
    String des,
    int cat,
    String img,
    String id,
    int num,
    String st,
  ) async {
    await addgood(
      name,
      des,
      cat,
      img,
      id,
      num,
      st,
    );
  }

  submitAction(BuildContext context) {
    addadata(GoodsNController.text, GoodsDController.text, _value,
        GoodMController.text, userID, num, st);
  }
}