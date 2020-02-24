import 'package:flutter/material.dart';

class Bemvindo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color:Colors.tealAccent,
      child: new Center(
        child:new Text("Olá,Luciano",
          textDirection: TextDirection.ltr,
          style: new TextStyle(fontSize: 34,fontFamily: 'Trade Winds'),
        ),
      ),
    );
  }
}