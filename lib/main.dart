import 'package:flutter/material.dart';
import 'package:genz/auth/welcome.dart';
import 'package:genz/utils/colors.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Welcome(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: AppColors.primary),
    );
  }
}
