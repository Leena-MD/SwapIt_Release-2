import 'package:flutter/material.dart';
import 'package:first_swap/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:first_swap/src/widgets/appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'profile_page.dart';
import 'Edit_password_page.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}





class _EditProfilePageState  extends State<EditProfilePage>  {


  final _formkey = GlobalKey<FormState>();

      final _auth = FirebaseAuth.instance;


  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final phoneNumberEditingController = new TextEditingController();
  String userID ="";



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.cyan[800], //or set color with: Color(0xFF0000FF)
    ));



    final firstNameField = TextFormField(
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
            return ("الاسم الأخير حد أدنى حرف ٣ أحرف");
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

    //Save button

  final   SaveButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.cyan[800],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          
          onPressed: () {

submitAction(context);

          },
          child: Text(
            "حفظ التعديلات",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

  final   changePass = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color:Colors.cyan[800],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          
          onPressed: () {
                 Navigator.push(
                this.context, MaterialPageRoute(builder: (context) => EditPasswordPage()));
          },
          child: Text(
            "تغيير كلمة المرور",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  
  

  return Scaffold(
    appBar: buildAppBar(context),
    
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
                    SizedBox(height: 45),
                   
                   
                    firstNameField,
                    SizedBox(height: 20),
                    secondNameField,
 
                    SizedBox(height: 20),
                    phoneNumberField,
                    SizedBox(height: 20),
                     SaveButton,//save button
                    SizedBox(height: 15),
                      changePass,//change paasword button
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

  
 updateUserData(String FirstName, String LastName,String phoneNum, String uid) async {

          final _auth = FirebaseAuth.instance;

    // calling our firestore
    // calling our user model
    // updateing Data 
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing  the values

    userModel.FirstName = firstNameEditingController.text;
    userModel.LastName = secondNameEditingController.text;
    userModel.phoneN = phoneNumberEditingController.text;

     final firebaseUser = await FirebaseAuth.instance.currentUser;
     if(FirstName!=null&&LastName!=null&&phoneNum!=null){
              if (_formkey.currentState!.validate()) {

        if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .update({
       'FirstName': FirstName,
        'LastName': LastName,
        'phoneN':phoneNum
       
    }
    
    ); 
       Fluttertoast.showToast(msg: "تم التعديل بنجاح!");
           Navigator.of(this.context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ProfilePage()));
        }
  }

    userID =firebaseUser!.uid;  

  }

    updateData(String FirstName, String LastName,String phoneNum,String userID) async {

 await updateUserData(FirstName, LastName,phoneNum, userID);


  }
  submitAction(BuildContext context) {
    updateData(firstNameEditingController.text, secondNameEditingController.text,phoneNumberEditingController.text,
         userID);
   
  }
  
}
