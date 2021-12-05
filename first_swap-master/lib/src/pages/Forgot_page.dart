import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_swap/fluttericon.dart';
import 'package:first_swap/src/pages/login_page.dart';
import 'package:first_swap/src/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:first_swap/fluttericon.dart';
import 'package:first_swap/src/widgets/app_outlinebutton.dart';
import 'package:first_swap/src/widgets/app_textfield.dart';
import 'package:first_swap/themes.dart';
import 'package:fluttertoast/fluttertoast.dart';

TextEditingController forgetmailcont = new TextEditingController();
final _formkey3 = GlobalKey<FormState>();

final _auth = FirebaseAuth.instance;
String? errorMessage;

class forgetp extends StatefulWidget {
  const forgetp({Key? key}) : super(key: key);
  @override
  _forgetpState createState() => _forgetpState();
}

class _forgetpState extends State<forgetp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ForgotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            Stack(
              children: [
                //logo place
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/Screen Shot 1443-03-02 at 6.09.18 PM.png",
                    height: 250,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_left),
                  onPressed: () {
                    Navigator.pop(context);
                    forgetmailcont.clear();
                  },
                ),
              ],
            ),
            SizedBox(height: 40),
            SizedBox(height: 80),
            Text(
              "لاستعادة كلمة المرور الرجاء إدخال البريد الإلكتروني",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Themes.colorHeader,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 12),
            Container(
              child: Form(
                key: _formkey3,
                child: Column(
                  children: [
                    TextFormField(
                        //email field
                        autocorrect: false,
                        cursorColor: Colors.lightBlue,
                        cursorWidth: 2,
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400),
                        keyboardType: TextInputType.emailAddress,
                        controller: forgetmailcont,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.right,
                        validator: (value) {
                          //email validation
                          if (value!.isEmpty) {
                            return '* حقل مطلوب';
                          } else
                            return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: new Icon(
                              FlutterIcons.mail,
                            ),
                            hintText: "عنوان البريد الإلكتروني",
                            labelStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                            ))),
                    SizedBox(height: 30),
                    FlatButton(
                        //forgot button
                        color: Colors.cyan[800],
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        minWidth: MediaQuery.of(context).size.width,
                        child: Text(
                          "استعادة كلمة المرور",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        onPressed: () async {
                          //sending email to user email and validation and return message
                          if (_formkey3.currentState!.validate()) {
                            try {
                              await FirebaseAuth.instance
                                  .sendPasswordResetEmail(
                                      email: forgetmailcont.text)
                                  .then((value) => {
                                        //email sent successfully
                                        Fluttertoast.showToast(
                                            msg:
                                                "  تم إرسال رابط تعين كلمة مرور جديدة الى" +
                                                    forgetmailcont.text),
                                        Navigator.of(context).pushReplacement(
                                            //navigate to next page
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()))
                                      });
                              forgetmailcont.clear();
                            } on FirebaseAuthException catch (error) {
                              switch (error.code) {
                                //valication with database records
                                case "invalid-email":
                                  errorMessage = "البريد الإلكتروني غير مسجل";
                                  break;
                                case "too-many-requests":
                                  errorMessage = "حدث خطأ  في النظام";
                                  break;
                                case "operation-not-allowed":
                                  errorMessage = "عملية غير مقبولة!";
                                  break;

                                default:
                                  errorMessage = "البريد الإلكتروني غير مسجل";

                                  break;
                              }
                              Fluttertoast.showToast(msg: errorMessage!);
                              print(error.code);
                            }
                          }
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
