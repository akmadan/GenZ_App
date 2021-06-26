import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genz/pages/addjob.dart';
import 'package:genz/pages/jobs.dart';
import 'package:genz/pages/profile.dart';
import 'package:genz/utils/colors.dart';
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
  int bottomSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
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

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(icon: new Icon(Icons.home), label: 'Jobs'),
      BottomNavigationBarItem(
        icon: new Icon(Icons.notifications_none_outlined),
        label: 'Notifications',
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined), label: 'Add Job'),
      BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border_outlined), label: 'Saved'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      // BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      // BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        Jobs(
          uid: uid,
        ),
        AddJob(uid: uid),

        Profile(uid: uid, name: name, email: email),
        // Profile(uid: uid, name: name, email: email),
        // Profile(uid: uid, name: name, email: email),
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade100,
        title: modified_text(text: 'GenZ Jobs', size: 20, color: Colors.black),
      ),
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey.shade600,
        selectedItemColor: AppColors.primary,
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }
}
