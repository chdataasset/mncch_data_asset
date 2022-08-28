import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'dart:async';

import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ch_data_asset/_assets/data/struc/tbl_department.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import '../../../../_assets/constant.dart';
import '../../../../_assets/data/struc/tbl_user.dart';

class TambahController extends GetxController {
  RxString userName = "".obs;
  RxString isiBarcode = "".obs;
  RxString imageUrl = "".obs;
  RxBool isLoading = false.obs;

  RxString filepath = "".obs;
  RxString imageUrlStr = "".obs;
  RxString sourceImg = "".obs;
  RxString department = "Select Item".obs;
  RxString selectedValue = "Select Item".obs;
  //  final selected = "some book type".obs
  // RxList dataVal = [].obs;

  RxBool isSimpan = false.obs;
  RxBool isCondition = false.obs;

  TextEditingController idAssetC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();
  TextEditingController merkC = TextEditingController();
  TextEditingController typeC = TextEditingController();
  TextEditingController serialC = TextEditingController();
  TextEditingController PRC = TextEditingController();
  TextEditingController POC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController deptC = TextEditingController();
  TextEditingController slocC = TextEditingController();
  TextEditingController brokenC = TextEditingController();
  TextEditingController dateC = TextEditingController();

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  SupabaseClient client = Supabase.instance.client;
  late Uint8List filebytes;
  late File xfile;
  File? ambilGambar;
  late File imageFile;

  // final List<Tdept> modelDept = [];
  // List<String> department = [];
  // final List<Tdept> modelSloc = [];
  // List<String> StorageLoc = [];

   void setSelected(String value){
     selectedValue.value = value;
   }

  Future<void> upload(ImageSource imageSource) async {
    isLoading.value = true;
    var list = [];

    try {
      final picker = ImagePicker();
      final imageFile = await picker.pickImage(
        source: (imageSource == ImageSource.camera)
            ? ImageSource.camera
            : ImageSource.gallery,
        imageQuality: 100,
        maxWidth: double.infinity,
        maxHeight: double.infinity,
      );
      if (imageFile == null) {
        errorDialog;
        return;
      }

      File tmpFile = File(imageFile.path);

      final bytes = await imageFile.readAsBytes();
      final fileExt = imageFile.path.split('.').last;
      final fileName = '$preName${DateTime.now().toIso8601String()}.$fileExt';
      final filePath = fileName;
      filepath.value = filePath.toString();
      filebytes = bytes;
      xfile = tmpFile;
      imageUrlStr.value = fileName;

      final Directory extDir = await getApplicationDocumentsDirectory();
      String dirPath = extDir.path;
      final String extfilePath = '$dirPath/$fileName';

      final File newImage = await tmpFile.copy(extfilePath);

      imageUrl.value = newImage.toString();

      if (imageFile != null) {
        tmpFile = newImage;
      } else {
        print('No image selected.');
      }
    } catch (err) {
      errorDialog;
      Get.back();
      return;
    }

    isLoading.value = false;
    update();
  }

