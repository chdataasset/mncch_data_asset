import 'dart:io';
import 'dart:typed_data';

import '../../../../_assets/data/struc/tbl_masteritem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DetailitemController extends GetxController {
  RxString scannedQrCode = "".obs;

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
  RxString idAssetT = "".obs;
  RxString nameT = "".obs;
  RxString descriptionT = "".obs;
  RxString picT = "".obs;
  RxString dateT = "".obs;
  RxString imageUrlT = "".obs;

  // TextEditingController idAssetC = TextEditingController();
  // TextEditingController nameC = TextEditingController();
  // TextEditingController descriptionC = TextEditingController();
  // TextEditingController picC = TextEditingController();
  // TextEditingController dateC = TextEditingController();

  TblMasterItem itemBody = Get.arguments;
  // id.text = itemBody.idAsset;
  // descC.text = note.desc;

  loadData() {
    idAssetT.value = itemBody.idAsset;
    nameT.value = itemBody.nameAsset;
    descriptionT.value = itemBody.descAsset;
    picT.value = itemBody.picAsset;
    dateT.value = itemBody.tglBeli;
    imageUrlT.value = itemBody.imageUrl;
  }

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  SupabaseClient client = Supabase.instance.client;
  late Uint8List filebytes;
  late File xfile;
  File? ambilGambar;
  late File imageFile;

  Future<void> scanBarcode() async {
    try {
      scannedQrCode.value = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.QR,
      );

      if (scannedQrCode.value != "-1") {
        isiBarcode.value = scannedQrCode.value;
        print(isiBarcode.value);

        cariData(isiBarcode.value);
      } else {
        // Get.back();
        print("Tidak ada");
      }
    } on PlatformException {}
  }
  // String? validateidAsset(String value) {
  //   if (value.length <= 6 || value.isEmpty) {
  //     return "ID Asset Wajib Diisi";
  //   }
  //   return null;
  // }

  Future<dynamic> cariData(String nilai) async {
    try {
      PostgrestResponse<dynamic> result = await client
          .from('tbl_masteritem')
          .select('')
          .match({'id_asset': nilai}).execute();

      final data = result.data;
      print(result.data);
      final error = result.error;
      List<TblMasterItem> dataNote =
          TblMasterItem.fromJsonList(result.data as List);

      allGetData.value = List<TblMasterItem>.from(dataNote);

      allGetData.refresh();

      for (var item in dataNote) {
        idAssetT.value = item.idAsset;
        nameT.value = item.nameAsset;
        descriptionT.value = item.descAsset;
        picT.value = item.picAsset;
        dateT.value = item.tglBeli;
        imageUrlT.value = item.imageUrl;
      }
      
    } catch (err) {
      print(err);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    loadData();
  }
}
