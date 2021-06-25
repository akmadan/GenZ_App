import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:genz/utils/text.dart';
import 'package:open_file/open_file.dart';

class AddResume extends StatefulWidget {
  final String uid;
  const AddResume({Key? key, required this.uid}) : super(key: key);

  @override
  _AddResumeState createState() => _AddResumeState();
}

class _AddResumeState extends State<AddResume> {
  // bool isresumepicked = false;
  // String? filepath;
  // Uint8List? fileBytes;
  // String? filename;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: modified_text(text: 'Add Resume', size: 20, color: Colors.white),
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  width: 300,
                  child: ElevatedButton(
                    child: Text('Pick Resume'),
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf', 'doc'],
                      );

                      if (result != null) {
                        Uint8List fileBytes = result.files.first.bytes!;
                        String fileName = result.files.first.name;

                        // Upload file
                        await FirebaseStorage.instance
                            .ref('uploads/$fileName')
                            .putData(fileBytes);
                        print('Done');
                      } else {
                        // User canceled the picker
                      }
                    },
                  ),
                ),
                // ElevatedButton(
                //   child: Text('Upload Resume'),
                //   onPressed: () async {
                //     await FirebaseStorage.instance
                //         .ref('uploads/$filename')
                //         .putData(fileBytes!);

                //     print('Done');
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
