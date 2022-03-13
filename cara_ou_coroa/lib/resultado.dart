import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  String valor;

  Resultado({
    Key? key,
    required this.valor,
  }) : super(key: key);

  @override
  _ResultadoState createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  String resultado() {
    if (widget.valor == "cara") {
      return "images/moeda_cara.png";
    } else {
      return "images/moeda_coroa.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff61bd86),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(resultado()),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("images/botao_voltar.png"),
          )
        ],
      ),
    );
  }
}
