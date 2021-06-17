import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genz/pages/addjob.dart';
import 'package:genz/utils/colors.dart';
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
    // DocumentSnapshot snapshot = await FirebaseFirestore.instance
    //     .collection('postcovid')
    //     .doc('announcement')
    //     .get();
    // DocumentSnapshot snapshot2 = await FirebaseFirestore.instance
    //     .collection('postcovid')
    //     .doc('advice')
    //     .get();

    setState(() {
      uid = userid;
      // username = usersnapshot['username'];
      // aname = usersnapshot['aname'];
      // email = usersnapshot['email'];
      // announcement = snapshot['text'];
      // a1 = snapshot2['1'];
      // a2 = snapshot2['2'];
      // a3 = snapshot2['3'];
      // a4 = snapshot2['4'];
      // a5 = snapshot2['5'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      // appBar: AppBar(
      // actions: [
      //   IconButton(
      //       onPressed: () async {
      //         await FirebaseAuth.instance.signOut();
      //       },
      //       icon: Icon(Icons.leave_bags_at_home, color: Colors.red))
      // ],
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   title:
      //       bold_text(text: 'GenZ App', size: 20, color: Colors.grey.shade900),
      // ),

      //********************************************** */

      // bottomNavigationBar: BottomNavigationBar(
      //   elevation: 8.0,
      //   backgroundColor: Colors.white,
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: AppColors.primary,
      //   unselectedItemColor: Colors.grey.shade800,
      //   selectedFontSize: 14,
      //   unselectedFontSize: 14,
      //   onTap: (value) {
      //     _onTappedBar(value);
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       label: ('Dashboard'),
      //       icon: Icon(Icons.home_rounded),
      //     ),
      //     BottomNavigationBarItem(
      //       label: ('Add Job'),
      //       icon: Icon(Icons.add),
      //     ),
      //     BottomNavigationBarItem(
      //       label: ('Profile'),
      //       icon: Icon(Icons.person),
      //     ),
      //   ],
      // ),

      //********************************************** */

      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
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
              AddJob(uid: uid),
              AddJob(uid: uid),
              AddJob(uid: uid),
            ],
          ),
        ),
      ),
    );
    //   PageView(
    //     controller: _pageController,
    //     children: <Widget>[
    //       // Dashboard(),
    //       AddJob(
    //         uid: uid,
    //       ),
    //       // Profile(
    //       //   uid: widget.uid,
    //       // )
    //     ],
    //     onPageChanged: (page) {
    //       setState(() {
    //         _selectedIndex = page;
    //       });
    //     },
    //   ),
    // );
  }

  // void _onTappedBar(int value) {
  //   setState(() {
  //     _selectedIndex = value;
  //   });
  //   _pageController.jumpToPage(value);
  // }
}
