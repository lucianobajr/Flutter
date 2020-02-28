import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _usuarioController = new TextEditingController();
  final TextEditingController _senhaController = new TextEditingController();
  String _bemvindo = "";

  void _mostraBemVindo() {
    setState(() {
      if (_usuarioController.text.isNotEmpty &&
          _senhaController.text.isNotEmpty) {
        debugPrint(_senhaController.text);

        _bemvindo = "Bem vindo ${_usuarioController.text}";
      }
      else{
        _bemvindo = "Vazio!";
      }
    });
  }

  void _cancelar() {
    setState(() {
      _usuarioController.clear();
      _senhaController.clear();
      _bemvindo = "";
    });
  }

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        backgroundColor: Color.fromARGB(255, 82, 105, 224),
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            //image
            Image.asset(
              "assets/face.png",
              width: 90.0,
              height: 90.0,
              color: Color.fromARGB(255, 233, 244, 255),
            ),

            //Cadastro/ formulario
            Container(
              width: double.infinity,
              color: Colors.white70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _usuarioController,
                      decoration: InputDecoration(
                        hintText: 'Nome',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.5)),
                        //icon: Icon(Icons.person)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _senhaController,
                      obscureText: !this._showPassword,
                      decoration: InputDecoration(
                        labelText: 'password',
                        prefixIcon: Icon(Icons.security),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color:
                                this._showPassword ? Colors.blue : Colors.grey,
                          ),
                          onPressed: () {
                            setState(
                                () => this._showPassword = !this._showPassword);
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.5)),
                      ),
                    ),
                  ),
                  //Butoes
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //Entrar
                        Container(
                          // margin: const EdgeInsets.only(left: 38.0),
                          child: RaisedButton(
                            onPressed: _mostraBemVindo,
                            color: Colors.white,
                            child: Text(
                              "Entrar",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 16.9,
                              ),
                            ),
                          ),
                        ),
                        //Cancelar
                        Container(
                          //margin: const EdgeInsets.only(right: 38.0),
                          child: RaisedButton(
                            onPressed: _cancelar,
                            color: Colors.white,
                            child: Text(
                              "Cancelar",
                              style: TextStyle(
                                  fontSize: 16.9, color: Colors.blueAccent),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            //Text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    " $_bemvindo",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19.6,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
