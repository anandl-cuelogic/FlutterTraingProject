import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BoardApp extends StatefulWidget {
  @override
  _BoardAppState createState() => _BoardAppState();
}

class _BoardAppState extends State<BoardApp> {

  var firebStoraseDb = Firestore.instance.collection("board").snapshots();
 TextEditingController nameInputController;
 TextEditingController titleInputController;
 TextEditingController descriptionInputController;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameInputController = TextEditingController();
    titleInputController = TextEditingController();
    descriptionInputController = TextEditingController();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Community"),
       ),

      floatingActionButton: FloatingActionButton(onPressed: () {
         _showDialog(context);
      }, child: Icon(FontAwesomeIcons.pen),),
      body: StreamBuilder(
          stream:  firebStoraseDb,
          builder: (context, snapshots){
            if(!snapshots.hasData) return CircularProgressIndicator();

            return ListView.builder(
                itemCount: snapshots.data.documents.length,
                itemBuilder: (context, int index){
                 return Text(snapshots.data.documents[index]['description'].toString());
            });

      }),
    );
  }
  _showDialog(BuildContext context) async {
     await showDialog(context: context,
     child:AlertDialog(
       contentPadding: EdgeInsets.all(10),
       content: Column(
         children: <Widget>[
           Text("Please fill out the form."),
           Expanded(child: TextField(
             autofocus: true,
             autocorrect: true,
             decoration: InputDecoration(
               labelText: "Your Name*"
             ),
             controller: nameInputController,
           ),),
           Expanded(child: TextField(
             autofocus: true,
             autocorrect: true,
             decoration: InputDecoration(
                 labelText: "Title*"
             ),
             controller: titleInputController,
           ),),
           Expanded(child: TextField(
             autofocus: true,
             autocorrect: true,
             decoration: InputDecoration(
                 labelText: "Description*"
             ),
             controller: descriptionInputController,
           ),)
         ],
       ),

       actions: <Widget>[
         FlatButton(onPressed: (){
           nameInputController.clear();
           titleInputController.clear();
           descriptionInputController.clear();
           Navigator.pop(context);
         },
         child: Text("Cancel"),),

         FlatButton(onPressed: (){
            if(nameInputController.text.isNotEmpty && titleInputController.text.isNotEmpty
                && descriptionInputController.text.isNotEmpty) {
                 Firestore.instance.collection("board")
                     .add({
                       "name" : nameInputController.text,
                       "title" : titleInputController.text,
                       "description": descriptionInputController.text,
                       "timestame" : new DateTime.now()

                 }).then((response){
                     print(response.documentID);
                     Navigator.pop(context);
                     nameInputController.clear();
                     titleInputController.clear();
                     descriptionInputController.clear();
                 }).catchError((onError) => print(onError));
            }else {

            }
         },
         child: Text("Save"),)
       ],
     ));
  }
}
