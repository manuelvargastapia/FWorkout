import 'package:flutter/material.dart';
import 'package:fworkout/model/user_model.dart';
import 'package:fworkout/data/database_helper.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to FWorkout'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your email';
                }
              },
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your password';
                }
              },
            ),
            RaisedButton(
              child: Text('Login'),
              onPressed: _authenticateUser,
            ),
            RaisedButton(
              child: Text('SignUp'),
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
            ),
          ],
        ),
      ),
    );
  }

  _authenticateUser() async {
    if (_formKey.currentState.validate()) {
      DBHelper dbHelper = DBHelper();
      dbHelper
          .getUser(emailController.text, passwordController.text)
          .then((List<User> users) {
        if (users != null && users.length > 0) {
          Navigator.pushNamed(context, '/home');
          print('[LoginPage] _authenticateUser: Success');
        } else {
          print('[LoginPage] _authenticateUser: Invalid credentials');
        }
      });
    }
  }
}
