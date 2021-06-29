import 'package:flutter/material.dart';
import 'package:genz/utils/colors.dart';
import 'package:genz/utils/text.dart';

class FieldBubble extends StatelessWidget {
  final String field;
  const FieldBubble({Key? key, required this.field}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 40,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(40)),
      child: Center(
          child: modified_text(
        text: field,
        color: Colors.black,
        size: 14,
      )),
    );
  }
}
