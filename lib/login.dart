import 'package:flutter/material.dart';
import 'package:timetable/mainpage.dart';
import 'package:timetable/logins.dart';
import 'package:timetable/logint.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable/service/auth_provider.dart';
import 'package:provider/provider.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isDataMachted = true;
  final _formKey = GlobalKey<FormState>();

  var padding;

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
          .pushReplacement(MaterialPageRoute(builder: (ctx) => mainpage()));
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
              'TIME TABLE MANAGEMENT',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return logint();
                  }));
                },
                child: Text('Teacher login')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return logins();
                  }));
                },
                child: Text('Student login')),
          ],
        ),
      ),
    );
  }

  Future<void> setData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isLoggedIn', true);
    // pref.setString('Type', 'User');
  }
}
