import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map> pegaClima(String appId, String cidade) async {
  String apiUrl = 'http://api.openweathermap.org/data/2.5/weather?q=$cidade&appid='
      '${appId}&units=metric';
  http.Response response = await http.get(apiUrl);

  if (response.statusCode == 200) {
     //Tudo saiu bem... vamos em frente!
      return json.decode(response.body);
  }else {
     throw Exception("Falhou!");
  }

}