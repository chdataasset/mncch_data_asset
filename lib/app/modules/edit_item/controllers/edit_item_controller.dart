import 'dart:io';

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
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
  RxInt id = 0.obs;
  RxString idAssetT = "".obs;
  RxString nameT = "".obs;
  RxString descriptionT = "".obs;
  RxString picT = "".obs;
  RxString dateT = "".obs;
  RxString tglBeli = "".obs;
  RxString imageUrlT = "".obs;
  RxList getAllData = List.empty().obs;

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  String itemEdit = Get.arguments;

  TextEditingController idAssetC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();
  TextEditingController picC = TextEditingController();
  TextEditingController dateC = TextEditingController();
  TextEditingController tglBeliC = TextEditingController();

  SupabaseClient client = Supabase.instance.client;

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
      DateTime date = DateTime(1900);

      // Get.focusScope(date());

      for (var element in getAllData.value) {
        id.value = element.id;
        idAssetC.text = element.idAsset;
        nameC.text = element.nameAsset;
        descriptionC.text = element.descAsset;
        picC.text = element.picAsset;
        imageUrl.value = BaseUrl.cPathImgUrl + element.imageUrl;
        tglBeliC.text = element.tglBeli;
        DateTime tanggal = DateTime.parse(tglBeliC.text);
        dateC.text = DateFormat("dd-MMM-yyyy").format(tanggal);
        print(dateC.text);
      }
    } catch (err) {
      print(err);
    }
  }

  Future<void> simpan() async {
    isLoading.value = true;

    try {
      print(id.value);
      PostgrestResponse<dynamic> result =
          await client.from("tbl_masteritem").update({
        "id_asset": idAssetC.text,
        "name_asset": nameC.text,
        "desc_asset": descriptionC.text,
        "pic_asset": picC.text,
        "tgl_beli": dateC.text,
        // "user_created": userName.value,
        // "created_at": DateTime.now().toIso8601String(),
        // "imageUrl": imageUrlStr.value,
      }).match({"id": id.value}).execute();
      print(result.status);
      isLoading.value = false;
    } catch (err) {
      print(err);
    }
    isLoading.value = false;
  }

  Future<void> upload(ImageSource imageSource) async {
    isLoading.value = true;

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
      imageUrl.value = fileName;

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
