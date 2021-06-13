// To parse this JSON data, do
//
//     final movimentacoes = movimentacoesFromJson(jsonString);

import 'dart:convert';
import 'package:get/get.dart';

Movimentacoes movimentacoesFromJson(String str) =>
    Movimentacoes.fromJson(json.decode(str));

String movimentacoesToJson(Movimentacoes data) => json.encode(data.toJson());

class Movimentacoes {
  Movimentacoes({
    this.movimentacoes,
  });

  List<Movimentacoe>? movimentacoes;

  factory Movimentacoes.fromJson(Map<String, dynamic> json) => Movimentacoes(
        movimentacoes: List<Movimentacoe>.from(
            json["movimentacoes"].map((x) => Movimentacoe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "movimentacoes":
            List<dynamic>.from(movimentacoes!.map((x) => x.toJson())),
      };
}

class Movimentacoe {
  Movimentacoe({
    this.tipo,
    this.data,
    this.valor,
  });

  String? tipo;
  DateTime? data;
  double? valor;

  factory Movimentacoe.fromJson(Map<String, dynamic> json) => Movimentacoe(
        tipo: json["tipo"],
        data: DateTime.parse(json["data"]),
        valor: json["valor"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "tipo": tipo,
        "data":
            "${data?.year.toString().padLeft(4, '0')}-${data?.month.toString().padLeft(2, '0')}-${data?.day.toString().padLeft(2, '0')}",
        "valor": valor,
      };
}
