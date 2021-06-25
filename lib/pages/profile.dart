import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genz/pages/myjobs.dart';
import 'package:genz/utils/text.dart';

import 'addresume.dart';

class Profile extends StatefulWidget {
  final String uid, name, email;
  const Profile(
      {Key? key, required this.uid, required this.name, required this.email})
      : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
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
                        text: widget.name,
                        size: 20,
                        color: Colors.grey.shade900),
                    modified_text(
                        text: widget.email,
                        size: 16,
                        color: Colors.grey.shade800),
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
        ),
        // Divider(),
        SizedBox(height: 10),
        Container(
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                    padding: EdgeInsets.all(20),
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        modified_text(
                            text: 'Applied Jobs',
                            size: 18,
                            color: Colors.grey.shade900),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )
                      ],
                    )),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddResume(
                                uid: widget.uid,
                              )));
                },
                child: Container(
                    padding: EdgeInsets.all(20),
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        modified_text(
                            text: 'My Resume',
                            size: 18,
                            color: Colors.grey.shade900),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )
                      ],
                    )),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyJobs(
                                uid: widget.uid,
                              )));
                },
                child: Container(
                    padding: EdgeInsets.all(20),
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        modified_text(
                            text: 'My Jobs',
                            size: 18,
                            color: Colors.grey.shade900),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )
                      ],
                    )),
              ),
              InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: Container(
                    padding: EdgeInsets.all(20),
                    height: 80,
                    color: Colors.grey.shade200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        modified_text(
                            text: 'Logout',
                            size: 18,
                            color: Colors.grey.shade900),
                        Icon(
                          Icons.exit_to_app_sharp,
                          size: 20,
                        )
                      ],
                    )),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
