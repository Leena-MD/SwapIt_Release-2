import 'package:first_swap/fluttericon.dart';
import 'package:first_swap/src/pages/Home_page.dart';
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
class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);
  @override
  _PostPage createState() => _PostPage();
}

class _PostPage extends State<PostPage> {
    final _formKey = GlobalKey<FormState>();


String _currentSelectedValue = "one";
 int _value = 42;

 String imagePath = "";
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
          title: Center(child: Text('منتج جديد', style: TextStyle(fontSize: 30))),
        automaticallyImplyLeading: false,),

      body: SafeArea(
      top: false,
      bottom: false,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            
            children: [
              SizedBox(
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
                  elevation: 6,
                  child: Form(
                      key: _formKey,
                      
                      child: ListView(
                        
                        shrinkWrap: true, 
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        children: <Widget>[
                          
                          //===>Goods name <===
                          Padding(
                            
                            padding: EdgeInsets.only(
                          top: 15.0, bottom: 15.0, left: 17.0, right: 17.0),
                            child: Directionality(
                  textDirection: TextDirection.rtl,
                            child: TextFormField(
                              
                              autofocus: false,
                              textAlign: TextAlign.right,
                              controller: GoodsNController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                 
                                ),
                                 hintText: 'اسم المنتج',
                                labelText: 'اسم المنتج',
                                 
                              ),
                              validator: (value) {
                                        RegExp regex =
                                            new RegExp(r'^[a-zA-Z]{3,}$');
                                        if (value!.isEmpty) {
                                          return ("*الحقل مطلوب");
                                        }
                                        if (!regex.hasMatch(value)) {
                                          return ("اسم المنتج حد أدنى ٣ أحرف");
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        GoodsNController.text = val!;
                                      },
                                    ),
                                  ),
                                ),
  //===> Drop Down Menu starts from here <===
                         Padding(
                            padding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 17.0, right: 17.0),
                            child: Directionality(
                  textDirection: TextDirection.rtl,
                            child: FormField(
                              builder: (FormFieldState state) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelText: 'الفئة',
                                    hintText: ("الفئة"),
                                  ),
                                 
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0,
                                                  bottom: 0,
                                                  left: 17.0,
                                                  right: 17.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: DropdownButtonHideUnderline( 
                                        child: ButtonTheme(
                                          alignedDropdown: true, 
                                          child: DropdownButton(
                                             isDense: true,
                                          
                                            isExpanded: true,
                                           value: _value,
            items: <DropdownMenuItem<int>>[
              new DropdownMenuItem(
                child: new Text('الأجهزة الإلكترونية و ملحقاتها'),
                value: 0,
              ),
              new DropdownMenuItem(
                child: new Text('منتجات الأطفال و الألعاب'),
                value: 1,
              ),
              new DropdownMenuItem(
                child: new Text('المنزل و المطبخ'),
                value: 2,
              ),
              new DropdownMenuItem(
                child: new Text('المستلزمات المكتبية و الكتب'),
                value: 3,
              ),
              new DropdownMenuItem(
                child: new Text('الاكسسوارات و الحقائب و الأحذية'),
                value: 4,
              ),
              new DropdownMenuItem(
                child: new Text('الجمال والعطور'),
                value: 5,
              ),
               new DropdownMenuItem(
                child: new Text('الرياضة و اللياقة'),
                value: 6,
              ),
              new DropdownMenuItem(
                child: new Text(' الملابس'),
                value: 7,
              ),
              new DropdownMenuItem(
                child: new Text('مستلزمات الحيوان '),
                value: 42,
              ),
              new DropdownMenuItem(
                                                            child: new Text(
                                                                'اخرى'),
                                                            value: 9,
                                                          ),
            ],
            onChanged: (int? value) {
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
                           )  ),
              
                           Padding(
                            
                            padding: EdgeInsets.only(
                          top: 15.0, bottom: 15.0, left: 17.0, right: 17.0),
                            child: Directionality(
                  textDirection: TextDirection.rtl,
                            child: TextFormField(
                              maxLines: 4,
                              autofocus: false,
                              textAlign: TextAlign.right,
                              controller: GoodsDController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                        RegExp regex =
                                            new RegExp(r'^[a-zA-Z]{10,}$');
                                        if (value!.isEmpty) {
                                          return ("*الحقل مطلوب");
                                        }
                                        if (!regex.hasMatch(value)) {
                                          return ("الرجاء إدخال وصف كافي");
                                        }
                                        return null;
                                      },
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                 
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
                                  onTap: ()async {
                                    final pickedFile = await picker.getImage(source: ImageSource.gallery);
 if (pickedFile != null) { 
  setState(() {
    imagePath = pickedFile.path;
  }); 
 }
 
 
 },
                                ),
imagePath != ""
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
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
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color:  Color(0xFF008ECC),
                                    offset: Offset(0.0, 0.0),
                                    //blurRadius: 20.0,
                                  ),
                                  BoxShadow(
                                    color:  Color(0xFF008ECC),
                                    offset: Offset(0.0, 0.0),
                                    //blurRadius: 20.0,
                                  ),
                                ],
                                gradient: LinearGradient(
                                     colors: [
                                          Color(
                                              0xFFFFFFFF), 
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
                                      // Validate returns true if the form is valid, or false otherwise.
                                      if (_formKey.currentState!.validate()) {
                                        // If the form is valid, display a snackbar. In the real world,
                                        // you'd often call a server or save the information in a database.
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text('Processing Data')),
                                        );
                                      }
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
}