import 'package:flutter/material.dart';

import 'ui/master_detail_screen.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),


      home: MasterDetailScreen()
    );
  }
}

