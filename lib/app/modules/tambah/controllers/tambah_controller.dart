import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../models/constant.dart';
import '../../../../models/tbl_user.dart';

class TambahController extends GetxController {
  RxString userName = "".obs;
  RxString isiBarcode = "".obs;
  RxString imageUrl = "".obs;
  RxBool isLoading = false.obs;
  RxString filepath = "".obs;
  RxString imageUrlStr = "".obs;
  RxString sourceImg = "".obs;
  RxList listImg = [].obs;

  // final List<String> imgList = [
  //   // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  // ];

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

  Future<void> upload(ImageSource imageSource) async {
    isLoading.value = true;
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: (imageSource == ImageSource.camera)
          ? ImageSource.camera
          : ImageSource.gallery,
      maxWidth: 100,
      maxHeight: 100,
    );
    if (imageFile == null) {
      Get.defaultDialog(
          title: "Error",
          middleText: "No Image",
          textConfirm: "Ok",
          onConfirm: () {
            Get.back();
            Get.back();
          });
      return;
    }

    File tmpFile = File(imageFile.path);
    final bytes = await imageFile.readAsBytes();
    final fileExt = imageFile.path.split('.').last;
    final fileName = '${DateTime.now().toIso8601String()}.$fileExt';
    final filePath = fileName;
    filepath.value = filePath.toString();
    filebytes = bytes;

    isiBarcode.value = fileName.toString() + filePath.toString();

    final Directory extDir = await getApplicationDocumentsDirectory();
    String dirPath = extDir.path;
    final String extfilePath = '$dirPath/$fileName';

    final File newImage = await tmpFile.copy(extfilePath);

    imageUrlStr.value = fileName;

    if (imageFile != null) {
      tmpFile = newImage;
      print("berhasil");
    } else {
      print('No image selected.');
    }
    imageUrl.value = newImage.toString();
    isLoading.value = false;
  }

  void simpan() async {
    isLoading.value = true;

    try {
      cekUser();
      simpanGambar(filepath.value, filebytes);
    } catch (err) {
      print(err);
    }

    try {
      await client.from("tbl_masteritem").insert({
        "id_asset": idAssetC.text,
        "name_asset": nameC.text,
        "desc_asset": descriptionC.text,
        "pic_asset": picC.text,
        "tgl_beli": dateC.text,
        "user_created": userName.value,
        "created_at": DateTime.now().toIso8601String(),
        "imageUrl": imageUrlStr.value,
      }).execute();
      Get.defaultDialog(
          title: "Success",
          middleText: "Data Telah Tersimpan",
          textConfirm: "Ok",
          onConfirm: () {
            Get.back();
          });
    } catch (err) {
      print("err");
      Get.defaultDialog(
          title: "Error",
          middleText: "Error $err",
          textConfirm: "Ok",
          onConfirm: () {
            Get.back();
          });
    }
    isLoading.value = false;
  }

  void simpanGambar(path, bytes) {
    try {
      final response =
          client.storage.from('images/images').uploadBinary(path, bytes);

      StorageResponse<String> imageUrlResponse =
          client.storage.from('images/images').getPublicUrl(path);
    } catch (err) {
      print(err);
      Get.defaultDialog(
          title: "Error",
          middleText: "$err",
          textConfirm: "Ok",
          onConfirm: () {
            Get.back();
            Get.back();
          });
    }
  }

  void cekUser() async {
    try {
      PostgrestResponse<dynamic> result = await client
          .from("tbl_user")
          .select('')
          .match({"user_id": client.auth.currentUser!.id}).execute();

      List<ModelTbluser> userList =
          ModelTbluser.fromJsonList(result.data as List);

      for (var element in userList) {
        userName.value = element.username;
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

  ///=================INIT CLOSE==============
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
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
