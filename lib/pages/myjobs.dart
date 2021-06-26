import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:genz/components/jobbubble.dart';
import 'package:genz/utils/text.dart';

class MyJobs extends StatefulWidget {
  final String uid;
  const MyJobs({Key? key, required this.uid}) : super(key: key);

  @override
  _MyJobsState createState() => _MyJobsState();
}

class _MyJobsState extends State<MyJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: modified_text(text: 'Your Jobs', size: 20, color: Colors.white),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(widget.uid)
            .collection('jobs')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return new ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return Jobbubble(
                  employeruid: data['uid'],
                  applyeruid: widget.uid,
                  isme: true,
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
    );
  }
}
