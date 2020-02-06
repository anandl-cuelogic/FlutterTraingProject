

import 'package:flutter/material.dart';


class ScaffoldExample extends StatelessWidget {
  _tabButton(){
    debugPrint("Something is priniting");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Example"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.edit),onPressed:() => debugPrint("EDIT Tapped") ),
          IconButton(icon: Icon(Icons.access_alarm),onPressed:_tabButton)
        ],
      ),
 body: Center(
     child: Text("Hello again"),
 ),
    );
  }
}


class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
      child: Center(
          child: Text(
            "Hello, This is my first program",
            textDirection: TextDirection.ltr,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25.05,
                fontStyle: FontStyle.italic),
          )),
    );
  }
}
