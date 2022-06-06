import 'dart:io';
import 'dart:isolate';

import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../views/widget/buildimage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:barcode_widget/barcode_widget.dart';
import '../controllers/tambah_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TambahViewSmall extends GetView<TambahController> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: controller.registerFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(() => BarcodeWidget(
                          barcode: Barcode.qrCode(
                            errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                          ),
                          data: controller.isiBarcode.value,
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                        )),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Id Asset",
                        prefixIcon: Icon(Icons.computer_outlined),
                      ),
                      autocorrect: false,
                      keyboardType: TextInputType.name,
                      controller: controller.idAssetC,
                      onChanged: (value) {
                        value = controller.idAssetC.text;
                        controller.isiBarcode.value = value;
                      },
                      onSaved: (value) {
                        controller.idAssetC.text = value!;
                      },
                      validator: (value) {
                        return controller.validateidAsset(value!);
                      },
                    ),
                    SizedBox(
                      height: 12,
                      width: double.infinity,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Asset Name",
                        prefixIcon: Icon(Icons.person_add),
                      ),
                      minLines: 1,
                      maxLines: 3,
                      autocorrect: false,
                      keyboardType: TextInputType.name,
                      controller: controller.nameC,
                      onChanged: (value) {
                        value = controller.nameC.text;
                      },
                      onSaved: (value) {
                        controller.nameC.text = value!;
                      },
                      validator: (value) {
                        return controller.validateName(value!);
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Description",
                        prefixIcon: Icon(Icons.description_outlined),
                      ),
                      autocorrect: false,
                      keyboardType: TextInputType.name,
                      controller: controller.descriptionC,
                      onChanged: (value) {
                        value = controller.descriptionC.text;
                      },
                      onSaved: (value) {
                        controller.descriptionC.text = value!;
                      },
                      validator: (value) {
                        return controller.validateDescription(value!);
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Person In Charge",
                        prefixIcon: Icon(Icons.person),
                      ),
                      autocorrect: false,
                      keyboardType: TextInputType.name,
                      controller: controller.picC,
                      onChanged: (value) {
                        value = controller.picC.text;
                      },
                      onSaved: (value) {
                        controller.picC.text = value!;
                      },
                      validator: (value) {
                        return controller.validatepic(value!);
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: controller.dateC,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Tgl Pembelian",
                        prefixIcon: Icon(Icons.date_range_rounded),
                      ),
                      onTap: () async {
                        DateTime date = DateTime(1900);
                        FocusScope.of(context).requestFocus(new FocusNode());
                        // Get.focusScope(date());
                        date = (await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100)))!;

                        // controller.dateC.text = dateformat(date.toIso8601String());
                        controller.dateC.text =
                            DateFormat('dd-MMM-yyyy').format(date);
                      },
                      onChanged: (value) => value = controller.dateC.text,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onDoubleTap: () {
                        Get.bottomSheet(
                          Container(
                              height: 150,
                              color: Colors.greenAccent,
                              child: Column(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      controller.upload(ImageSource.camera);
                                      Get.back();
                                    },
                                    child: Text(
                                      "Camera",
                                      textScaleFactor: 2,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      controller.upload(ImageSource.gallery);
                                      Get.back();
                                    },
                                    child: Text(
                                      "Gallery",
                                      textScaleFactor: 2,
                                    ),
                                  ),
                                ],
                              )),
                          barrierColor: Colors.red[50],
                          isDismissible: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                              side: BorderSide(width: 5, color: Colors.black)),
                          enableDrag: false,
                        );
                      },
                      child: Column(
                        children: [
                          Obx(
                            () => (controller.imageUrl.value == "" ||
                                    controller.imageUrl.value == "")
                                ? Container(
                                    width: 200,
                                    height: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/images/noimage.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.greenAccent)),
                                  )
                                : Container(
                                    width: 200,
                                    height: 200,
                                    child: (controller.filepath != null)
                                        ? Image.file(controller.xfile)
                                        : Image.asset(
                                            "assets/images/noimage.png"),
                                  ),
                          ),
                          Divider(
                            height: 2,
                          ),
                          Text(
                            "Tap 2 kali Untuk Ganti Gambar",
                            textScaleFactor: 1,
                            style: TextStyle(
                                color: Colors.red, fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.simpan();
                        },
                        child: Text("Submit")),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
