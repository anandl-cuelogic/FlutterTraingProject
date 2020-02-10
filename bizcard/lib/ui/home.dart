

import 'package:flutter/material.dart';

class ScaffoldExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar (
         title: Text("BizCard"),
         centerTitle: true,
       ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
           children: <Widget>[
             _getCard(),
             _getAvatar()
           ],
        ),

      ),


    );
  }

 Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50.05),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(4.5)
      ),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         Text("Anand Lilhare",
         style: TextStyle( fontSize:  20.9,
         color: Colors.white,
         fontWeight: FontWeight.w500),),

         Text("Buildappswithpaulo.com"),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Icon(Icons.person_outline),
             Text("T: @anandlilhare")
           ],
         )
       ],
     ),
    );

  }

  Container _getAvatar() {
    return Container (
      width: 100,
      height: 100,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50.0)) ,
        border: Border.all(color: Colors.redAccent, width: 1.2),
        image: DecorationImage(image: NetworkImage("https://picsum.photos/300/300"),fit:BoxFit.cover),
      ),
    );
  }
}
