import 'package:flutter/material.dart';
import 'expandable_view.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


Map _dados;
List _features;

void main() async {
  _dados = await pegaTerremotos();
  _features = _dados['features'];
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Terremoto(),
    );
  }
}

class Terremoto extends StatelessWidget {
  ExpandableView expandableView = new ExpandableView();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(255, 74, 51, 65),
        title: Text('Terremoto'),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.expand_more),
              onPressed: () {
                expandableView.expandedView.tappedEvent();
              })
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand, 
        children: <Widget>[
        Column(
          children: <Widget>[expandableView],
        ),
        ListView.builder(
          itemCount: _features.length,
          padding: const EdgeInsets.all(15.5),
          itemBuilder: (BuildContext context, int posicao) {
            initializeDateFormatting('pt_BR', null);
            var format = new DateFormat.yMMMd("pt_BR").add_jm();
            var data = format.format(
              new DateTime.fromMicrosecondsSinceEpoch(_features[posicao]['properties']['time'] * 1000)); 
            return Column(
              children: <Widget>[
                Divider(height: 5.5,),
                ListTile(
                  title: Text("$data",
                    style:TextStyle(
                      fontSize: 15.5,
                      color: Color.fromARGB(255, 109, 77, 110),
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  subtitle:
                      Text("${_features[posicao]['properties']['place']}",
                      style:TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 126, 105, 145),
                    child: Text(
                      "${_features[posicao]['properties']['mag']}",
                      style: TextStyle(
                        color:Colors.white,
                        fontStyle: FontStyle.normal,
                        fontSize: 16.5,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                  ),
                  onTap: (){
                    mostrarMensagem(context,"${_features[posicao]['properties']['title']}");
                                      },
                                    )
                                  ],
                                );
                              },
                            )
                          ]),
                        );
                      }
                    
                      void mostrarMensagem(BuildContext context, String mensagem) {
                        var alert = new AlertDialog(
                          title: Text("Terremotos"),
                          content: Text(mensagem),
                          actions: <Widget>[
                            FlatButton(onPressed: () => Navigator.pop(context) ,
                              child: Text('Ok')),
                          ],
                        );
                        showDialog(context: context, builder:(_){
                          return alert;
                        }
                        );
                      }
}

Future<Map> pegaTerremotos() async {
  String url =
      'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson';
  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    //200 == ok
    return json.decode(response.body);
  } else {
    throw Exception('Falho');
  }
}