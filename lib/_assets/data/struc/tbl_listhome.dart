// To parse this JSON data, do
//
//     final tableListHome = tableListHomeFromJson(jsonString);

import 'dart:convert';

TableListHome tableListHomeFromJson(String str) =>
    TableListHome.fromJson(json.decode(str));

String tableListHomeToJson(TableListHome data) => json.encode(data.toJson());

class TableListHome {
  TableListHome({
    required this.id,
    required this.urut,
    required this.judul,
    required this.icon,
  });

  int id;
  int urut;
  String judul;
  String icon;

  factory TableListHome.fromJson(Map<String, dynamic> json) => TableListHome(
        id: json["id"],
        urut: json["urut"],
        judul: json["judul"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "urut": urut,
        "judul": judul,
        "icon": icon,
      };

  static List<TableListHome> fromJsonList(List list) {
    if (list == null) return List<TableListHome>.empty();
    return list.map((item) => TableListHome.fromJson(item)).toList();
  }
}
