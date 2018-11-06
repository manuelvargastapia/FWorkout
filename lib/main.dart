import 'package:flutter/material.dart';

void main() => runApp(FWorkout());

class FWorkout extends StatelessWidget {
  final String _appName = 'FWorkout';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appName,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_appName),
        ),
        body: Container(),
      ),
    );
  }
}
