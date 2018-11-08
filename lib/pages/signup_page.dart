import 'package:flutter/material.dart';
import 'package:fworkout/data/database_helper.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (input) {
                if (input.isEmpty) {
                  return 'Please enter your name';
                }
              },
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (input) {
                if (input.isEmpty) {
                  return 'Please enter your email';
                }
              },
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (input) {
                if (input.isEmpty) {
                  return 'Please enter your password';
                }
              },
            ),
            RaisedButton(
              child: Text('SignUp'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  DBHelper dbHelper = DBHelper();
                  dbHelper.saveUser(
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                  );
                  Navigator.pushReplacementNamed(context, '/login');
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
