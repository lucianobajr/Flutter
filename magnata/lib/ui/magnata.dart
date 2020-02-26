import 'dart:html';

import 'package:flutter/material.dart';

class Magnata extends StatefulWidget {
  @override
  _MagnataState createState() => _MagnataState();
}

class _MagnataState extends State<Magnata> {
  int _contadorGrana = 0;

  void _mandaGrana(){
    setState(() {
      _contadorGrana =_contadorGrana + 100;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Magnata"),
        backgroundColor: Color.fromRGBO(82,105,224,50),
      ),
      body: Container(
        child: new Column(
          children: <Widget>[
            Center(
                child: Text("Fique Rico!",
              style:TextStyle(
                color: Color.fromRGBO(82,105,224,100),
                fontWeight: FontWeight.w700,
                fontSize: 29.9
              ),  
              ),
            ),

            Expanded(child:Center(
              child: Text("\$ $_contadorGrana",
              style: TextStyle(fontSize:45.6 ,
              color: _contadorGrana>=10000 ? Color.fromRGBO(82,105,224,50):Color.fromRGBO(82,105,224,100),
              fontWeight: FontWeight.w700,),
              )
              ,)
            ),
            Expanded(child: Center(child: FlatButton(onPressed: _mandaGrana, 
            color: Color.fromRGBO(82,105,224,100),
            textColor: Colors.white,
            child: Text("Mais Grana!!",
            style: TextStyle(fontSize:19.9)
            ),),
            )),
          ],
        ),
      ),
    );
  }
}