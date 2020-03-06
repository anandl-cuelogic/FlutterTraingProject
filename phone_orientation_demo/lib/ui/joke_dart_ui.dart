import 'package:flutter/material.dart';
import 'package:phone_orientation_demo/model/joke.dart';

class JokeListing extends StatelessWidget {

  JokeListing({@required this.jokeSelectedCallback, this.jokeSelected});
  final ValueChanged<Joke> jokeSelectedCallback;
  final Joke jokeSelected;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: jokesList.map((value){
        return Container(
          child: ListTile(
            title: Text(value.setup),
            onTap: () => jokeSelectedCallback(value),
            selected: jokeSelected == value,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4.5)
          )
          ,
        );
      }).toList(),
    );
  }

}
