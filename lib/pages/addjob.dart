import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genz/utils/colors.dart';
import 'package:genz/utils/text.dart';

class AddJob extends StatefulWidget {
  final String uid;
  const AddJob({Key? key, required this.uid}) : super(key: key);

  @override
  _AddJobState createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  String dropdownValue = 'Marketing';
  TextEditingController salarycontroller = TextEditingController();
  //_____________________________________________________________
  postjob() async {
    Fluttertoast.showToast(msg: 'Posting Your Job');
    String time = DateTime.now().toString();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .collection('jobs')
        .doc(time)
        .set({
      'uid': widget.uid,
      'jobid': time + widget.uid,
      'time': time,
      'title': titlecontroller.text,
      'description': descriptioncontroller.text,
      'salary': salarycontroller.text,
      'field': dropdownValue
    });
    await FirebaseFirestore.instance
        .collection('jobs')
        .doc(time + widget.uid)
        .set({
      'uid': widget.uid,
      'jobid': time + widget.uid,
      'time': time,
      'title': titlecontroller.text,
      'description': descriptioncontroller.text,
      'salary': salarycontroller.text,
      'field': dropdownValue
    });
  }

  //_____________________________________________________________
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 10),
            modified_text(
                text: 'Add Job Title', size: 16, color: Colors.grey.shade900),
            TextField(
              cursorColor: AppColors.primary,
              controller: titlecontroller,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade900),
                  ),
                  suffixIcon: Icon(
                    Icons.person,
                    color: Colors.grey.shade600,
                  ),
                  hintText: 'eg. Data Entry Intern'),
            ),
            SizedBox(height: 20),
            modified_text(
                text: 'Add Job Description',
                size: 16,
                color: Colors.grey.shade900),
            TextField(
              cursorColor: AppColors.primary,
              controller: descriptioncontroller,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade900),
                  ),
                  suffixIcon: Icon(
                    Icons.edit,
                    color: Colors.grey.shade600,
                  ),
                  hintText: 'eg. Job Role'),
            ),
            SizedBox(height: 20),
            modified_text(
                text: 'Enter Salary', size: 16, color: Colors.grey.shade900),
            TextField(
              keyboardType: TextInputType.number,
              cursorColor: AppColors.primary,
              controller: salarycontroller,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade900),
                  ),
                  suffixIcon: Icon(
                    Icons.attach_money_outlined,
                    color: Colors.grey.shade600,
                  ),
                  hintText: "eg. 500"),
            ),
            SizedBox(height: 20),
            modified_text(
                text: 'Pick Job Field', size: 16, color: Colors.grey.shade900),
            Container(
                child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              underline: Container(
                height: 2,
                color: Colors.grey.shade800,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>[
                'Marketing',
                'Science',
                'Data Entry',
                'Content',
                'Teaching'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                postjob();
              },
              child: Container(
                height: 54,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                    child: bold_text(
                  text: 'Post a Job',
                  color: Colors.white,
                  size: 18,
                )),
              ),
            ),
          ],
        ));
  }
}
