import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JsonParsingSimple extends StatefulWidget {
  @override
  _JsonParsingSimpleState createState() => _JsonParsingSimpleState();
}

class _JsonParsingSimpleState extends State<JsonParsingSimple> {
  Future data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    data = getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Parsing"),
      ),
      body: Center(
        child: Container (
          child: FutureBuilder(
              future: getData(),
              builder: (context, AsyncSnapshot snpshot){
                if(snpshot.hasData){
                  return CreatListView(snpshot.data,context);
                }else {
                  return CircularProgressIndicator();
                }

              }),
        ),
      )
    );

  }

  Future getData() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    Future data;
    Network network = Network(url);
    data = network.fetchData();
   /* data.then((value){
      print(value);
    });*/
    return data;
  }

  Widget CreatListView(List data, BuildContext context) {

    return Container(
      child: ListView.builder(itemCount:data.length,itemBuilder: (context, int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Divider(height: 5.0,),
            ListTile(
              title: Text("${data[index]["title"]}"),
              subtitle:Text("${data[index]["id"]}"),
              leading: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.black26,
                    radius: 23,
                    child: Text("${data[index]["userId"]}"),
                  )
                ],
              ),
            )
          ],
        );
    }));

  }
}

class Network {
  final String url;

  Network(this.url);

  Future fetchData() async {
    print("$url");
    Response response = await get(Uri.encodeFull(url));

    if (response?.statusCode == 200) {
      // ok
     // print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
