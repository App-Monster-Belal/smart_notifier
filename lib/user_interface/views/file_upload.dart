import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_notifier/user_interface/views/selection.dart';

class File extends StatefulWidget {
  const File({Key? key}) : super(key: key);

  @override
  State<File> createState() => _FileState();
}

class _FileState extends State<File> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Upload"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
              child: Text(
            "Upload Class Routine",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w800, color: Colors.green),
          )),
          SizedBox(
            height: 50,
          ),
          Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[400]),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.upload_file_outlined),
                      iconSize: 50,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Drag \& Drop or Browse your file',
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    )
                  ],
                ),
              )),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 40,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => Select()));
                },
                child: Text(
                  "Done",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
