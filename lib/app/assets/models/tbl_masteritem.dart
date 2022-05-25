// To parse this JSON data, do
//
//     final tabelMasterItem = tabelMasterItemFromJson(jsonString);

import 'dart:convert';

TabelMasterItem tabelMasterItemFromJson(String str) =>
    TabelMasterItem.fromJson(json.decode(str));

String tabelMasterItemToJson(TabelMasterItem data) =>
    json.encode(data.toJson());

class TabelMasterItem {
  TabelMasterItem({
    required this.id,
    required this.idAsset,
    required this.nameAsset,
    required this.descAsset,
    required this.picAsset,
    required this.tglBeli,
    required this.userCreated,
    required this.createdAt,
  });

  int id;
  String idAsset;
  String nameAsset;
  String descAsset;
  String picAsset;
  String tglBeli;
  String userCreated;
  String createdAt;

  factory TabelMasterItem.fromJson(Map<String, dynamic> json) =>
      TabelMasterItem(
        id: json["id"],
        idAsset: json["id_asset"],
        nameAsset: json["name_asset"],
        descAsset: json["desc_asset"],
        picAsset: json["pic_asset"],
        tglBeli: json["tgl_beli"],
        userCreated: json["user_created"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_asset": idAsset,
        "name_asset": nameAsset,
        "desc_asset": descAsset,
        "pic_asset": picAsset,
        "tgl_beli": tglBeli,
        "user_created": userCreated,
        "created_at": createdAt,
      };
  static List<TabelMasterItem> fromJsonList(List list) {
    if (list == null) return List<TabelMasterItem>.empty();
    return list.map((item) => TabelMasterItem.fromJson(item)).toList();
  }
}
