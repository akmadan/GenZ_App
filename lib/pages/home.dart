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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.leave_bags_at_home, color: Colors.red))
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
        title:
            bold_text(text: 'GenZ App', size: 20, color: Colors.grey.shade900),
      ),

      //********************************************** */

      bottomNavigationBar: BottomNavigationBar(
        elevation: 8.0,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey.shade800,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          _onTappedBar(value);
        },
        items: [
          BottomNavigationBarItem(
            label: ('Dashboard'),
            icon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            label: ('Add Job'),
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: ('Profile'),
            icon: Icon(Icons.person),
          ),
        ],
      ),

      //********************************************** */

      body: PageView(
        controller: _pageController,
        children: <Widget>[
          // Dashboard(),
          AddJob(
            
          ),
          // Profile(
          //   uid: widget.uid,
          // )
        ],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}
