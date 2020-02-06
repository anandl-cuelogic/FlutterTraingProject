

import 'package:flutter/material.dart';

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
