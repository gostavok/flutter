import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: AlcoolGasolina(),
  ));
}

class AlcoolGasolina extends StatefulWidget {
  const AlcoolGasolina({Key? key}) : super(key: key);

  @override
  _AlcoolGasolinaState createState() => _AlcoolGasolinaState();
}

class _AlcoolGasolinaState extends State<AlcoolGasolina> {
  final TextEditingController _alcool = TextEditingController();
  final TextEditingController _gasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? alcool = double.tryParse(_alcool.text.replaceAll(",", "."));
    double? gasolina = double.tryParse(_gasolina.text.replaceAll(",", "."));

    if (alcool == null && gasolina == null) {
      setState(() {
        _textoResultado = "Valores inválidos, digite valores acima de 0.00!";
      });
    } else {
      setState(() {
        if ((alcool! / gasolina!) >= 0.7) {
          _textoResultado = "Melhor abastecer com gasolina!";
        } else {
          _textoResultado = "Melhor abastecer com álcool!";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Álcool ou Gasolina"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(
                  labelText: "Preço Alcool, ex: 1.59",
                ),
                controller: _alcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(
                  labelText: "Preço Gasolina, ex: 3.59",
                ),
                controller: _gasolina,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: _calcular,
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.all(15),
                    ),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: const Text("Calcular"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }
}
