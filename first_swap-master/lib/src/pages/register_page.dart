import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_swap/fluttericon.dart';
import 'package:first_swap/src/pages/Home_page.dart';
import 'package:flutter/material.dart';
import 'package:first_swap/fluttericon.dart';
import 'package:first_swap/src/widgets/app_outlinebutton.dart';
import 'package:first_swap/src/widgets/app_textfield.dart';
import 'package:first_swap/themes.dart';

import 'Intrests_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_swap/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login_page.dart';
import 'profile_page.dart';

class regestp extends StatefulWidget {
  const regestp({Key? key}) : super(key: key);

  @override
  _regestpState createState() => _regestpState();
}

class _regestpState extends State<regestp> {
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final userNameEditingController = new TextEditingController();
  final phoneNumberEditingController = new TextEditingController();
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  final confirmEmailEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    //User Name
    final userNameField = TextFormField(
        textAlign: TextAlign.right,
        autofocus: false,
        controller: userNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^[a-zA-Z]{3,}$');
          if (value!.isEmpty) {
            return ("*الحقل مطلوب");
          }
          if (!regex.hasMatch(value)) {
            return ("اسم المستخدم حد أدنى ٣ أحرف");
          }
          return null;
        },
        onSaved: (value) {
          userNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "اسم المستخدم",
        ));

    //phone number
    final phoneNumberField = TextFormField(
        textAlign: TextAlign.right,
        autofocus: false,
        controller: phoneNumberEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'(^(05)(5|0|3|6|4|9|8|7)([0-9]{7}))');

          if (value!.isEmpty) {
            return ("*الحقل مطلوب");
          }
          if (!regex.hasMatch(value)) {
            return ("يجب كتابة رقم الهاتف بطريقة صحيحة");
          }
          return null;
        },
        onSaved: (value) {
          phoneNumberEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "رقم الهاتف",
        ));

    //first name field
    final firstNameField = TextFormField(
        //var بجرب فاينل اول
        textAlign: TextAlign.right,
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{1,}$');
          RegExp regex3 = new RegExp(r'^[a-zA-Z]+$');
          if (value!.isEmpty) {
            return ("*الحقل مطلوب");
          }
          if (!regex.hasMatch(value)) {
            return ("الاسم الأول حد أدنى حرف واحد");
          }
          if (!regex3.hasMatch(value)) {
            return ("يجب ان يتكون الاسم الأول من احرف فقط");
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
          RegExp regex3 = new RegExp(r'^[a-zA-Z]+$');
          if (value!.isEmpty) {
            return ("*الحقل مطلوب");
          }
          if (!regex.hasMatch(value)) {
            return ("الاسم الأخير حد أدنى ٣ أحرف");
          }
          if (!regex3.hasMatch(value)) {
            return ("يجب ان يتكون الاسم الأخير من احرف فقط");
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

    //email field
    final emailField = TextFormField(
        textAlign: TextAlign.right,
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("*الحقل مطلوب");
          }
          // reg expression for email validation
          if (!RegExp(r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)')
              .hasMatch(value)) {
            return ("يجب كتابة البريد الإلكتروني بطريقة صحيحة");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: " البريد الإلكتروني",
        ));
    final confirmEmailField = TextFormField(
        textAlign: TextAlign.right,
        autofocus: false,
        controller: confirmEmailEditingController,
        validator: (value) {
          if (value!.isEmpty) {
            return ("*الحقل مطلوب");
          } else if (confirmEmailEditingController.text !=
              emailEditingController.text) {
            return "البريد الإلكتروني لا يتطابق";
          }
          return null;
        },
        onSaved: (value) {
          confirmEmailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "أعد إدخال البريد الإلكتروني",
        ));
    //password field
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

    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.cyan[800],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            regist(emailEditingController.text, passwordEditingController.text);
          },
          child: Text(
            "انشاء حساب",
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
                key: _formKey,
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
                    userNameField,
                    SizedBox(height: 20),
                    phoneNumberField,
                    SizedBox(height: 8),
                    Text(
                      "مثال: 05 ",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    firstNameField,
                    SizedBox(height: 20),
                    secondNameField,
                    SizedBox(height: 20),
                    emailField,
                    SizedBox(height: 20),
                    confirmEmailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmPasswordField,
                    SizedBox(height: 20),
                    signUpButton,
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

  void regist(String email, String password) async {
    var _instance = FirebaseFirestore.instance;

    String username = userNameEditingController.text;
    String phoneN = phoneNumberEditingController.text;

    Future<bool> userExists(String username) async => (await _instance
            .collection("users")
            .where("UserName", isEqualTo: username)
            .get())
        .docs
        .isNotEmpty;

    Future<bool> phoneExists(String phoneN) async => (await _instance
            .collection("users")
            .where("phoneN", isEqualTo: phoneN)
            .get())
        .docs
        .isNotEmpty;

    if (await userExists(username)) {
      errorMessage = "اسم المستخدم مسجل مسبقاً";
      Fluttertoast.showToast(msg: errorMessage!);
    } else if (await phoneExists(phoneN)) {
      errorMessage = "رقم الهاتف مسجل مسبقاً";
      Fluttertoast.showToast(msg: errorMessage!);
    } else if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()});
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "email-already-in-use":
            errorMessage = "البريد الإلكتروني مسجل مسبقاً";

            break;
          case "invalid-email":
            errorMessage = "البريد الإلكتروني غير صحيح";
            break;
          case "weak-password":
            errorMessage = "كلمة المرور ضعيفة";
            break;
          default:
            errorMessage = "حدث خطأ غير محدد";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    String? token = await FirebaseMessaging.instance.getToken();
    User? user = _auth.currentUser;
    double Rate = 0;
    String Rate1 = "0";
    String Rate2 = "0";
    String Rate3 = "0";
    String Rate4 = "0";
    String Rate5 = "0";
    String NumRate = "0";

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.FirstName = firstNameEditingController.text;
    userModel.LastName = secondNameEditingController.text;
    userModel.UserName = userNameEditingController.text;
    userModel.phoneN = phoneNumberEditingController.text;
    userModel.Rate = Rate;
    userModel.Rate1 = Rate1;
    userModel.Rate2 = Rate2;
    userModel.Rate3 = Rate3;
    userModel.Rate4 = Rate4;
    userModel.Rate5 = Rate5;
    userModel.NumRate = NumRate;
    userModel.Blacklist = false;
    userModel.token= token;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(
        msg: "تمت عملية إنشاء الحساب وإرسال بريد إلكتروني لتوثيق");
    user.sendEmailVerification();

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(
            builder: (context) => LoginPage()), // غيرتها للبروفايل
        (route) => false);
  }
}
