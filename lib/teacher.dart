import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timetable/mainpage.dart';

class teacher extends StatefulWidget {
  const teacher({Key? key}) : super(key: key);
  @override
  State<teacher> createState() => _teacherState();
}

class _teacherState extends State<teacher> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(backgroundColor: Colors.blue),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class, which holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  CollectionReference teacher =
      FirebaseFirestore.instance.collection("teacher");
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.bool _value = false;
  late String id;
  late String name;
  late String place;
  late String phone;
  late String email;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                onChanged: (value) {
                  id = value;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.insert_drive_file),
                  labelText: 'Enter id',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the id';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  name = value;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Enter your full name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  place = value;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.place),
                  labelText: 'Enter your place',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid date';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  phone = value;
                },
                decoration: const InputDecoration(
                  icon: const Icon(Icons.phone),
                  labelText: 'Enter the Phone number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail_outline),
                  labelText: 'Enter your mail',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the mail';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await teacher.add({
                      'Id': id,
                      'Name': name,
                      'place': place,
                      'Phone': phone,
                      'Email': email,
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
// ignore: non_constant_identifier_names
}
