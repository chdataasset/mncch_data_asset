// To parse this JSON data, do
//
//     final tblMasterItem = tblMasterItemFromJson(jsonString);

import 'dart:convert';

TblMasterItem tblMasterItemFromJson(String str) =>
    TblMasterItem.fromJson(json.decode(str));

String tblMasterItemToJson(TblMasterItem data) => json.encode(data.toJson());

class TblMasterItem {
  TblMasterItem({
    required this.id,
    required this.idAsset,
    required this.nameAsset,
    required this.descAsset,
    required this.picAsset,
    required this.tglBeli,
    required this.userCreated,
    required this.createdAt,
    required this.imageUrl,
  });

  int id;
  String idAsset;
  String nameAsset;
  String descAsset;
  String picAsset;
  String tglBeli;
  String userCreated;
  String createdAt;
  String imageUrl;

  factory TblMasterItem.fromJson(Map<String, dynamic> json) => TblMasterItem(
        id: json["id"],
        idAsset: json["id_asset"],
        nameAsset: json["name_asset"],
        descAsset: json["desc_asset"],
        picAsset: json["pic_asset"],
        tglBeli: json["tgl_beli"],
        userCreated: json["user_created"],
        createdAt: json["created_at"],
        imageUrl: json["imageUrl"],
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
        "imageUrl": imageUrl,
      };

  static List<TblMasterItem> fromJsonList(List list) {
    if (list == null) return List<TblMasterItem>.empty();
    return list.map((item) => TblMasterItem.fromJson(item)).toList();
  }
}
