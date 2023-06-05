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

  void incrementIdade() {
    idade++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      //Utilizamos Consumer para simplificar na hora de chamar os valores da classe que está notificando
      //No builder do Consumer passamos o contexto, a variavel que vai armazenar os dados e o child
        home: Consumer<Pessoa>(
      builder: (context, pessoa, child) => Scaffold(
        appBar: AppBar(
          title: Text('Estudo Provider'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            '${pessoa.nome} tem ${pessoa.idade} anos',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () =>
                pessoa.incrementIdade()),
      ),
    ));
  }
}
