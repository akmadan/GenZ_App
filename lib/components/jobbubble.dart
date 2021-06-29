import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genz/pages/applyjob.dart';
import 'package:genz/utils/colors.dart';
import 'package:genz/utils/text.dart';

class Jobbubble extends StatelessWidget {
  final String title,
      description,
      field,
      salary,
      deadline,
      jobid,
      employeruid,
      applyeruid;
  final bool isme;

  const Jobbubble(
      {Key? key,
      required this.title,
      required this.isme,
      required this.description,
      required this.field,
      required this.salary,
      required this.deadline,
      required this.jobid,
      required this.employeruid,
      required this.applyeruid})
      : super(key: key);

  applyjob(BuildContext context) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ApplyJob(
                applyeruid: applyeruid,
                employeruid: employeruid,
                jobid: jobid)));
  }

  savejob() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(applyeruid)
        .collection('savedjobs')
        .doc(jobid)
        .set({
      'jobid': jobid,
    });
    Fluttertoast.showToast(msg: 'Job Saved');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        modified_text(
            text: 'Job Title - ' + title,
            size: 16,
            color: Colors.grey.shade900),
        modified_text(
            text: 'Job Description - ' + description,
            size: 16,
            color: Colors.grey.shade900),
        modified_text(
            text: 'Salary - \$' + salary,
            size: 16,
            color: Colors.grey.shade900),
        Divider(),
        modified_text(
            text: 'Deadline - ' + deadline,
            size: 16,
            color: Colors.grey.shade900),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            !isme
                ? ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primary)),
                    onPressed: () {
                      applyjob(context);
                    },
                    child: modified_text(
                        text: 'Apply Now', size: 16, color: Colors.white))
                : ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primary)),
                    onPressed: () {},
                    child: modified_text(
                        text: 'Withdraw', size: 16, color: Colors.white)),
            !isme
                ? IconButton(
                    onPressed: () {
                      savejob();
                    },
                    icon: Icon(Icons.bookmark_border_sharp))
                : Container()
          ],
        )
      ]),
    );
  }
}
