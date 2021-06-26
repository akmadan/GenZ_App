import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genz/pages/addjob.dart';
import 'package:genz/pages/jobs.dart';
import 'package:genz/pages/profile.dart';
import 'package:genz/utils/style.dart';
import 'package:genz/utils/text.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//********************************************** */

class _HomeState extends State<Home> {
  String uid = '';
  String name = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    getuserdata();
  }

  getuserdata() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final userid = auth.currentUser!.uid;

    DocumentSnapshot usersnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userid).get();

    setState(() {
      uid = userid;
      name = usersnapshot['firstname'] + usersnapshot['lastname'];
      email = usersnapshot['email'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      //********************************************** */

      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            bottom: TabBar(
              labelStyle: TabLabelStyle.thintext,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: 'Jobs',
                ),
                Tab(icon: Icon(Icons.add_box_outlined), text: 'Add Job'),
                Tab(icon: Icon(Icons.person), text: 'Profile'),
              ],
            ),
            title: bold_text(text: 'GenZ App', size: 20, color: Colors.white),
          ),
          body: TabBarView(
            children: [
              Jobs(
                uid: uid,
              ),
              AddJob(uid: uid),
              Profile(uid: uid, name: name, email: email),
            ],
          ),
        ),
      ),
    );
  }
}
