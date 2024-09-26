import 'package:flutter/material.dart';
import 'package:flutter_application_4/page/chat.dart';
import 'package:flutter_application_4/page/dashboard.dart';
import 'package:flutter_application_4/page/profile.dart';
import 'package:flutter_application_4/page/settings.dart';

class MyWidget extends StatefulWidget {

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int currentTab=0;
  final List<Widget> screens=[
   Dashboard(),
   Chat(),
   Settings(),
   Profile(),

  ];
  final PageStorageBucket bucket=PageStorageBucket();
  Widget currentScreen=Dashboard();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: PageStorage(bucket: bucket, child:currentScreen),
     floatingActionButton: FloatingActionButton(onPressed: (){}),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     bottomNavigationBar: BottomAppBar(
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                MaterialButton(onPressed: (){},child: Column(
                  children: [
                    Icon(Icons.abc),
                    Text("data")
                  ],
                ),)
              ],
            )
          ],
        ),
      ),
     ),
    );
  }
}