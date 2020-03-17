import 'package:flutter/material.dart';
import 'modelos/Usuario.dart';
import 'ui/ajudante_bd.dart';

List _todosUsuarios;
void main() async {
  var db = new BDadosAjudante();
  //await db.inserirUsuario(new Usuario("Angela", "leandrollll"));

   //Todos usuarios
  _todosUsuarios = await db.pegarUsuarios();
  for (int i = 0; i < _todosUsuarios.length; i++) {
      Usuario usuario = Usuario.map(_todosUsuarios[i]);
      debugPrint("Usuario: ${usuario.nome}, Id: ${usuario.id}");

  }

  runApp(new Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('B-Dados'),
          backgroundColor: Colors.black38,
        ),
        body: ListView.builder(
            itemCount: _todosUsuarios.length,
            itemBuilder: (_, int posicao) {
                return Card(
                     color: Colors.white,
                    elevation: 2.0,
                     child: ListTile(
                         leading: CircleAvatar(
                              child: Text("${Usuario.fromMap(_todosUsuarios[posicao]).nome.substring(0,1)}"),
                         ),
                         title: Text("Usuario: ${Usuario.fromMap(_todosUsuarios[posicao]).nome}"),
                       subtitle: Text("Id: ${Usuario.fromMap(_todosUsuarios[posicao]).id}"),

                       onTap: () => debugPrint("Senha: ${Usuario.fromMap(_todosUsuarios[posicao]).senha}"),
                     ),
                );


            }),
      ),
    );
  }
}
