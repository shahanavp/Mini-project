import 'package:flutter/material.dart';
import 'package:timetable/entry.dart';
import 'package:timetable/subject.dart';
import 'package:timetable/teacher.dart';

class mainpage extends StatelessWidget {
  mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return teacher();
                        }));
                      },
                      child: Text("ADD TEACHER")),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return subject();
                        }));
                      },
                      child: Text("ADD SUBJECT")),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return entry();
                        }));
                      },
                      child: Text("ADD TIMETABLE")),
                ]),
          ),
        ));
  }
}
