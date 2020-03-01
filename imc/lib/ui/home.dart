import 'package:flutter/material.dart';
import 'package:imc/ui/animation/FadeAnimation.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _idadeControl = new TextEditingController();
  final TextEditingController _alturaControl = new TextEditingController();
  final TextEditingController _pesoControl = new TextEditingController();
  double resultado = 0.0;
  String _resultadoFinal = "";

  void _calcularIMC(){
    setState(() {
      int idade = int.parse(_idadeControl.text);
      double altura = double.parse(_alturaControl.text);
      double peso = double.parse(_pesoControl.text);

      if((_idadeControl.text.isNotEmpty) ||idade>0 && 
      (_alturaControl.text.isNotEmpty)&&
      (_pesoControl.text.isNotEmpty)|| peso > 0){
        resultado = peso/(altura*altura);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMC"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 204, 41, 68),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            SizedBox(height: 10),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
	                image: DecorationImage(
	                  image: AssetImage("assets/imc-calculator.png",),
	                  
	                )
              ),
              child: Stack(
                children: <Widget>[
                      Positioned(
	                    child: Container(
	                      margin: EdgeInsets.only(bottom: 75),
	                      child: Center(
	                        child: Text("Normal", style: TextStyle(color: Colors.black, 
                          fontSize: 20, fontWeight: FontWeight.bold),),
	                      ),
	                    ),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FadeAnimation(
                  2,
                  Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10),
                        TextField(
                          autofocus: true,
                          keyboardType: TextInputType.number,
                          controller: _idadeControl,
                          cursorColor: Color.fromARGB(200, 204, 41, 68),
                          style: TextStyle(
                              color: Color.fromARGB(200, 204, 41, 68)),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 230, 172, 182),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(200, 204, 41, 68),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: "Idade",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(200, 204, 41, 68)),
                            hintText: '42',
                            hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                            icon: Icon(
                              Icons.person_outline,
                              color: Color.fromARGB(200, 204, 41, 68),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          autofocus: true,
                          controller: _alturaControl,
                          keyboardType: TextInputType.number,
                          cursorColor: Color.fromARGB(200, 204, 41, 68),
                          style: TextStyle(
                              color: Color.fromARGB(200, 204, 41, 68)),
                          decoration: InputDecoration(
                            helperStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 230, 172, 182),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(200, 204, 41, 68),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: "Altura (m)",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(200, 204, 41, 68)),
                            hintText: '1.70',
                            hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                            icon: Icon(Icons.insert_chart,
                                color: Color.fromARGB(200, 204, 41, 68)),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _pesoControl,
                          autofocus: true,
                          keyboardType: TextInputType.number,
                          cursorColor: Color.fromARGB(200, 204, 41, 68),
                          style: TextStyle(
                              color: Color.fromARGB(200, 204, 41, 68)),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 230, 172, 182),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(200, 204, 41, 68),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: "Peso (kg)",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(200, 204, 41, 68)),
                            hintText: '89.5',
                            hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                            icon: Icon(
                              Icons.fastfood,
                              color: Color.fromARGB(200, 204, 41, 68),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: RaisedButton(
                            onPressed: () => null,
                            color: Color.fromARGB(200, 204, 41, 68),
                            child: Text('Calcular'),
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            //COLUM ERA
          ],
        ),
      ),
    );
  }
}
