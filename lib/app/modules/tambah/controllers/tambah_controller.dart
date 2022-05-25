import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TambahController extends GetxController {
  RxString isiBarcode = "".obs;
  RxString imageUrl = "".obs;
  RxBool isLoading = false.obs;
  RxString filepath = "".obs;
  RxString imageUrlStr = "".obs;
  RxString sourceImg = "".obs;

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

  // String pilihGambar() {

  // var pilihanGambar=  Get.defaultDialog(
  //         title: "Error",
  //         middleText: "No Image",
  //         textConfirm: "Ok",
  //         onConfirm: () {
  //           Row(children: [
  //             ElevatedButton(onPressed: (){}, child: Text("Gallery")),
  //             ElevatedButton(onPressed: (){}, child: Text("Camera")),
  //           ],)
  //           Get.back();
  //           Get.back();
  //         });
  // }

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
    super.onClose();
  }
}
