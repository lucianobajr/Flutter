import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Coluna extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(100, 143, 134, 166),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,//Ficar no meio da tela
        children: <Widget>[
          new Text("Primeiro",
          textDirection: TextDirection.ltr,
          style: TextStyle(fontStyle: FontStyle.italic,
              color: Colors.white,
              decoration: TextDecoration.none),),

          Text("Segundo",
            textDirection: TextDirection.ltr,
            style: TextStyle(fontStyle: FontStyle.italic,
                color: Colors.white,
                decoration: TextDecoration.none),),

          new FlatButton(onPressed:()=>  "Hello",
              color: Color.fromARGB(85, 76, 54, 51),
              child:Text("Botão"))
        ],
      )
    );
  }
}