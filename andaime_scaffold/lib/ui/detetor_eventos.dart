import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetetorEventos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detetor"),

        backgroundColor: Color.fromARGB(255, 200, 220, 210),

      ),

      body: new Center(
        child:new MeuBotao(),
      ),
    );
  }
}
class MeuBotao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final snackBar = SnackBar(content: Text("chamou?"));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding:EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color:Color.fromARGB(255, 200, 220, 210)/*Theme.of(context).accentColor*/,
        borderRadius: BorderRadius.circular(5.5)
        ),
        child: Text("Click"),
      ),
    );
  }
}
