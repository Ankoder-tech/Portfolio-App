import 'package:flutter/material.dart';
import 'package:my_app/about.dart';
import 'package:my_app/aboutme.dart';
import 'package:my_app/home.dart';
import 'package:my_app/project.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'home',
    debugShowCheckedModeBanner: false,
    routes: {
      'home': ((context) => MyHome()),
      'about': ((context) => MyAbout()),
      'project': ((context) => MyProject()),


    }
  ),
  );


}


