import 'package:flutter/material.dart';

void main() => runApp(HomeApp());

class HomeApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center (

      child: Text("Hello Flutter",
      textDirection: TextDirection.ltr, style: TextStyle(fontWeight: FontWeight.bold),),

    );


  }
}