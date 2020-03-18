import 'package:flutter/material.dart';
import 'ui/home.dart';

void main() {
  runApp(Afazeres());
}

class Afazeres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Afazeres',
      home: Home(),
    );
  }
}
