import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genz/pages/addjob.dart';
import 'package:genz/pages/jobs.dart';
import 'package:genz/utils/colors.dart';
import 'package:genz/utils/style.dart';
import 'package:genz/utils/text.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//********************************************** */

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  String uid = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdata();
  }

  getuserdata() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final userid = auth.currentUser!.uid;

    // DocumentSnapshot usersnapshot =
    //     await FirebaseFirestore.instance.collection('users').doc(userid).get();

    setState(() {
      uid = userid;
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
              Jobs(),
              AddJob(uid: uid),
              AddJob(uid: uid),
            ],
          ),
        ),
      ),
    );
  }
}
