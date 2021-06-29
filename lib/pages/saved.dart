import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:genz/components/jobbubble.dart';

class Saved extends StatefulWidget {
  final String uid;
  const Saved({Key? key, required this.uid}) : super(key: key);

  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(widget.uid)
            .collection('savedjobs')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            final savedocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: savedocs.length,
              itemBuilder: (context, index) {
                return FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('jobs')
                      .doc(savedocs[index]['jobid'])
                      .get(),
                  builder: (context, jobsnapshot) {
                    if (jobsnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: Container());
                    } else {
                      return Jobbubble(
                          title: jobsnapshot.data!['title'],
                          isme: false,
                          description: jobsnapshot.data!['description'],
                          field: jobsnapshot.data!['field'],
                          salary: jobsnapshot.data!['salary'],
                          deadline: jobsnapshot.data!['deadline'],
                          jobid: jobsnapshot.data!['jobid'],
                          employeruid: jobsnapshot.data!['uid'],
                          applyeruid: widget.uid);
                    }
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
