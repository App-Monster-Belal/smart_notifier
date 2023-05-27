import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dropdown.dart';


class ExcelPickerScreen extends StatefulWidget {
  @override
  _ExcelPickerScreenState createState() => _ExcelPickerScreenState();
}

class _ExcelPickerScreenState extends State<ExcelPickerScreen> {
  File? pickedFile;

  Future<void> pickExcelFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );
    if (result != null) {
      setState(() {
        pickedFile = File(result.files.single.path!);
      });
    }
  }

  Future<String?> uploadFile() async {
    if (pickedFile == null) return null;

    String fileName = pickedFile!.path.split('/').last;
    Reference storageRef = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = storageRef.putFile(pickedFile!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<void> saveToDatabase() async {
    String? downloadUrl = await uploadFile();
    if (downloadUrl == null) return;

    FirebaseFirestore.instance.collection('excel_files').add({
      'url': downloadUrl,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excel File Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.file_upload),
              onPressed: pickExcelFile,
            ),
            SizedBox(height: 16.0),
            pickedFile != null ? Text(pickedFile!.path) : SizedBox(),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Upload'),
              onPressed: saveToDatabase,
            ),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>Mypage(),));
            }, child: Text("Done"))
          ],
        ),
      ),
    );
  }
}
