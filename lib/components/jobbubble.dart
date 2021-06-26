import 'package:flutter/material.dart';
import 'package:genz/utils/colors.dart';
import 'package:genz/utils/text.dart';

class Jobbubble extends StatelessWidget {
  final String title, description, field, salary, deadline, jobid;
  final bool isme;

  const Jobbubble(
      {Key? key,
      required this.title,
      required this.isme,
      required this.description,
      required this.field,
      required this.salary,
      required this.deadline,
      required this.jobid})
      : super(key: key);

  applyjob() async {
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(15),
      // height: 210,
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
        !isme
            ? ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.primary)),
                onPressed: () {},
                child: modified_text(
                    text: 'Apply Now', size: 16, color: Colors.white))
            : ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.primary)),
                onPressed: () {},
                child: modified_text(
                    text: 'Withdraw', size: 16, color: Colors.white))
      ]),
    );
  }
}
