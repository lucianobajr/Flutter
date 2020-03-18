import 'package:fireb_intro/modelo/comunidade.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'color.dart';
import 'package:firebase_database/firebase_database.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comudidade',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(Palette.primary),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference databaseReference;
  List<Comunidade> _mensagensComunidade = List();
  Comunidade comunidade;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    comunidade = new Comunidade("", "");
    databaseReference = database.reference().child('comunidade');
    databaseReference.onChildAdded.listen(_lidarComMensagem);
    databaseReference.onChildChanged.listen(_lidarComMudanca);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              flex: 0,
              child: Center(
                child: Form(
                  key: formKey,
                  child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.subject),
                        title: TextFormField(
                          initialValue: "",
                          onSaved: (val) => comunidade.assunto = val,
                          validator: (val) => val == "" ? val : null,
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.message),
                        title: TextFormField(
                          initialValue: "",
                          onSaved: (val) => comunidade.mensagem = val,
                          validator: (val) => val == "" ? val : null,
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          _lidarComSubmit();
                        },
                        child: Text(
                          'Postar',
                        ),
                        color: generateMaterialColor(Palette.primary),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              child: FirebaseAnimatedList(
                  query: databaseReference,
                  itemBuilder: (_, DataSnapshot snapshot,
                      Animation<double> animation, int posicao) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                             backgroundColor: generateMaterialColor(Palette.primary), 
                            ), 
                            title: Text(
                              _mensagensComunidade[posicao].assunto
                            ),
                            subtitle:  Text(_mensagensComunidade[posicao].mensagem), 
                          ),
                        );
                      }),
            ),
          ],
        ));
  }

  void _lidarComMensagem(Event event) {
    setState(() {
      _mensagensComunidade.add(Comunidade.fromSnapshot(event.snapshot));
    });
  }

  void _lidarComSubmit() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      form.reset();

      databaseReference.push().set(comunidade.toJson());
    }
  }

  void _lidarComMudanca(Event event) {
    var mensagemVelha = _mensagensComunidade.singleWhere((entrada) {
      return entrada.key == event.snapshot.key;
    });

    setState(() {
      _mensagensComunidade[_mensagensComunidade.indexOf(mensagemVelha)] =
          Comunidade.fromSnapshot(event.snapshot);
    });
  }
}

final ThemeData theme = ThemeData(
  primarySwatch: generateMaterialColor(Palette.primary),
);

class Palette {
  static const Color primary = Color(0xff918EF4);
}
