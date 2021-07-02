import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genz/utils/colors.dart';
import 'package:genz/utils/text.dart';
import 'package:lottie/lottie.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  var email = '';
  var firstname = '';
  var lastname = '';
  var password = '';

  void trysubmit() {
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if ((isValid)) {
      _formkey.currentState!.save();
      _submitAuthForm(firstname, lastname, email, password);
    }
  }

//-----------------------------------------------------------------------
// Firebase Authentication

  final _auth = FirebaseAuth.instance;
  void _submitAuthForm(
      String firstname, String lastname, String email, String password) async {
    UserCredential credential;
    try {
      Fluttertoast.showToast(msg: 'This may take a while');
      credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user?.uid)
          .set({
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'uid': credential.user?.uid
      });
      Navigator.of(context).pop();
    } on PlatformException catch (err) {
      var message = 'An error occured';
      if (err.message != null) {
        message = err.message.toString();
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ));
    } catch (err) {
      print(err);
    }
  }

  //--------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: Stack(
        children: [
          //____________________FORM____________________
          Container(
              child: ListView(
            children: [
              SizedBox(height: 50),
              Container(
                height: width / 1.4,
                width: width / 1.4,
                padding: EdgeInsets.all(20),
                child: Lottie.asset('assets/interview2.json'),
              ),
              Form(
                key: _formkey,
                child: Container(
                  width: width,
                  // color: Colors.red,
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bold_text(
                            text: 'Register',
                            size: 30,
                            color: Colors.grey.shade900),
                        SizedBox(height: 20),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.lighgrey,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          //____________________FIRST NAME____________________
                          child: Center(
                            child: TextFormField(
                              key: ValueKey('firstname'),
                              cursorColor: AppColors.primary,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 17),
                                hintText: 'Enter First Name',
                                suffixIcon: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade800,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                              ),
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return 'First Name should not be empty';
                                }

                                return null;
                              },
                              onSaved: (value) {
                                firstname = value.toString();
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.lighgrey,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          //____________________LAST NAME____________________
                          child: Center(
                            child: TextFormField(
                              key: ValueKey('lastname'),
                              cursorColor: AppColors.primary,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 17),
                                hintText: 'Enter Last Name',
                                suffixIcon: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade800,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                              ),
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return 'Last Name should not be empty';
                                }

                                return null;
                              },
                              onSaved: (value) {
                                lastname = value.toString();
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(),
                        SizedBox(height: 10),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.lighgrey,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          //__________________EMAIL_______________________
                          child: Center(
                            child: TextFormField(
                              key: ValueKey('email'),
                              cursorColor: AppColors.primary,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 17),
                                hintText: 'Enter Email Address',
                                suffixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.grey.shade800,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                              ),
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return 'Email should not be empty';
                                }

                                return null;
                              },
                              onSaved: (value) {
                                email = value.toString();
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.lighgrey,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          //______________________PASSWORD_____________________
                          child: Center(
                            child: TextFormField(
                              obscureText: true,
                              key: ValueKey('password'),
                              cursorColor: AppColors.primary,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 17),
                                hintText: 'Enter Password',
                                suffixIcon: Icon(
                                  Icons.security,
                                  color: Colors.grey.shade800,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                              ),
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return 'Password should not be empty';
                                }

                                return null;
                              },
                              onSaved: (value) {
                                password = value.toString();
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            trysubmit();
                          },
                          child: Container(
                            height: 54,
                            width: double.infinity,
                            // margin: EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(16)),
                            child: Center(
                                child: bold_text(
                              text: 'Register',
                              color: Colors.white,
                              size: 18,
                            )),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          )),
        ],
      )),
    );
  }
}
