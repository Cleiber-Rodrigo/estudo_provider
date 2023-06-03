import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp(

  ));
}

class Pessoa {
  String nome = "João";
  int idade = 30;

  Pessoa();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Estudo Provider'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'João tem 30 anos',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      )
    );
  }
}
