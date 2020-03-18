import 'package:flutter/material.dart';
import 'package:afazeres/ui/afazeres_tela.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Afazeres'),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: AfazeresTela(),
    );
  }
}
