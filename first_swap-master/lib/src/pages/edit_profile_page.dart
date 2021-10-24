/*import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:first_swap/models/user_model.dart';
import 'package:first_swap/src/widgets/app_textfield.dart';
import 'package:first_swap/themes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:first_swap/src/widgets/appbar_widget.dart';
import 'package:first_swap/src/widgets/profile_widget.dart';
import 'package:first_swap/src/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'edit_profile_page.dart';
import 'profile_page.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      final _auth = FirebaseAuth.instance;


  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

    final firstNameField = TextFormField(
        textAlign: TextAlign.right,
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{1,}$');
          if (value!.isEmpty) {
            return ("*الحقل مطلوب");
          }
          if (!regex.hasMatch(value)) {
            return ("الاسم الأول حد أدنى حرف واحد");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "الاسم الأول",
        ));



 //Last name field
    final secondNameField = TextFormField(
        textAlign: TextAlign.right,
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("*الحقل مطلوب");
          }
          if (!regex.hasMatch(value)) {
            return ("الاسم الأخير حد أدنى حرف ٣ أحرف");
          }
          return null;
        },
        onSaved: (value) {
          secondNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "الاسم الأخير",
        ));




    final passwordField = TextFormField(
        textAlign: TextAlign.right,
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = 
         new RegExp(
              "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
          if (value!.isEmpty) {
            return ("*الحقل مطلوب");
          }
      if (!regex.hasMatch(value)) {
           return ("يجب ان تحتوي كلمة المرور على :حرف كبير وصغير وارقام ورمز");
        }
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "كلمة المرور",
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
          hintText: "أعد إدخال كملة المرور",
        ));

  //
  //
  //
  return Scaffold(
    appBar: buildAppBar(context),
    
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
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
                    SizedBox(height: 45),
                   
                   
                    firstNameField,
                    SizedBox(height: 20),
                    secondNameField,
                    SizedBox(height: 20),
           //         emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmPasswordField,
                    SizedBox(height: 20),
            //        signUpButton,//save button
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
 postDetailsToFirestore() async {

          final _auth = FirebaseAuth.instance;

    // calling our firestore
    // calling our user model
    // sedning these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;// no
    userModel.uid = user.uid;//no
    //userModel.FirstName = firstNameEditingController.text;
    //userModel.LastName = secondNameEditingController.text;
   
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "تمت عملية إنشاء الحساب بنجاح");

    Navigator.pushAndRemoveUntil((this.context),
        MaterialPageRoute(builder: (context) => ProfilePage()),// غيرتها للبروفايل
        (route) => false);
  }

}*/