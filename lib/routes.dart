import 'package:flutter/material.dart';
import 'package:fworkout/pages/home_page.dart';
import 'package:fworkout/pages/login_page.dart';
import 'package:fworkout/pages/signup_page.dart';
import 'package:fworkout/pages/new_routine_page.dart';

final myRoutes = {
  '/': (BuildContext context) => LoginPage(),
  '/signup': (BuildContext context) => SignUpPage(),
  '/login': (BuildContext context) => LoginPage(),
  '/home': (BuildContext context) => HomePage(),
  //Nuevas rutas
  '/new_routine': (BuildContext context) => NewRoutinePage(),
};
