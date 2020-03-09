import 'package:flutter/material.dart';


class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
        BlueBox(),
        BlueBox(),
        BlueBox()
      ],

    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(
          color: Colors.red,
          width: 1,
          style:BorderStyle.solid


        )
      ),
    );
  }
}
