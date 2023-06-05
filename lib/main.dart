import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
    create: (_) => Pessoa('Carlos', 30),
    child: MyApp(),
    ),
  );
}

class Pessoa with ChangeNotifier {
  String nome = "João";
  int idade = 30;

  Pessoa(this.nome, this.idade);

  void incrementIdade(){
   idade++;
   notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String name = (context).select((Pessoa p) => p.nome);
    int age = (context).select((Pessoa p) => p.idade);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Estudo Provider'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            '${name} tem ${age} anos',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Provider.of<Pessoa>(context, listen: false).incrementIdade()
        ),
      )
    );
  }
}
