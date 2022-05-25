import 'package:image_picker/image_picker.dart';

import '../views/widget/buildimage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:barcode_widget/barcode_widget.dart';
import '../controllers/tambah_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TambahView extends GetView<TambahController> {
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      // 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      // 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data'),
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
                          width: 100,
                          height: 100,
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
                    Center(
                      child: InkWell(
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
                                side:
                                    BorderSide(width: 5, color: Colors.black)),
                            enableDrag: false,
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          height: 150,
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50, right: 50),
                                  child: Obx(
                                    () => (controller.imageUrl.value == "" ||
                                            controller.imageUrl.value == "")
                                        ? Container(
                                            width: double.infinity * 0.75,
                                            height: 200,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                "lib/app/assets/images/noimage.png",
                                                // "/data/user/0/com.example.owl_flutter/app_flutter/2022-05-06T10:32:23.274935.jpg",
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            width: double.infinity,
                                            height: 150,
                                            child: (controller.filebytes !=
                                                    null)
                                                ? Image.memory(
                                                    controller.filebytes,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.asset(
                                                    "lib/app/assets/images/noimage.png"),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Tap 2 kali Untuk Ganti Gambar",
                      textScaleFactor: 1,
                      style: TextStyle(
                          color: Colors.red, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text("Submit")),
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
