import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timetable/mainpage.dart';

class subject extends StatefulWidget {
  const subject({Key? key}) : super(key: key);

  @override
  State<subject> createState() => _subjectState();
}

class _subjectState extends State<subject> {
  CollectionReference subject =
      FirebaseFirestore.instance.collection("subject");

  late String subname;
  late String sem;
  late String dept;
  get floatingActionButton => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          TextFormField(
              onChanged: (value) {
                subname = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Subject name',
                  hintText: 'Enter the subject')),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
              onChanged: (value) {
                sem = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Semester',
                  hintText: 'Enter the semester')),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
              onChanged: (value) {
                dept = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Department',
                  hintText: 'Enter the department')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              await subject.add({
                'sub_name': subname,
                'department': dept,
                'semester': sem,
              }).then((value) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => mainpage()));
              });
            },
            child: const Text('submit'),
          ),
        ]),
      ),
    );
  }
}