  void simpan() async {
    isLoading.value = true;
    userName.value = client.auth.currentUser!.id;
    if ((idAssetC.text.isNotEmpty && idAssetC.text != null) &&
        (nameC.text.isNotEmpty && nameC.text != null) &&
        // descriptionC.text.isNotEmpty ||descriptionC.text!=null||
        // merkC.text.isNotEmpty ||merkC.text!=null||
        // typeC.text.isNotEmpty || typeC.text!=null||
        // serialC.text.isNotEmpty ||
        // PRC.text.isNotEmpty ||
        // POC.text.isNotEmpty ||
        // priceC.text.isNotEmpty ||
        // deptC.text.isNotEmpty ||
        // slocC.text.isNotEmpty ||
        // dateC.text.isNotEmpty ||
        (imageUrlStr.value.isNotEmpty && imageUrlStr.value != null)) {
      try {
        await simpanGambar(filepath.value, filebytes);

        await client
            .from("tbl_masteritem")
            .insert({
              "id_asset": idAssetC.text,
              "name_asset": nameC.text,
              "desc_asset":
                  (descriptionC.text.isEmpty) ? "" : descriptionC.text,
              "merk": (merkC.text.isEmpty) ? "" : merkC.text,
              "type": (typeC.text.isEmpty) ? "" : typeC.text,
              "serial_number": (serialC.text.isEmpty) ? "" : serialC.text,
              "purc_request": (PRC.text.isEmpty) ? "" : PRC.text,
              "purc_order": (POC.text.isEmpty) ? "" : POC.text,
              "price": (priceC.text.isEmpty) ? "0.0" : priceC.text,
              "tgl_beli": (dateC.text.isEmpty)
                  ? DateTime.now().toIso8601String()
                  : dateC.text,
              "department": (deptC.text.isEmpty) ? "" : department.value,
              "sloc": (slocC.text.isEmpty) ? "" : slocC.text,
              "condition": isCondition.value,
              "reason": (brokenC.text.isEmpty) ? "" : brokenC.text,
              "user_created": userName.value,
              "created_at": DateTime.now().toIso8601String(),
              "imageUrl": imageUrlStr.value,
            })
            .execute()
            .then((value) {
              if (value.data != null) {
                Get.defaultDialog(
                    title: "Success",
                    middleText: "Data Telah Tersimpan",
                    textConfirm: "Ok",
                    onConfirm: () {
                      clearText();
                      Get.back();
                    });
                clearText();
                isSimpan.value = true;
              }
            });
      } catch (err) {
        print(err);
        errorDialog;
      }
    } else {
      print("gak komplit");
      Get.defaultDialog(
          title: "Error",
          middleText: "ID/Nama/Gambar Harus Diisi",
          textConfirm: "Ok",
          onConfirm: () {
            Get.back();
          });
    }

    isLoading.value = false;
  }

  simpanGambar(path, bytes) async {
    try {
      final response =
          await client.storage.from('images/images').uploadBinary(path, bytes);

      StorageResponse<String> imageUrlResponse =
          await client.storage.from('images/images').getPublicUrl(path);
    } catch (err) {
      print(err);
      errorDialog;
      Get.back();
    }
  }

  ///=================CEK VALIDASI==============
  String? validateidAsset(String value) {
    if (value.length <= 6 || value.isEmpty) {
      return null;
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

  String? validatemerk(String value) {
    if (value.isEmpty) {
      return "Merk Wajib Diisi";
    }
    return null;
  }

  String? validatetype(String value) {
    if (value.isEmpty) {
      return "Type Wajib Diisi";
    }
    return null;
  }

  String? validateserial(String value) {
    if (value.isEmpty) {
      return "Type Wajib Diisi";
    }
    return null;
  }

  String? validatepr(String value) {
    if (value.isEmpty) {
      return "PR Wajib Diisi";
    }
    return null;
  }

  String? validatepo(String value) {
    if (value.isEmpty) {
      return "PO Wajib Diisi";
    }
    return null;
  }

  String? validateprice(String value) {
    if (value.isEmpty) {
      return "Harga Wajib Diisi";
    }
    return null;
  }

  String? validatedept(String value) {
    if (value.isEmpty) {
      return "Department Wajib Diisi";
    }
    return null;
  }

  String? validatesloc(String value) {
    if (value.isEmpty) {
      return "Storage Location Wajib Diisi";
    }
    return null;
  }

  String? validatebroken(String value) {
    if (value.isEmpty) {
      return "Reason Broken Wajib Diisi";
    }
    return null;
  }

  clearText() {
    idAssetC.text = "";
    nameC.text = "";
    descriptionC.text = "";
    merkC.text = "";
    typeC.text = "";
    serialC.text = "";
    PRC.text = "";
    POC.text = "";
    priceC.text = "";
    dateC.text = "";
    department.value = "";
    slocC.text = "";
    isCondition.value = false;
    brokenC.text = "";
    imageUrlStr.value = "";
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
    merkC.dispose();
    typeC.dispose();
    serialC.dispose();
    PRC.dispose();
    POC.dispose();
    priceC.dispose();
    deptC.dispose();
    slocC.dispose();
    brokenC.dispose();
    dateC.dispose();
    super.onClose();
  }
}
