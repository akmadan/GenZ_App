import 'package:flutter/material.dart';
import 'package:genz/utils/text.dart';

class FieldBubble extends StatelessWidget {
  final String url, field;
  const FieldBubble({Key? key, required this.url, required this.field})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 220,
      decoration: BoxDecoration(
        image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.dstATop),
            image: NetworkImage(url),
            fit: BoxFit.cover),
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child:
          Center(child: bold_text(text: field, size: 20, color: Colors.white)),
    );
  }
}
