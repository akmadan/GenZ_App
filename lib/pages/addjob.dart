import 'package:flutter/material.dart';
import 'package:genz/utils/colors.dart';
import 'package:genz/utils/text.dart';

class AddJob extends StatefulWidget {
  const AddJob({Key? key}) : super(key: key);

  @override
  _AddJobState createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  String dropdownValue = 'Marketing';
  TextEditingController salarycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
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
                    Icons.person,
                    color: Colors.grey.shade600,
                  ),
                  hintText: 'eg. Job Role'),
            ),
            SizedBox(height: 20),
            modified_text(
                text: 'Enter Salary', size: 16, color: Colors.grey.shade900),
            TextField(
              cursorColor: AppColors.primary,
              controller: salarycontroller,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade900),
                  ),
                  suffixIcon: Icon(
                    Icons.person,
                    color: Colors.grey.shade600,
                  ),
                  hintText: "eg. "),
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
            ))
          ],
        ));
  }
}
