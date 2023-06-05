import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Provider(
    create: (_) => Pessoa('Carlos', 30),
    child: MyApp(),
    ),
  );
}

class Pessoa {
  String nome = "João";
  int idade = 30;

  Pessoa(this.nome, this.idade);

  void incrementIdade(){
   idade++;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var name = (context).select((Pessoa p) => p.nome);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Estudo Provider'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            '${name} tem 30 anos',
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
