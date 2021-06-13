import 'package:flutter/material.dart';
import 'package:genz/components/curves.dart';
import 'package:genz/utils/colors.dart';
import 'package:genz/utils/text.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
          child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Positioned(
            bottom: 200,
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Center(
                        child: TextField(
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
                        child: TextField(
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
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 10),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Center(
                        child: TextField(
                          cursorColor: AppColors.primary,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 17),
                            hintText: 'Enter Email Address',
                            suffixIcon: Icon(
                              Icons.email,
                              color: Colors.grey.shade800,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                          ),
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
                        child: TextField(
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
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        // signInWithGoogle();
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
          // Positioned(
          //     bottom: 0,
          //     child: Container(width: width, height: 180, color: Colors.red))
          // Align(
          //     alignment: Alignment.topLeft,
          //     child: CustomPaint(
          //         painter: HeaderPainter(),
          //         child: SizedBox(
          //             width: MediaQuery.of(context).size.width, height: 300))),
          // Align(
          //     alignment: Alignment.bottomLeft,
          //     child: CustomPaint(
          //         painter: MyPainter(),
          //         child: SizedBox(
          //             width: MediaQuery.of(context).size.width, height: 300))),
        ],
      )),
    );
  }
}
