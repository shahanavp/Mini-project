import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:timetable/viewtt.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable/service/auth_provider.dart';
import 'package:provider/provider.dart';

class logint extends StatefulWidget {
  const logint({Key? key}) : super(key: key);

  @override
  _logintState createState() => _logintState();
}

class _logintState extends State<logint> {
  CollectionReference Teacherlogin =
      FirebaseFirestore.instance.collection("viewtt");
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isDataMatched = true;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signIn(AuthProvider provider) async {
    final msg = await provider.signIn(
        _usernameController.text, _passwordController.text);
    if (msg == '')
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => viewtt()));
    ;

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  Widget build(BuildContext context) {
    final authprovider = context.watch<AuthProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Column(children: <Widget>[
        Text(
          'TEACHER LOGIN',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'User Name',
              hintText: 'Enter Your Name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter Username';
              } else {
                return null;
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              hintText: 'Enter Password',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter password';
              } else {
                return null;
              }
            },
          ),
        ),
        if (authprovider.loading)
          const CircularProgressIndicator(
            strokeWidth: 3,
          ),
        if (!authprovider.loading)
          const SizedBox(
            height: 30,
          ),
        Center(
            child: ElevatedButton(
          child: const Text('LogIn'),
          onPressed: () => signIn(authprovider),
        ))
      ]),
    );
  }

  Future<void> setData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isLoggedIn', true);
    // pref.setString('Type', 'User');
  }

  Future<void> checkLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    print("jjjjjjjjjjj" + _username);
    if (_username == 'staff' && _password == 'staff') {
      // Goto Donor Page
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => viewtt()));
    } else {
      print('Invalid ');
    }
  }
}
