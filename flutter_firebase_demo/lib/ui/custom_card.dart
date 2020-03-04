import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CustomCard extends StatelessWidget {
  final QuerySnapshot snapshots;
  final int index;

  const CustomCard({Key key, this.snapshots, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    var snapshotsData = snapshots.documents[index].data;
    var snapshotsDocumentId = snapshots.documents[index].documentID;
    TextEditingController  nameInputController = TextEditingController(text: snapshotsData["name"]);
    TextEditingController  titleInputController = TextEditingController(text: snapshotsData["title"]);
    TextEditingController descriptionInputController = TextEditingController(text:snapshotsData["description"]);

    var timeToDate = new DateTime.fromMillisecondsSinceEpoch(snapshotsData["timestame"].seconds * 1000);
    var dateFormatted = new DateFormat("EEE, MMM d, y").format(timeToDate);
    return Column(
      children: <Widget>[
        Container(
          height:150 ,
          child: Card(
            elevation: 9,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(snapshotsData["title"]),
                  subtitle: Text(snapshotsData["description"]),
                  leading: CircleAvatar(
                    radius:34,
                    child: Text(snapshotsData["title"].toString()[0].toUpperCase()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(" By:  ${snapshotsData["name"]}   "),
                      Text(dateFormatted),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(icon:Icon(FontAwesomeIcons.edit, size: 15,), onPressed: () async{
                      await showDialog(context:context, child: AlertDialog(
                         contentPadding: EdgeInsets.all(10),
                         content: Column(
                           children: <Widget>[
                             Text("Please fill out the form to update."),
                             Expanded(
                               child: TextField(
                                 autofocus: true,
                                 autocorrect: true,
                                 decoration: InputDecoration(labelText: "Your Name*"),
                                 controller: nameInputController,
                               ),
                             ),
                             Expanded(
                               child: TextField(
                                 autofocus: true,
                                 autocorrect: true,
                                 decoration: InputDecoration(labelText: "Title*"),
                                 controller: titleInputController,
                               ),
                             ),
                             Expanded(
                               child: TextField(
                                 autofocus: true,
                                 autocorrect: true,
                                 decoration: InputDecoration(labelText: "Description*"),
                                 controller: descriptionInputController,
                               ),
                             ),
                           ],
                         ),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              nameInputController.clear();
                              titleInputController.clear();
                              descriptionInputController.clear();
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                          FlatButton(
                            onPressed: () {
                              if (nameInputController.text.isNotEmpty &&
                                  titleInputController.text.isNotEmpty &&
                                  descriptionInputController.text.isNotEmpty) {
                                Firestore.instance.collection("board")
                                .document(snapshotsDocumentId)
                                .updateData(({
                                  "name": nameInputController.text,
                                  "title": titleInputController.text,
                                  "description": descriptionInputController.text,
                                  "timestame": new DateTime.now()
                                })).then((response){
                                  Navigator.pop(context);
                                  nameInputController.clear();
                                  titleInputController.clear();
                                  descriptionInputController.clear();
                                }).catchError((onError) =>print(onError));

                              } else {}
                            },
                            child: Text("Update"),
                          )
                        ],
                      ));

                    },),
                    SizedBox(height: 19,),
                    IconButton(icon:Icon(FontAwesomeIcons.trashAlt, size: 15,), onPressed: () async{
                      var collectionReference = Firestore.instance.collection("board");
                      await collectionReference
                          .document(snapshotsDocumentId)
                          .delete();
                    },)
                  ],
                )
              ],
            ),
          ),
        ),

      ],
    );
  }
}


