import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genz/components/components.dart';
import 'package:genz/functions/uploadresume.dart';
import 'package:genz/pages/myjobs.dart';
import 'package:genz/utils/text.dart';

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
        ProfileInfo(name: widget.name, email: widget.email),
        // Divider(),
        SizedBox(height: 10),
        //----------------------------BUTTONS------------------------------------
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
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.grey.shade100,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ElevatedButton(
                                child: const Text('Upload Resume'),
                                onPressed: () async {
                                  uploadresume(widget.uid);
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
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
