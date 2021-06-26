import 'package:flutter/material.dart';
import 'package:genz/utils/text.dart';

class ProfileInfo extends StatelessWidget {
  final String name, email;
  const ProfileInfo({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 150,
      // color: Colors.red,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://media.istockphoto.com/photos/smiling-indian-man-looking-at-camera-picture-id1270067126?k=6&m=1270067126&s=170667a&w=0&h=jZlPpqOQTyShQ59aoGp5UzbLQJnpd5Ci8acoq3LHFlw='),
            radius: 60,
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bold_text(
                    text:name, size: 20, color: Colors.grey.shade900),
                modified_text(
                    text: email, size: 16, color: Colors.grey.shade800),
                modified_text(
                    text: 'Data Science | ML | Flutter',
                    size: 14,
                    color: Colors.grey.shade800),
              ],
            ),
          ),
          Container(
            width: 30,
            child: IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.grey.shade800,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
