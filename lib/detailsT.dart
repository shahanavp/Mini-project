import 'package:flutter/material.dart';

class detailsT extends StatelessWidget {
  const detailsT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue),
        body: Center(
            child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: Table(
              // defaultColumnWidth: FixedColumnWidth(120.0),
              border: TableBorder.all(
                  color: Colors.black, style: BorderStyle.solid, width: 2),
              children: [
                TableRow(children: [
                  Column(children: [
                    Text('PERIOD', style: TextStyle(fontSize: 15.0))
                  ]),
                  Column(children: [
                    Text('DEPARTMENT', style: TextStyle(fontSize: 15.0))
                  ]),
                  Column(children: [
                    Text('SEMESTER', style: TextStyle(fontSize: 15.0))
                  ]),
                  Column(children: [
                    Text('SUBJECT', style: TextStyle(fontSize: 15.0))
                  ]),
                ]),
                TableRow(children: [
                  Column(children: [Text('1')]),
                  Column(children: [Text('MCA')]),
                  Column(children: [Text('S3')]),
                  Column(children: [Text('DAA')]),
                ]),
                TableRow(children: [
                  Column(children: [Text('2')]),
                  Column(children: [Text('MCA')]),
                  Column(children: [Text('S3')]),
                  Column(children: [Text('DATA SCIENCE')]),
                ]),
                TableRow(children: [
                  Column(children: [Text('3')]),
                  Column(children: [Text('MCA')]),
                  Column(children: [Text('S3')]),
                  Column(children: [Text('DEEP LEARNING')]),
                ]),
                TableRow(children: [
                  Column(children: [Text('4')]),
                  Column(children: [Text('MCA')]),
                  Column(children: [Text('S3')]),
                  Column(children: [Text('CC/CS')]),
                ]),
                TableRow(children: [
                  Column(children: [Text('5')]),
                  Column(children: [Text('MCA')]),
                  Column(children: [Text('S3')]),
                  Column(children: [Text('DS LAB')]),
                ]),
                TableRow(children: [
                  Column(children: [Text('6')]),
                  Column(children: [Text('MCA')]),
                  Column(children: [Text('S3')]),
                  Column(children: [Text('DS LAB')]),
                ]),
              ],
            ),
          ),
        ])));
  }
}
