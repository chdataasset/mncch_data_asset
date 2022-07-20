import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../_assets/constant.dart';
import '../../../../_assets/data/struc/tbl_masteritem.dart';
import '../controllers/detailitem_controller.dart';

class DetailitemViewMobile extends GetView<DetailitemController> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Item'),
        centerTitle: true,
        backgroundColor: Colors.white70,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(left: 3, right: 3, bottom: 3),
                height: 100,
                width: double.maxFinite,
                color: Colors.green,
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(8),
                height: 100,
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "ID ASSET ${controller.idAssetT.value}",
                      style: helvetica_medium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Nama Asset : ${controller.nameT.value} ",
                      textWidthBasis: TextWidthBasis.longestLine,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Description : ${controller.descriptionT.value} Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "PIC : ${controller.picT.value} ",
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Tanggal Pembelian : ${controller.dateT.value} ",
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 3, right: 3, bottom: 3),
                height: 100,
                width: double.maxFinite,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
