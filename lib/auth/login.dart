import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:genz/components/curves.dart';
import 'package:genz/utils/colors.dart';
import 'package:genz/utils/text.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();

  var email = '';

  var password = '';

  void trysubmit() {
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formkey.currentState!.save();
      _submitAuthForm(email, password);
      print(_formkey.currentState);
    }
  }

//-----------------------------------------------------------------------
//-----------------------------------------------------------------------
// Firebase Authentication

  final _auth = FirebaseAuth.instance;
  void _submitAuthForm(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
    } on PlatformException catch (err) {
      var message = 'An error occured';
      if (err.message != null) {
        message = err.message.toString();
      }
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text(message),
      //   backgroundColor: Colors.red,
      // )
      // );
    } catch (err) {
      print(err);
    }
  }

  //--------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
          child: ListView(
        children: [
          SizedBox(height: 50),
          Container(
            height: 300,
            width: 300,
            padding: EdgeInsets.all(20),
            child: Lottie.asset('assets/search.json'),
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
                        text: 'Login', size: 30, color: Colors.grey.shade900),
                    SizedBox(height: 20),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                      ),
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                      ),
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
                          text: 'Login',
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
    );
  }
}
