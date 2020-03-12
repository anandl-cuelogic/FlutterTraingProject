import 'package:flutter/material.dart';


class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
     crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      children:[
        Text(
          'Hey',
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'Future',
            color: Colors.blue
          ),
        ),
        Text(
          'Hey!',
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'Future',
            color: Colors.red
          ),
        ),
        Text(
          'Hey!',
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'Futura',
            color: Colors.green
          ),
        )
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


class AssigmentIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Column(
     mainAxisSize: MainAxisSize.min,
     crossAxisAlignment: CrossAxisAlignment.stretch,
      children:<Widget>[
           Row(
           children: [
           Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Icon(Icons.account_circle, size: 50),
    ),
        Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
          children: [
            Text('Flutter McFlutter',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                )),
            Text('Experienced App Developer',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white
            ),),
          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
           Text("123 Main Street",style: TextStyle(
               fontSize: 15,
             color: Colors.white
           ),),
           Text("(415)555-0198", style: TextStyle(
               fontSize: 15,
             color:Colors.white
           ),)
         ],
        ),
        SizedBox(height: 16,),
        Row()
      ],
    ));
  }
}

class IntroRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
     children: [
       Padding(
           padding: const EdgeInsets.all(8.0),
           child: Icon(Icons.account_circle, size: 50)),
       Column(
         mainAxisSize: MainAxisSize.min,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text('Flutter McFlutter',
               style: Theme.of(context).textTheme.headline),
           Text('Experienced App Developer'),
         ],
       ),
     ],
   );
  }
}
