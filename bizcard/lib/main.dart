import 'package:bizcard/json_parsing/json_parsing.dart';
import 'package:bizcard/json_parsing/json_parsing_map.dart';
import 'package:bizcard/ui/home.dart';
import 'package:flutter/material.dart';



final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();


  return base.copyWith(
    brightness: Brightness.dark,
    accentColor: Colors.amber,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.red,
    backgroundColor: Colors.amber,
    textTheme: _textTheme(base.textTheme)
  );
}

TextTheme _textTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500
    ),
    title: base.title.copyWith(
      fontSize: 18.0
  ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0
    ),
    button: base.button.copyWith(
     // fontSize: 23.9,
    //  backgroundColor: Colors.red
    ),
    body1: base.body1.copyWith(
        fontSize: 16.9,
        color: Colors.white
    )
  ).apply(
      fontFamily: "Lobster"
  );
}


void main() => runApp(new MaterialApp(
 // theme: _appTheme,
  /*ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey[800],
    textTheme: TextTheme(
      headline: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.bold
      ),
      body1: TextStyle(
        fontSize: 16.9,
        color: Colors.white
      )
    ),
  ),*/

  home: JsonParsingMap(),
));



