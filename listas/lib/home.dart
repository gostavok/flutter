import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List _itens = [];

  void _carregarItens() {
    for (int i = 0; i <= 10; i++) {
      Map<String, dynamic> item = {};
      item["titulo"] = "Título $i Lorem ipsum dolor sit amet";
      item["descricao"] = "Descrição $i Lorem ipsum dolor sit amet";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Listas"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_itens[index]['titulo']),
              subtitle: Text(_itens[index]['descricao']),
            );
          },
        ),
      ),
    );
  }
}
