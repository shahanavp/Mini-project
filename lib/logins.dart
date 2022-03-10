import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable/service/auth_provider.dart';
import 'package:timetable/viewts.dart';
import 'package:provider/provider.dart';

class logins extends StatefulWidget {
  logins({Key? key}) : super(key: key);
  @override
  State<logins> createState() => _loginsState();
}

class _loginsState extends State<logins> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isDataMachted = true;
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
          .pushReplacement(MaterialPageRoute(builder: (ctx) => viewts()));
    ;

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final authprovider = context.watch<AuthProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Text(
                'STUDENT LOGIN',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter Your Name',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Password',
                  ),
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
              ElevatedButton(
                child: Text('Log In'),
                onPressed: () => signIn(authprovider),
              ),
            ],
          )),
    );
  }

  Future<void> setData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isLoggedIn', true);
    // pref.setString('Type', 'User');
  }

  //Future<void> checkLogin(BuildContext ctx) async {
  //final _username = _usernameController.text;
  //final _password = _passwordController.text;
  //if (_username == 'admin' && _password == 'admin') {
  // Goto Donor Page
  //Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => viewts()));
  //} else {
  //print('Invalid');
  //}
}
