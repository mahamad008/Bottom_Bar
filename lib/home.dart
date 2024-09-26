import 'package:flutter/material.dart';
import 'package:flutter_application_4/page/chat.dart';
import 'package:flutter_application_4/page/create.dart';
import 'package:flutter_application_4/page/dashboard.dart';
import 'package:flutter_application_4/page/posts.dart';
import 'package:flutter_application_4/page/profile.dart';
import 'package:flutter_application_4/page/settings.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab=0;
  final List<Widget> screens=[
    Dashboard(),
    Chat(),
    Profile(),
    Settings(),
    Posts()
  ];
  final PageStorageBucket bucket=PageStorageBucket();
  Widget currentScreen=Posts();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            currentScreen=Create();
            currentTab=2;
          });
        },

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(minWidth: 48,onPressed: (){
                    setState(() {
                      currentScreen=Dashboard();
                      currentTab=0;
                    });
                  },
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: currentTab==0?Colors.blue:Colors.green,
                      ),
                      Text('home',style: TextStyle(color: currentTab==0?Colors.blue:Colors.green),)
                    ],
                  ) ,
                  ),
                                    MaterialButton(minWidth: 48,onPressed: (){
                    setState(() {
                      currentScreen=Chat();
                      currentTab=1;
                    });
                  },
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.chat,
                        color: currentTab==1?Colors.blue:Colors.green,
                      ),
                      Text('Chat',style: TextStyle(color: currentTab==1?Colors.blue:Colors.green),)
                    ],
                  ) ,
                  ),
                  
                ],
              ),
              // Right bar bottoms
                        Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(minWidth: 48,onPressed: (){
                    setState(() {
                      currentScreen=Settings();
                      currentTab=2;
                    });
                  },
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings,
                        color: currentTab==2?Colors.blue:Colors.green,
                      ),
                      Text('Settings',style: TextStyle(color: currentTab==2?Colors.blue:Colors.green),)
                    ],
                  ) ,
                  ),
                                    MaterialButton(minWidth: 48,onPressed: (){
                    setState(() {
                      currentScreen=Profile();
                      currentTab=3;
                    });
                  },
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: currentTab==3?Colors.blue:Colors.green,
                      ),
                      Text('Profile',style: TextStyle(color: currentTab==3?Colors.blue:Colors.green),)
                    ],
                  ) ,
                  ),
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}