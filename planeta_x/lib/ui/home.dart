import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:planeta_x/constant/_constant.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int radioValor = 1;
  String _nomePlaneta = "";
  

  bool selecaoValA = true;
  bool selecaoValB = false;
  bool selecaoValC;
  bool switchValor = false;

  double _resultadoFinal = 0.0;

  final TextEditingController _controlePeso = new TextEditingController();

  void recebeVal(int value) {
    setState(() {
      radioValor = value;
      switch(radioValor){
        case 0:
          _resultadoFinal= calPeso(_controlePeso.text, 0.38);
          _nomePlaneta = "O seu peso em  Mercúrio é ${_resultadoFinal.toStringAsFixed(2)}";
          debugPrint(_nomePlaneta);
          break;
        case 1:
          _resultadoFinal= calPeso(_controlePeso.text, 0.91);
          _nomePlaneta = "O seu peso em Vênus é ${_resultadoFinal.toStringAsFixed(2)}";
          debugPrint(_nomePlaneta);
          break;
        case 2:          
          _resultadoFinal= calPeso(_controlePeso.text, 1.6);
          _nomePlaneta = "O seu peso na Lua é ${_resultadoFinal.toStringAsFixed(2)}";
          debugPrint(_nomePlaneta);
          break;  
        default:
          debugPrint("Tem nada viu...");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Planeta X"),
          centerTitle: true,
          backgroundColor: Color(0xff18222c),
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color(0xff18222c),
                    const Color(0xff1f2e3d),
                    const Color(0xFF3E5A76)
                  ],
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter,
                  stops: [0.7, 1.0, 1.5],
                  tileMode: TileMode.clamp),
            ),
            child: Column(children: <Widget>[
              TextField(
                controller: _controlePeso,//recebe peso
                cursorColor: Colors.white,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    helperStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: 'O seu peso na Terra',
                    hintText: 'Kg',
                    hintStyle: TextStyle(color: Colors.white),
                    icon: Icon(
                      Icons.person_outline,
                      color: Color(0xff090f14),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio<int>(
                      activeColor: Color.fromARGB(255, 163, 167, 170),
                      value: 0,
                      groupValue: radioValor,
                      onChanged: recebeVal),
                  Text(
                    "Mercúrio",
                    style: TextStyle(color: Colors.white),
                  ),
                  Radio<int>(
                      activeColor: Color.fromARGB(255, 232, 126, 4),
                      value: 1,
                      groupValue: radioValor,
                      onChanged: recebeVal),
                  Text(
                    "Vênus",
                    style: TextStyle(color: Colors.white),
                  ),
                  Radio<int>(
                      activeColor: Colors.white,
                      value: 2,
                      groupValue: radioValor,
                      onChanged: recebeVal),
                  Text(
                    "Lua",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Text(
                _controlePeso.text.isEmpty ? "Encira o seu peso":_nomePlaneta +"Kg",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.4,
                  fontWeight: FontWeight.w700
                ),
              ),
              Expanded(//ANIMAÇÃO DOS PLANETAS
                  child: FlareActor(
                "assets/images/solar.flr",
                animation: "solar_run",
                alignment: Alignment.bottomCenter,
              )),
            ])));
  }

  double calPeso(String peso,double gravidadeSuperificial){
    if(int.parse(peso).toString().isNotEmpty  && int.parse(peso) > 0){
      return (int.parse(peso)*gravidadeSuperificial);   
    }else{
      print("Número errado...");
    }
  }
}
