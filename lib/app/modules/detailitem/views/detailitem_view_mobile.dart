import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../_assets/constant.dart';
import '../controllers/detailitem_controller.dart';

class DetailitemViewMobile extends GetView<DetailitemController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (GetPlatform.isMobile)
          ? AppBar(
              elevation: 5,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () => controller.scanBarcode(),
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30.0)),
                          border: Border.all(color: Colors.white)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Scan Barcode",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Icon(Icons.qr_code_scanner_outlined,
                                size: 18, color: Colors.blue)
                          ]),
                    ),
                  ),
                )
              ],
            )
          : AppBar(
              elevation: 25,
              title: Text('Detail Item'),
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
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller
                                    .cariData(controller.isiBarcode.value);
                              },
                              icon: Icon(Icons.search_outlined))),
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

                        controller.dateC.text =
                            DateFormat('dd-MMM-yyyy').format(date);
                      },
                      onChanged: (value) => value = controller.dateC.text,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Center(
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
                                        border: Border.all(color: kLightgreen)),
                                  )
                                : Container(
                                    width: 200,
                                    height: 200,
                                    child: (controller.filebytes != null)
                                        ? Image.memory(
                                            filterQuality: FilterQuality.high,
                                            width: 150,
                                            height: 150,
                                            controller.filebytes,
                                            fit: BoxFit.fill,
                                          )
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
                          // controller.simpan();
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
