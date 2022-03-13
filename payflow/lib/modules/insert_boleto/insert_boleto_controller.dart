import 'package:flutter/cupertino.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();

  String? validateName(String? value) {
    if (value?.isEmpty ?? true) {
      return "O nome do boleto não pode ser vazio!";
    }
    return null;
  }
  // value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;

  String? validateVencimento(String? value) => value?.isEmpty ?? true
      ? "A data de vencimento não pode ser vazia!"
      : null;

  String? validadeValor(double? value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00!" : null;

  String? validateCodigo(String? value) {
    if (value?.isEmpty ?? true) {
      return "O código do boleto não pode ser vazio!";
    }
    return null;
    // value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;
  }

  void onChange({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    model = model.copyWith(
      name: name,
      dueDate: dueDate,
      value: value,
      barcode: barcode,
    );
  }

  Future<void> saveBoleto() async {
    final instance = await SharedPreferences.getInstance();
    final boletos = instance.getStringList("boletos") ?? <String>[];
    boletos.add(model.toJson());
    await instance.setStringList("boletos", boletos);
    return;
  }

  Future<bool> cadastrarBoleto() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      await saveBoleto();
      return true;
    }
    return false;
  }
}
