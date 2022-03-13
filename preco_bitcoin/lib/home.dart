import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _valor = "";

  Future<Map> _buscarPreco() async {
    http.Response response =
        await http.get(Uri.parse("https://blockchain.info/ticker"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/bitcoin.png"),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 30),
                child: FutureBuilder<Map>(
                  future: _buscarPreco(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.active:
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return const Text(
                            "Carregando...",
                            style: TextStyle(fontSize: 35),
                          );
                        } else {
                          double v = snapshot.data!["BRL"]["buy"];
                          return Text(
                            "R\$ ${v.toString()}",
                            style: const TextStyle(fontSize: 35),
                          );
                        }
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return const Text(
                          "Carregando...",
                          style: TextStyle(fontSize: 35),
                        );
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: _buscarPreco,
                child: const Text(
                  "Atualizar",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.fromLTRB(30, 15, 30, 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
