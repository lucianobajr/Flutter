import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

void main() {
  runApp(new MaterialApp(
    title: 'I/O',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _campoDadosControl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ler/Gravar"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(13.4),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _campoDadosControl,
              decoration: InputDecoration(labelText: "Escreva algo"),
            ),
            Padding(padding: const EdgeInsets.all(14.9),),
            FlatButton(
                color: Colors.greenAccent,
                onPressed: () {
                  gravarDados(_campoDadosControl.text);
                },
                child: Text('Gravar')),
            FutureBuilder(
                future: lerDados(),
                builder: (BuildContext context, AsyncSnapshot<String> dados) {
                  if (dados.hasData != null) {
                    return Text(
                      dados.data,
                      style: TextStyle(color: Colors.greenAccent),
                    );
                  } else {
                    return Text("Nada foi salvo!");
                  }
                })
          ],
        ),
      ),
    );
  }
}

Future<String> get _caminhoLocal async {
  final diretorio = await getApplicationDocumentsDirectory();
  return diretorio.path; //home/directory/...
}

Future<File> get _arquivoLocal async {
  final caminho = await _caminhoLocal;

  return new File('$caminho/dados.txt'); //home/directory/dados.txt
}

//Gravar
Future<File> gravarDados(String mensagem) async {
  final arquivo = await _arquivoLocal;

  return arquivo.writeAsString('$mensagem');
}

//Ler
Future<String> lerDados() async {
  try {
    final arquivo = await _arquivoLocal;
    //ler
    return await arquivo.readAsString();
  } catch (e) {
    return "Ainda não foi salvo nada";
  }
}
