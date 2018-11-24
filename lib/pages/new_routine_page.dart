import 'package:flutter/material.dart';
import 'package:fworkout/data/database_helper.dart';

class NewRoutinePage extends StatefulWidget {
  @override
  _NewRoutinePageState createState() => _NewRoutinePageState();
}

class _NewRoutinePageState extends State<NewRoutinePage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();
  final durationMinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Routine'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: _validateTextFormField,
            ),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              validator: _validateTextFormField,
            ),
            TextFormField(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Category'),
              validator: _validateTextFormField,
            ),
            TextFormField(
              controller: durationMinController,
              decoration: InputDecoration(labelText: 'Duration (min)'),
              validator: _validateTextFormField,
            ),
            RaisedButton(
              child: Text('Create Routine'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  DBHelper dbHelper = DBHelper();
                  dbHelper.saveRoutine(
                    nameController.text,
                    descriptionController.text,
                    categoryController.text,
                    durationMinController.text,
                  );
                  Navigator.pushReplacementNamed(context, '/home');
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  String _validateTextFormField(value) {
    if (value.isEmpty) {
      return 'Required field';
    } else {
      return null;
    }
  }
}
