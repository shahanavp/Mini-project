import 'package:flutter/material.dart';
import 'package:timetable/login.dart';
import 'package:timetable/detailsS.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class viewts extends StatefulWidget {
  viewts({Key? key}) : super(key: key);

  @override
  State<viewts> createState() => _viewtsState();
}

class _viewtsState extends State<viewts> {
  CollectionReference viewts = FirebaseFirestore.instance.collection("viewts");

  final _day = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

  final _sem = ['S1', 'S2', 'S3'];

  final _dept = ['MCA'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(backgroundColor: Colors.blue),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
                child: DropdownButtonFormField(
                    hint: Text('Department'),
                    onChanged: (value) {
                      _dept == value;
                      // print(value);
                    },
                    items: _dept.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList()),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: DropdownButtonFormField(
                    hint: Text('select semester'),
                    onChanged: (value) {
                      _sem == value;
                      //print(value);
                    },
                    items: _sem.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList()),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: DropdownButtonFormField(
                    hint: Text('select day'),
                    onChanged: (value) {
                      _day == value;
                      // print(value);
                    },
                    items: _day.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList()),
              ),
              ElevatedButton(
                onPressed: () async {
                  await viewts.add({
                    'day': _day,
                    'semester': _sem,
                    'department': _dept,
                  }).then((value) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (ctx) => detailsS()));
                  });
                },
                child: Text('view'),
              ),
              TextButton(
                child: Text('EXIT'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return login();
                  }));
                },
              ),
            ])));
  }
}
