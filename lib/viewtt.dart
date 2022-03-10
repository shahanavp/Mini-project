import 'package:flutter/material.dart';
import 'package:timetable/detailsT.dart';
import 'package:timetable/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class viewtt extends StatefulWidget {
  viewtt({Key? key}) : super(key: key);

  @override
  State<viewtt> createState() => _viewttState();
}

class _viewttState extends State<viewtt> {
  CollectionReference viewtt = FirebaseFirestore.instance.collection("viewtt");
  late String day;
  late String semester;
  // String drop = "Monday";
  final _day = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

  final _sem = ['S1', 'S2', 'S3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
                child: DropdownButtonFormField(
                    hint: Text('select the day'),
                    onChanged: (value) {
                      _day == value;
                    },
                    items: _day.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList()),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: DropdownButtonFormField(
                    // value: drop,
                    hint: Text('select semester'),
                    onChanged: (value) {
                      _sem == value;
                    },
                    items: _sem.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList()),
              ),
              ElevatedButton(
                onPressed: () async {
                  await viewtt.add({
                    'day': _day,
                    'semester': _sem,
                  }).then((value) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (ctx) => detailsT()));
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
