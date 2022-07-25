import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../_assets/constant.dart';
import '../../../../_assets/data/struc/tbl_masteritem.dart';

class EditItemController extends GetxController {
  RxBool isLoading = false.obs;
  RxString userName = "".obs;
  RxString isiBarcode = "".obs;
  RxString imageUrl = "".obs;
  RxString filepath = "".obs;
  RxString imageUrlStr = "".obs;
  RxString sourceImg = "".obs;
  RxList listImg = [].obs;
  RxBool isSimpan = false.obs;
  RxString idAssetT = "".obs;
  RxString nameT = "".obs;
  RxString descriptionT = "".obs;
  RxString picT = "".obs;
  RxString dateT = "".obs;
  RxString imageUrlT = "".obs;
  RxList getAllData = List.empty().obs;

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  String itemEdit = Get.arguments;

  TextEditingController idAssetC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();
  TextEditingController picC = TextEditingController();
  TextEditingController dateC = TextEditingController();

  late Uint8List filebytes;
  late File xfile;
  File? ambilGambar;
  late File imageFile;

  Future getData() async {
    getAllData.clear(); //menghapus data list
    isLoading.value = true;

    SupabaseClient client = Supabase.instance.client;
    try {
      PostgrestResponse<dynamic> response = await client
          .from('tbl_masteritem')
          .select()
          .match({"id_asset": itemEdit}).execute();

      final data = response.data;
      final error = response.status;

      List<TblMasterItem> dataItem =
          TblMasterItem.fromJsonList(response.data as List);

      getAllData.value = List.from(dataItem);

      getAllData.refresh();

      for (var element in getAllData.value) {
        idAssetC.text = element.idAsset;
        nameC.text = element.nameAsset;
        descriptionC.text = element.descAsset;
        picC.text = element.imageUrl;
        imageUrl.value = BaseUrl.cPathImgUrl + picC.text;
        dateC.text = element.tglBeli;
      }
    } catch (err) {
      print(err);
    }
  }

  ///=================CEK VALIDASI==============
  String? validateidAsset(String value) {
    if (value.length <= 6 || value.isEmpty) {
      return "ID Asset Wajib Diisi";
    }
    return null;
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Nama Asset Wajib Diisi";
    }
    return null;
  }

  String? validateDescription(String value) {
    if (value.isEmpty) {
      return "Deskripsi Wajib Diisi";
    }
    return null;
  }

  String? validatepic(String value) {
    if (value.isEmpty) {
      return "PIC Wajib Diisi";
    }
    return null;
  }

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    getData();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    idAssetC.dispose();
    nameC.dispose();
    descriptionC.dispose();
    picC.dispose();
    dateC.dispose();
    super.onClose();
  }
}
