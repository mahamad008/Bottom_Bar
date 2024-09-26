import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Create"),),
      body: Center(
        child: Text('Create Screen',style: TextStyle(fontSize: 40),),
      ),
    );
  }
}