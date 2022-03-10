import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timetable/mainpage.dart';

class entry extends StatefulWidget {
  const entry({Key? key}) : super(key: key);

  @override
  State<entry> createState() => _entryState();
}

class _entryState extends State<entry> {
  CollectionReference entry = FirebaseFirestore.instance.collection("entry");
  late String day;
  late String department;
  late String semester;
  late String subname;
  late String period;
  late String staff;
  get floatingActionButton => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                  onChanged: (value) {
                    day = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Day',
                      hintText: 'Enter the day')),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  onChanged: (value) {
                    department = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Department',
                      hintText: 'Enter the department')),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  onChanged: (value) {
                    semester = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Semester',
                      hintText: 'Enter the semester')),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  onChanged: (value) {
                    subname = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Subject name',
                      hintText: 'Enter the subject')),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  onChanged: (value) {
                    period = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Period',
                      hintText: 'Enter the period')),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  onChanged: (value) {
                    staff = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Staff',
                      hintText: 'Enter the name')),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await entry.add({
                      'day': day,
                      'department': department,
                      'semester': semester,
                      'subject name': subname,
                      'period': period,
                      'staff': staff
                    }).then((value) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => mainpage()));
                    });
                  },
                  child: const Text('submit'),
                ),
              )
            ],
          )),
    );
  }
}
