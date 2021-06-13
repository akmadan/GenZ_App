import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:genz/utils/colors.dart';
import 'package:genz/utils/text.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    AppColors.primary.withOpacity(0.2), BlendMode.dstATop),
                image: AssetImage('assets/bg.jpg'),
                fit: BoxFit.cover)),
        height: h,
        width: w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Container(
            //   padding: EdgeInsets.all(20),
            //   child: Image.asset(
            //     'assets/op10.png',
            //     fit: BoxFit.contain,
            //   ),
            // ),
            SizedBox(height: 10),
            Container(
              width: w,
              padding: EdgeInsets.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Welcome Back!',
                          textStyle: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: const Duration(milliseconds: 200),
                        ),
                      ],
                      totalRepeatCount: 4,
                      pause: const Duration(milliseconds: 500),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                    // bold_text(
                    //   text: 'Welcome Back',
                    //   size: 34,
                    //   color: Colors.white,
                    // ),
                    SizedBox(height: 20),
                    modified_text(
                        text: 'Share Your Feelings',
                        color: Colors.white,
                        size: 18),
                    bold_text(
                        text: 'freely & anonymously',
                        color: Colors.white,
                        size: 22)
                  ]),
            ),
            SizedBox(height: 30),
            Container(
                width: w,
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  GestureDetector(
                    onTap: () {
                      // signInWithGoogle();
                    },
                    child: Container(
                      height: 54,
                      width: w,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                          child: bold_text(
                        text: 'Sign in via Google',
                        color: Theme.of(context).primaryColor,
                        size: 18,
                      )),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 54,
                    width: w,
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                        child: bold_text(
                      text: 'Create an Account',
                      color: Colors.white,
                      size: 18,
                    )),
                  ),
                  TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Authform()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          modified_text(
                              text: 'Already have an account? ',
                              color: Colors.white,
                              size: 16),
                          bold_text(
                              text: 'Login', color: Colors.white, size: 16)
                        ],
                      )),
                ])),
          ],
        ),
      ),
    );
  }
}
