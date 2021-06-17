import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:genz/components/fieldbubble.dart';
import 'package:genz/components/jobbubble.dart';
import 'package:genz/utils/text.dart';

class Jobs extends StatefulWidget {
  const Jobs({Key? key}) : super(key: key);

  @override
  _JobsState createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  final Stream<QuerySnapshot> _jobStream =
      FirebaseFirestore.instance.collection('jobs').snapshots();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bold_text(text: 'Job Fields', size: 20, color: Colors.grey.shade800),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: 150,
            // color: Colors.red,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FieldBubble(
                        field: 'Science',
                        url:
                            'https://thumbs-prod.si-cdn.com/s-jZTk0XtVmp-89MlOgFXqaAVe4=/fit-in/1600x0/https://public-media.si-cdn.com/filer/29/0f/290fb8c0-1872-46e5-8c12-235742905def/science_smithsonian_magazine_booklist_2019.png'),
                    FieldBubble(
                      field: 'Data Entry',
                      url:
                          'https://www.import.io/wp-content/uploads/2019/09/data-analysis-blog.jpg',
                    ),
                    FieldBubble(
                      field: 'Marketing',
                      url:
                          'https://www.1point21gws.com/insights/wp-content/uploads/2019/06/82257074-cacaroot-marketing-boards-1024x575@2x.jpg',
                    ),
                    FieldBubble(
                      field: 'Content',
                      url:
                          'https://s3-us-east-2.amazonaws.com/maryville/wp-content/uploads/2020/07/20094519/MVU-BSBUSAD-2020-Q1-Skyscraper-Digital-Marketing-Strategy-Key-Components-Tips-to-Get-Started-01.jpg',
                    ),
                    FieldBubble(
                        field: 'Teaching',
                        url:
                            'http://wwwf.imperial.ac.uk/blog/gp-teaching/files/2019/01/darkside-1024x629.jpg'),
                  ],
                ),
              )
            ]),
          ),
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
