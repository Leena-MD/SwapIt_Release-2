import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:first_swap/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:first_swap/src/widgets/appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'profile_page.dart';
import 'edit_profile_page.dart';
import 'package:first_swap/fluttericon.dart';
import 'edit_profile_page.dart';

class EditPasswordPage extends StatefulWidget {
  const EditPasswordPage({Key? key}) : super(key: key);

  @override
  _EditPasswordPageState createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage> {
  int flag2 = -1;

  bool checkCurrentPasswordValid = true;

  bool flag1 = true;

  late bool flag3;
  final _formkey = GlobalKey<FormState>();

// error Message
  String errorMessage = '';

  final TextEditingController pass1cont = new TextEditingController(); // القديم

  final passwordEditingController = new TextEditingController(); //الجديد
  final confirmPasswordEditingController =
      new TextEditingController(); //اعادة الجديد

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.cyan[800], //or set color with: Color(0xFF0000FF)
    ));
    var errorMsg = "";
    //password field and validation القديم
    final passwordFieldPlace = TextFormField(
        autofocus: false,
        textAlign: TextAlign.right,
        controller: pass1cont,
        obscureText: true,
        validator: (value) {
          //validation of empty password

          if (value!.isEmpty) {
            return '* حقل مطلوب';
          } else {
            return null;
          }
        },
        onSaved: (value) {
          pass1cont.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: new Icon(
            FlutterIcons.lock,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "   كلمة المرور الحالية",
          errorText: checkCurrentPasswordValid
              ? null
              : "Please double check your current password",
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ));

    //password field الجديدة
    final passwordField = TextFormField(
        textAlign: TextAlign.right,
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
          if (value!.isEmpty) {
            return ("*الحقل مطلوب");
          }

          if (!regex.hasMatch(value)) {
            return ("يجب ان تحتوي كلمة المرور على : ٨ أحرف كبيرة وصغيرة وارقام ورمز");
          }
        },
        onSaved: (value) {
          //    firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "كلمة المرور الجديدة",
        ));

    //confirm password field
    final confirmPasswordField = TextFormField(
        textAlign: TextAlign.right,
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (value!.isEmpty) {
            return ("*الحقل مطلوب");
          } else if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "كلمة المرور لا تتطابق";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: " أعد إدخال كملة المرور الجديدة",
        ));

    final changeButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.cyan[800],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            _changePassword(pass1cont.text, passwordEditingController.text);
          },
          child: Text(
            "تغيير كلمة المرور",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff51878d)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 150,
                        child: Image.asset(
                          "assets/Screen Shot 1443-03-02 at 6.09.18 PM.png",
                          fit: BoxFit.contain,
                        )),
                    passwordFieldPlace,
                    SizedBox(height: 30),
                    passwordField,
                    SizedBox(height: 30),
                    confirmPasswordField,
                    SizedBox(height: 30),
                    changeButton,
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _changePassword(String currentPassword, String newPassword) async {
    if (_formkey.currentState!.validate()) {
      final user = await FirebaseAuth.instance.currentUser;
      final cred = EmailAuthProvider.credential(
          email: user!.email!, password: currentPassword);

      user.reauthenticateWithCredential(cred).then((value) {
        user.updatePassword(newPassword).then((_) {
          Fluttertoast.showToast(msg: "تم تغيير كلمة المرور بنجاح!");
          pass1cont.clear();
          Navigator.of(this.context).pushReplacement(
              MaterialPageRoute(builder: (context) => EditProfilePage()));
        });
      }).catchError((error) {
        //Error, show something
        Fluttertoast.showToast(msg: "كلمة المرور الحالية غير صحيحة");
      });
    }
  }
}
