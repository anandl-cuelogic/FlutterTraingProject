import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class BoardApp extends StatefulWidget {
  @override
  _BoardAppState createState() => _BoardAppState();
}

class _BoardAppState extends State<BoardApp> {

  var firebStoraseDb = Firestore.instance.collection("board").snapshots();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Community"),
       ),
      body: StreamBuilder(
          stream:  firebStoraseDb,
          builder: (context, snapshots){
            if(!snapshots.hasData) return CircularProgressIndicator();

            return ListView.builder(
                itemCount: snapshots.data.document.length,
                itemBuilder: (context, int index){
                 return Text(snapshots.data.document[index]['title']);
            });

      }),
    );
  }
}
