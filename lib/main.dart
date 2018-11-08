import 'package:flutter/material.dart';
import 'routes.dart';

void main() => runApp(FWorkout());

class FWorkout extends StatelessWidget {
  final String _appName = 'FWorkout';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appName,
      debugShowCheckedModeBanner: false,
      routes: myRoutes,
    );
  }
}
