import 'dart:io';
import 'dart:typed_data';

import 'package:ch_data_asset/models/tbl_masteritem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DetailitemController extends GetxController {
  RxString userName = "".obs;
  RxString isiBarcode = "".obs;
  RxString imageUrl = "".obs;
  RxBool isLoading = false.obs;
  RxString filepath = "".obs;
  RxString imageUrlStr = "".obs;
  RxString sourceImg = "".obs;
  RxList listImg = [].obs;
  RxBool isEdit = false.obs;
  RxString scanResult = "".obs;
  RxList allGetData = List.empty().obs;

  TextEditingController idAssetC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();
  TextEditingController picC = TextEditingController();
  TextEditingController dateC = TextEditingController();

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  SupabaseClient client = Supabase.instance.client;
  late Uint8List filebytes;
  late File xfile;
  File? ambilGambar;
  late File imageFile;

  String? validateidAsset(String value) {
    if (value.length <= 6 || value.isEmpty) {
      return "ID Asset Wajib Diisi";
    }
    return null;
  }

  Future<dynamic> scanBarcode() async {
    isEdit.value = false;
    try {
      scanResult.value = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.QR,
      );
      if (scanResult.value == "-1") {
        idAssetC.text = "";
      } else {
        idAssetC.text = scanResult.value;
        isiBarcode.value = scanResult.value;
        cariData(scanResult.value.toString());
      }
    } on PlatformException catch (error) {
      print(error);
    }
    // if (!mounted) return;
  }

  Future<dynamic> cariData(String nilai) async {
    try {
      PostgrestResponse<dynamic> result = await client
          .from('tbl_masteritem')
          .select('')
          .match({'id_asset': nilai}).execute();

      final data = result.data;
      final error = result.error;
      List<TblMasterItem> dataNote =
          TblMasterItem.fromJsonList(result.data as List);

      allGetData.value = List<TblMasterItem>.from(dataNote);

      allGetData.refresh();

      for (var item in dataNote) {
        nameC.text = item.nameAsset;
        descriptionC.text = item.descAsset;
        picC.text = item.picAsset;
        DateTime tanggal = DateTime.parse(item.tglBeli);
        dateC.text = DateFormat('dd-MMM-yyyy').format(tanggal);
      }
    } catch (err) {
      print("err");
    }
  }
}
