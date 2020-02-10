import 'package:flutter/material.dart';

class ScaffoldExample extends StatelessWidget {
  _tabButton() {
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
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => debugPrint("EDIT Tapped")),
          IconButton(icon: Icon(Icons.access_alarm), onPressed: _tabButton)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon:  Icon(Icons.account_circle), title: Text("First")),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text("Second")),
        BottomNavigationBarItem(icon: Icon(Icons.access_alarm), title: Text("Third"))
      ], onTap: (int index) => debugPrint("Tapped item : $index"),),

     floatingActionButton: FloatingActionButton(
       backgroundColor: Colors.lightGreen,
       child: Icon(Icons.edit),
       onPressed: () => debugPrint("Hello"),
     ),

      backgroundColor: Colors.redAccent.shade100,
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomButton()
            ],
          )),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text("Hi My Name is Anand"),
          backgroundColor: Colors.amberAccent.shade700,
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: Colors.pinkAccent, borderRadius: BorderRadius.circular(8.0)),
        child: Text("Click me"),
      ),
    );
  }
}

