// TODO Implement this library.import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:first_swap/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:first_swap/src/widgets/appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'profile_page.dart';
import 'edit_profile_page.dart';

class EditPasswordPage extends StatefulWidget {
  const EditPasswordPage({Key? key}) : super(key: key);

  @override
  _EditPasswordPageState createState() => _EditPasswordPageState();
}
class _EditPasswordPageState  extends State<EditPasswordPage>  {



  final _auth = FirebaseAuth.instance;



  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  String userID ="";



  @override
  Widget build(BuildContext context) {
    //to change password يمكن نحتاجه
    final passwordField = TextFormField(
        textAlign: TextAlign.right,
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          //RegExp regex =
          // new RegExp(
          // "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
          if (value!.isEmpty) {
            return ("*الحقل مطلوب");
          }
          // if (!regex.hasMatch(value)) {
          //  return ("يجب ان تحتوي كلمة المرور على :حرف كبير وصغير وارقام ورمز");
          // }
        },
        onSaved: (value) {

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

    // final   SaveButton = Material(
    //   elevation: 5,
    //   borderRadius: BorderRadius.circular(30),
    //   color: Colors.cyan[800],
    //   child: MaterialButton(
    //       padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //       minWidth: MediaQuery.of(context).size.width,
    //
    //       onPressed: () {
    //         if(passwordEditingController.text.isNotEmpty&&confirmPasswordEditingController.text.isNotEmpty){
    //
    //           submitAction(context);}
    //         if(passwordEditingController.text.isEmpty&&confirmPasswordEditingController.text.isEmpty){
    //           Navigator.pop(context);
    //         };
    //       },
    //       child: Text(
    //         "حفظ التعديلات",
    //         textAlign: TextAlign.center,
    //         style: TextStyle(
    //             fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
    //       )),
    // );
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


                    passwordField,
                    SizedBox(height: 20),
                    confirmPasswordField,

                    SizedBox(height: 20),


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
// updateUserData(String FirstName, String LastName, String uid) async {
//
//   final _auth = FirebaseAuth.instance;
//
//   // calling our firestore
//   // calling our user model
//   // updateing Data
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//   User? user = _auth.currentUser;
//
//   UserModel userModel = UserModel();
//
//   // writing  the values
//
//   userModel.FirstName = passwordEditingController.text;
//
//
//   final firebaseUser = await FirebaseAuth.instance.currentUser;
//   if(FirstName!=null&&LastName!=null){
//     if (firebaseUser != null)//
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(firebaseUser.uid)
//           .update({
//         'FirstName': FirstName,'LastName': LastName
//       });   }
//
//   userID =firebaseUser!.uid;
//
//   Fluttertoast.showToast(msg: "تم التعديل بنجاح");
//
//   Navigator.pushAndRemoveUntil(
//       (this.context),
//       MaterialPageRoute(builder: (context) => ProfilePage()),
//           (route) => false);
// }
//
// updateData(String FirstName, String LastName,String userID) async {
//
//   await updateUserData(FirstName, LastName, userID);
//
//
// }
// submitAction(BuildContext context) {
//   updateData(firstNameEditingController.text, secondNameEditingController.text,
//       userID);
//   firstNameEditingController.clear();
//   secondNameEditingController.clear();}

}
