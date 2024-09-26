
import 'package:flutter/material.dart';
import 'package:flutter_application_4/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
