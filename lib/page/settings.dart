import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Settings"),),
      body: Center(
        child: Text('Settings Screen',style: TextStyle(fontSize: 40),),
      ),
    );
  }
}