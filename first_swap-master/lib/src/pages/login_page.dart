import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_swap/src/pages/Home_page.dart';
import 'package:first_swap/src/pages/profile_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:first_swap/fluttericon.dart';
import 'package:first_swap/src/pages/register_page.dart';
import 'package:first_swap/src/widgets/app_outlinebutton.dart';
import 'package:first_swap/src/widgets/app_textfield.dart';
import 'package:first_swap/themes.dart';
import 'AdminHomePage.dart';
import 'AdminProfile_page.dart';
import 'Forgot_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Intrests_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController pass1cont = new TextEditingController();
  final TextEditingController email1cont = new TextEditingController();

  bool _validate = false;
  final _formkey = GlobalKey<FormState>();
  late TapGestureRecognizer registernav;
  late TapGestureRecognizer forgotnav;
  late TapGestureRecognizer Guestnav;
// firebase
  final _auth = FirebaseAuth.instance;

// error Message
  String? errorMessage;

  @override
  void initState() {
    registernav = TapGestureRecognizer();
    registernav.onTap = () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => regestp(),
        ),
      );
      pass1cont.clear();

      email1cont.clear();
    };

    super.initState();
    forgotnav = TapGestureRecognizer();
    forgotnav
      ..onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ForgotPage(),
          ),
        );
        pass1cont.clear();

        email1cont.clear();
      };

    super.initState();
    Guestnav = TapGestureRecognizer();
    Guestnav
      ..onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HomePage(),
          ),
        );
        pass1cont.clear();

        email1cont.clear();
      };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //email field and validation
    final emailFieldPlace = TextFormField(
      autofocus: false,
      textAlign: TextAlign.right,
      controller: email1cont,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
        final regExp = RegExp(pattern);

        if (value!.isEmpty) {
          return '* حقل مطلوب';
        } else if (!regExp.hasMatch(value)) {
          return 'أدخل بريد إلكتروني صحيح';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        email1cont.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: new Icon(
            FlutterIcons.mail,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "عنوان البريد الإلكتروني",
          labelStyle: TextStyle(
            color: Colors.red,
            fontSize: 15,
          )),
    );

    //password field and validation
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
          hintText: "  كلمة المرور",
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ));

    final loginButtonPlace = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.cyan[800],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            //signIn function
            LogIn(email1cont.text, pass1cont.text);
          },
          child: Text(
            "تسجيل الدخول",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
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
                        height: 200,
                        child: Image.asset(
                          "assets/Screen Shot 1443-03-02 at 6.09.18 PM.png",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 45),
                    emailFieldPlace,
                    SizedBox(height: 25),
                    passwordFieldPlace,
                    SizedBox(height: 35),
                    loginButtonPlace,
                    SizedBox(height: 15),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "نسيت كلمة المرور؟",
                            style: TextStyle(
                              color: Colors.cyan[600],
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: forgotnav,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        text: "لست عضواً في بدّل؟ ",
                        children: [
                          TextSpan(
                            text: "سجل الآن",
                            style: TextStyle(
                              color: Colors.cyan[600],
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: registernav,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //login funaction that will validate and navigate to next page
  void LogIn(String email, String password) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
var h="";
    if (_formkey.currentState!.validate()) {
      try {
        bool pp=false;
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) async => {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get()
              .then((ds) {
            pp= ds.data()!['Blacklist'];}),
          if(pp==true){
            Fluttertoast.showToast(msg: " لقد تم حظر حسابك "),
          }

               else if (uid.user!.emailVerified == true)
                    {



                      user?.reload(),
                     Fluttertoast.showToast(msg: "تم تسجيل الدخول بنجاح"),
                      if (email == "swap.gp05@gmail.com"){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => AdminProfilePage())),
                      }
                      else
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage())),

                    }
                  else
                    {
                      _auth.signOut(),
                      Fluttertoast.showToast(
                          msg: "الرجاء توثيق البريد الإلكتروني "),
                    }
                });

        pass1cont.clear();

        email1cont.clear();
      } on FirebaseAuthException catch (error) {
        //validation of the email with the database records
        switch (error.code) {
          case "invalid-email":
            errorMessage = "البريد الإلكتروني أو كلمة المرور غير صحيحة!";
            break;
          case "wrong-password":
            errorMessage = "البريد الإلكتروني أو كلمة المرور غير صحيحة!";
            break;
          case "user-not-found":
            errorMessage = "البريد الإلكتروني غير مسجل!";
            break;
          case "user-disabled":
            errorMessage = "هذا الحساب تم إيقافه!";
            break;
          case "too-many-requests":
            errorMessage = "حدث خطأ  في النظام";
            break;
          case "operation-not-allowed":
            errorMessage = "عملية غير مقبولة!";
            break;
          default:
            errorMessage = "حدث خطأ في النظام";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TapGestureRecognizer>(
        'registerOnTap', registernav));
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<TapGestureRecognizer>('forgotOnTap', forgotnav));
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<TapGestureRecognizer>('GuestOnTap', Guestnav));
  }
}
