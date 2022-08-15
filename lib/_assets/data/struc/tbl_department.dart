// To parse this JSON data, do
//
//     final tdept = tdeptFromJson(jsonString);

import 'dart:convert';

Tdept tdeptFromJson(String str) => Tdept.fromJson(json.decode(str));

String tdeptToJson(Tdept data) => json.encode(data.toJson());

class Tdept {
  Tdept({
    required this.id,
    required this.kode,
    required this.nama,
    required this.kadept,
    required this.kadiv,
  });

  int id;
  String kode;
  String nama;
  String kadept;
  String kadiv;

  factory Tdept.fromJson(Map<String, dynamic> json) => Tdept(
        id: json["id"],
        kode: json["kode"],
        nama: json["nama"],
        kadept: json["kadept"],
        kadiv: json["kadiv"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode": kode,
        "nama": nama,
        "kadept": kadept,
        "kadiv": kadiv,
      };
  static List<Tdept> fromJsonList(List list) {
    if (list == null) return List<Tdept>.empty();
    return list.map((item) => Tdept.fromJson(item)).toList();
  }
}
