// To parse required this JSON data, do
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
    required this.userCreated,
    required this.createdAt,
    required this.tglBeli,
    required this.imageUrl,
    required this.merk,
    required this.type,
    required this.serialNumber,
    required this.purcRequest,
    required this.purcOrder,
    required this.price,
    required this.department,
    required this.sloc,
    required this.condition,
    required this.reason,
  });

  int id;
  String idAsset;
  String nameAsset;
  String descAsset;
  String userCreated;
  String createdAt;
  String tglBeli;
  String imageUrl;
  String merk;
  String type;
  String serialNumber;
  String purcRequest;
  String purcOrder;
  double price;
  String department;
  String sloc;
  bool condition;
  String reason;

  factory TblMasterItem.fromJson(Map<String, dynamic> json) => TblMasterItem(
        id: json["id"],
        idAsset: json["id_asset"],
        nameAsset: json["name_asset"],
        descAsset: json["desc_asset"],
        userCreated: json["user_created"],
        createdAt: json["created_at"],
        tglBeli: json["tgl_beli"],
        imageUrl: json["imageUrl"],
        merk: json["merk"],
        type: json["type"],
        serialNumber: json["serial_number"],
        purcRequest: json["purc_request"],
        purcOrder: json["purc_order"],
        price: json["price"].toDouble(),
        department: json["department"],
        sloc: json["sloc"],
        condition: json["condition"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_asset": idAsset,
        "name_asset": nameAsset,
        "desc_asset": descAsset,
        "user_created": userCreated,
        "created_at": createdAt,
        "tgl_beli": tglBeli,
        "imageUrl": imageUrl,
        "merk": merk,
        "type": type,
        "serial_number": serialNumber,
        "purc_request": purcRequest,
        "purc_order": purcOrder,
        "price": price,
        "department": department,
        "sloc": sloc,
        "condition": condition,
        "reason": reason,
      };
  static List<TblMasterItem> fromJsonList(List list) {
    if (list == null) return List<TblMasterItem>.empty();
    return list.map((item) => TblMasterItem.fromJson(item)).toList();
  }
}
