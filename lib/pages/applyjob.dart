import 'package:flutter/material.dart';
import 'package:genz/utils/colors.dart';
import 'package:genz/utils/text.dart';

class ApplyJob extends StatefulWidget {
  const ApplyJob({Key? key}) : super(key: key);

  @override
  _ApplyJobState createState() => _ApplyJobState();
}

class _ApplyJobState extends State<ApplyJob> {
  TextEditingController whycontroller = TextEditingController();
  TextEditingController expectcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            modified_text(text: 'Application', size: 20, color: Colors.white),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          modified_text(
              text: 'Why you want to Join?',
              size: 16,
              color: Colors.grey.shade900),
          TextField(
            cursorColor: AppColors.primary,
            controller: whycontroller,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade900),
                ),
                suffixIcon: Icon(
                  Icons.person,
                  color: Colors.grey.shade600,
                ),
                hintText: ''),
          ),
          SizedBox(height: 20),
          modified_text(
              text: 'What you expect from this job?',
              size: 16,
              color: Colors.grey.shade900),
          TextField(
            cursorColor: AppColors.primary,
            controller: expectcontroller,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade900),
                ),
                suffixIcon: Icon(
                  Icons.person,
                  color: Colors.grey.shade600,
                ),
                hintText: ''),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              // postjob();
            },
            child: Container(
              height: 54,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16)),
              child: Center(
                  child: bold_text(
                text: 'Apply',
                color: Colors.white,
                size: 18,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
