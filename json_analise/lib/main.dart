import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {

  List _dados = await getJson();
  //List _dados = await jsonComplexo();

  String _body = "";
  _body = _dados[0]['body'];

  runApp(new MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('JSON'),
        centerTitle: true,
      ),
      body: Center(
        child: 
        ListView.builder(
          itemCount: _dados.length,
          padding: const EdgeInsets.all(14.5),
          itemBuilder: (BuildContext context,int posicao){
            return Column(
              children: <Widget>[
                Divider(height: 5.5,),
                  ListTile(
                    title: Text(
                    "${_dados[posicao]['email']}"
                    ),
                    subtitle: Text(
                      "${_dados[posicao]['body']}"
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo,
                      child: Text("${_dados[posicao]['email'][0]}"),
                    ),
                    onTap: ()=> _mostraMensage(context, _dados[posicao]['body']),
                )
              ],
            );
          },
        )
      ),
    )
  ));
} 

void _mostraMensage(BuildContext context,String mensagem){
  var alert = AlertDialog(
    title: Text('Json'),
    content: Text(mensagem),
    actions: <Widget>[
      FlatButton(onPressed: (){
        Navigator.pop(context);
      }
      , child: Text("ok"),
      )
    ],
  );
  showDialog(context:context, builder: (context)=>alert);
}

Future<List> getJson() async{
    String url = "http://jsonplaceholder.typicode.com/comments";

    http.Response response = await http.get(url);

    if(response.statusCode ==200){//200 == ok
      return json.decode(response.body);
    }
    else{
      throw Exception('Falho');
    }
}

Future<List> jsonComplexo() async{
    String url = 'http://jsonplaceholder.typicode.com/users'; 
    http.Response response = await http.get(url);

    if(response.statusCode ==200){//200 == ok
      return json.decode(response.body);
    }
    else{
      throw Exception('Falho');
    }
}