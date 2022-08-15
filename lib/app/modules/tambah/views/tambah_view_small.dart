import 'dart:io';
import 'dart:isolate';

import 'package:ch_data_asset/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../../../_assets/constant.dart';
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
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: Colors.white),
        ),
        title: Text('Tambah Data', style: FreeSansBold),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 10.0, right: 10, bottom: 10),
              child: Form(
                key: controller.registerFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: TextFormField(
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
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Obx(() => Column(
                              children: [
                                BarcodeWidget(
                                  barcode: Barcode.qrCode(
                                    errorCorrectLevel:
                                        BarcodeQRCorrectionLevel.high,
                                  ),
                                  data: controller.isiBarcode.value,
                                  width: width * 0.15,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Tap To Print",
                                  style: FreeSansReg.copyWith(fontSize: 8),
                                )
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
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
                      height: 10,
                    ),
                    TextFormField(
                      minLines: 5,
                      maxLines: 5,
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
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Merk",
                        prefixIcon: Icon(Icons.branding_watermark),
                      ),
                      autocorrect: false,
                      keyboardType: TextInputType.name,
                      controller: controller.merkC,
                      onChanged: (value) {
                        value = controller.merkC.text;
                      },
                      onSaved: (value) {
                        controller.merkC.text = value!;
                      },
                      validator: (value) {
                        return controller.validatemerk(value!);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Type",
                        prefixIcon: Icon(Icons.type_specimen_sharp),
                      ),
                      autocorrect: false,
                      keyboardType: TextInputType.name,
                      controller: controller.typeC,
                      onChanged: (value) {
                        value = controller.typeC.text;
                      },
                      onSaved: (value) {
                        controller.typeC.text = value!;
                      },
                      validator: (value) {
                        return controller.validatetype(value!);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Serial Number",
                        prefixIcon: Icon(Icons.numbers),
                      ),
                      autocorrect: false,
                      keyboardType: TextInputType.name,
                      controller: controller.serialC,
                      onChanged: (value) {
                        value = controller.serialC.text;
                      },
                      onSaved: (value) {
                        controller.serialC.text = value!;
                      },
                      validator: (value) {
                        return controller.validateserial(value!);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Purchase Request",
                        prefixIcon: Icon(Icons.document_scanner),
                      ),
                      autocorrect: false,
                      keyboardType: TextInputType.name,
                      controller: controller.PRC,
                      onChanged: (value) {
                        value = controller.PRC.text;
                      },
                      onSaved: (value) {
                        controller.PRC.text = value!;
                      },
                      validator: (value) {
                        return controller.validatepr(value!);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Purchase Order",
                        prefixIcon: Icon(Icons.document_scanner),
                      ),
                      autocorrect: false,
                      keyboardType: TextInputType.name,
                      controller: controller.POC,
                      onChanged: (value) {
                        value = controller.POC.text;
                      },
                      onSaved: (value) {
                        controller.POC.text = value!;
                      },
                      validator: (value) {
                        return controller.validatepo(value!);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Price",
                        prefixIcon: Icon(Icons.attach_money),
                      ),
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      controller: controller.priceC,
                      onChanged: (value) {
                        value = controller.priceC.text;
                      },
                      onSaved: (value) {
                        controller.priceC.text = value!;
                      },
                      validator: (value) {
                        return controller.validateprice(value!);
                      },
                    ),
                    SizedBox(
                      height: 10,
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
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Department",
                        prefixIcon: Icon(Icons.table_rows),
                      ),
                      autocorrect: false,
                      keyboardType: TextInputType.name,
                      controller: controller.deptC,
                      onChanged: (value) {
                        value = controller.deptC.text;
                      },
                      onSaved: (value) {
                        controller.deptC.text = value!;
                      },
                      validator: (value) {
                        return controller.validatedept(value!);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Storage Location",
                        prefixIcon: Icon(Icons.sd_storage_sharp),
                      ),
                      autocorrect: false,
                      keyboardType: TextInputType.name,
                      controller: controller.slocC,
                      onChanged: (value) {
                        value = controller.slocC.text;
                      },
                      onSaved: (value) {
                        controller.slocC.text = value!;
                      },
                      validator: (value) {
                        return controller.validatesloc(value!);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Condition :",
                          style: FreeSansReg,
                        ),
                        Obx(() => FlutterSwitch(
                            width: 75.0,
                            height: 35.0,
                            valueFontSize: 25.0,
                            toggleSize: 20.0,
                            value: controller.isCondition.value,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              controller.isCondition.value = val;
                            })),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onDoubleTap: () {
                        Get.bottomSheet(
                          Container(
                              height: 150,
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      controller.upload(ImageSource.camera);
                                      Get.back();
                                    },
                                    child: Text(
                                      "Camera",
                                      style: FreeSansBold,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      controller.upload(ImageSource.gallery);
                                      Get.back();
                                    },
                                    child: Text(
                                      "Gallery",
                                      style: FreeSansBold,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      "Batal",
                                      style: FreeSansBold,
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
                                    width: double.infinity,
                                    height: 250,
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
                                    width: double.infinity,
                                    height: 200,
                                    child: (controller
                                            .imageUrlStr.value.isNotEmpty)
                                        ? Image.file(controller.xfile)
                                        : Image.asset(
                                            "assets/images/noimage.png"),
                                  ),
                          ),
                          Divider(
                            height: 2,
                          ),
                          Text("Tap 2 kali Untuk Ganti Gambar",
                              style: FreeSansReg.copyWith(
                                  color: Colors.red,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 12)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
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
