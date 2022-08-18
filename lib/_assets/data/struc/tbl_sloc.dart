// To parse this JSON data, do
//
//     final tsloc = tslocFromJson(jsonString);

import 'dart:convert';

import 'package:get/get_connect/http/src/utils/utils.dart';

Tsloc tslocFromJson(String str) => Tsloc.fromJson(json.decode(str));

String tslocToJson(Tsloc data) => json.encode(data.toJson());

class Tsloc {
  Tsloc({
    required this.id,
    required this.kode,
    required this.lokasi,
  });

  int id;
  String kode;
  String lokasi;

  factory Tsloc.fromJson(Map<String, dynamic> json) => Tsloc(
        id: json["id"],
        kode: json["kode"],
        lokasi: json["lokasi"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode": kode,
        "lokasi": lokasi,
      };
  static List<Tsloc> fromJsonList(List list) {
    if (list == null) return List<Tsloc>.empty();
    return list.map((item) => Tsloc.fromJson(item)).toList();
  }
}
