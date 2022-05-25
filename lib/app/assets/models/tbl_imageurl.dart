// To parse this JSON data, do
//
//     final tableImageUrl = tableImageUrlFromJson(jsonString);

import 'dart:convert';

TableImageUrl tableImageUrlFromJson(String str) =>
    TableImageUrl.fromJson(json.decode(str));

String tableImageUrlToJson(TableImageUrl data) => json.encode(data.toJson());

class TableImageUrl {
  TableImageUrl({
    required this.id,
    required this.idAsset,
    required this.imageUrl,
  });

  int id;
  String idAsset;
  String imageUrl;

  factory TableImageUrl.fromJson(Map<String, dynamic> json) => TableImageUrl(
        id: json["id"],
        idAsset: json["id_asset"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_asset": idAsset,
        "imageUrl": imageUrl,
      };
  static List<TableImageUrl> fromJsonList(List list) {
    if (list == null) return List<TableImageUrl>.empty();
    return list.map((item) => TableImageUrl.fromJson(item)).toList();
  }
}
