import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoletoListController {
  final boletosNotifier = ValueNotifier<List<BoletoModel>>(<BoletoModel>[]);

  List<BoletoModel> get boletos => boletosNotifier.value;
  set boletos(List<BoletoModel> value) => boletosNotifier.value = value;

  BoletoListController() {
    getBoletos();
  }

  Future<void> getBoletos() async {
    final instance = await SharedPreferences.getInstance();
    final response = instance.getStringList("boletos") ?? <String>[];
    List<BoletoModel> boletosModel =
        response.map((e) => BoletoModel.fromJson(e)).toList();

    boletos = ordenarDatas(boletosModel);
  }

  List<BoletoModel> ordenarDatas(List<BoletoModel> boletosModel) {
    boletosModel.sort((a1, a2) {
      var dataFormat1 = new DateFormat('dd/MM/yyyy').parse(a1.dueDate!);
      var format1 = new DateFormat('yyyy-MM-dd').format(dataFormat1);

      var dataFormat2 = new DateFormat('dd/MM/yyyy').parse(a2.dueDate!);
      var format2 = new DateFormat('yyyy-MM-dd').format(dataFormat2);

      if (DateTime.parse(format1).isBefore(DateTime.parse(format2))) {
        return -1;
      }
      return 1;
    });
    return boletosModel;
  }
}
