import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genz/utils/colors.dart';
import 'package:genz/utils/text.dart';

class ApplyJob extends StatefulWidget {
  final String applyeruid, employeruid, jobid;
  const ApplyJob(
      {Key? key,
      required this.applyeruid,
      required this.employeruid,
      required this.jobid})
      : super(key: key);

  @override
  _ApplyJobState createState() => _ApplyJobState();
}

class _ApplyJobState extends State<ApplyJob> {
  TextEditingController whycontroller = TextEditingController();
  TextEditingController expectcontroller = TextEditingController();

  saveapplication() async {
    if (whycontroller.text.length >= 20 && expectcontroller.text.length >= 20) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.applyeruid)
          .collection('appliedjobs')
          .doc(widget.jobid)
          .set({
        'why': whycontroller.text,
        'expectation': expectcontroller.text,
        'jobid': widget.jobid,
        'applyeruid': widget.applyeruid,
        'employeruid': widget.employeruid
      });
      await FirebaseFirestore.instance
          .collection('jobs')
          .doc(widget.jobid)
          .collection('people')
          .doc(widget.applyeruid)
          .set({
        'why': whycontroller.text,
        'expectation': expectcontroller.text,
        'jobid': widget.jobid,
        'applyeruid': widget.applyeruid,
        'employeruid': widget.employeruid
      });
      Fluttertoast.showToast(msg: 'Applied for Job Successfully!');
    } else {
      Fluttertoast.showToast(msg: 'Very Short Answers Provided!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            modified_text(text: 'Application', size: 20, color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 10),
            modified_text(
                text: 'Why you want to Join?',
                size: 16,
                color: Colors.grey.shade900),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              cursorColor: AppColors.primary,
              controller: whycontroller,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade900),
                  ),
                  suffixIcon: Icon(
                    Icons.query_stats_outlined,
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
              keyboardType: TextInputType.multiline,
              maxLines: null,
              cursorColor: AppColors.primary,
              controller: expectcontroller,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade900),
                  ),
                  suffixIcon: Icon(
                    Icons.question_answer,
                    color: Colors.grey.shade600,
                  ),
                  hintText: ''),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                saveapplication();
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
      ),
    );
  }
}
