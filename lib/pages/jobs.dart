import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:genz/components/fieldbubble.dart';
import 'package:genz/components/jobbubble.dart';
import 'package:genz/utils/text.dart';

class Jobs extends StatefulWidget {
  final String uid;
  const Jobs({Key? key, required this.uid}) : super(key: key);

  @override
  _JobsState createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  final Stream<QuerySnapshot> _jobStream =
      FirebaseFirestore.instance.collection('jobs').snapshots();
  String selectedfield = 'all';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bold_text(text: 'Job Fields', size: 20, color: Colors.grey.shade800),
          SizedBox(height: 10),
          Container(
              width: double.infinity,
              child: Wrap(direction: Axis.horizontal, children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        selectedfield = 's';
                      });
                    },
                    child: FieldBubble(field: 'Science')),
                InkWell(
                    onTap: () {
                      setState(() {
                        selectedfield = 'd';
                      });
                    },
                    child: FieldBubble(field: 'Data Entry')),
                InkWell(
                    onTap: () {
                      setState(() {
                        selectedfield = 'm';
                      });
                    },
                    child: FieldBubble(field: 'Marketing')),
                InkWell(
                    onTap: () {
                      setState(() {
                        selectedfield = 'c';
                      });
                    },
                    child: FieldBubble(field: 'Content')),
                InkWell(
                    onTap: () {
                      setState(() {
                        selectedfield = 't';
                      });
                    },
                    child: FieldBubble(field: 'Teaching')),
              ])),
          SizedBox(height: 20),
          bold_text(text: 'All Jobs', size: 20, color: Colors.grey.shade800),
          SizedBox(height: 10),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _jobStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return new ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      return Jobbubble(
                        applyeruid: widget.uid,
                        employeruid: data['uid'],
                        isme: widget.uid == data['uid'] ? true : false,
                        jobid: data['jobid'],
                        title: data['title'],
                        description: data['description'],
                        field: data['field'],
                        salary: data['salary'],
                        deadline: data['deadline'],
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
