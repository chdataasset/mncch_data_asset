import 'package:ch_data_asset/app/routes/app_pages.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../_assets/constant.dart';

import '../controllers/detailitem_controller.dart';

class DetailitemViewMobile extends GetView<DetailitemController> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // DateTime now = controller.dateT.value;
    // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    return Scaffold(
      extendBodyBehindAppBar: true,
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
              child: Obx(() => Container(
                    margin: EdgeInsets.only(left: 8, right: 8, bottom: 3),
                    width: double.infinity,
                    height: 200,
                    child: (controller.imageUrlT.value.isNotEmpty)
                        ? Image.network(
                            "${BaseUrl.cPathImgUrl}${controller.imageUrlT.value}")
                        : Image.asset("assets/images/noimage.png"),
                  )),
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
                    Obx(() => RichText(
                          text: TextSpan(
                              text: 'ID Asset :',
                              style: helvetica_bold.copyWith(
                                  color: Colors.black, fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' ${controller.idAssetT.value} ',
                                    style: HelveticaNeue_Medium.copyWith(
                                        color: Colors.black))
                              ]),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() => RichText(
                          text: TextSpan(
                              text: 'Nama Asset :',
                              style: helvetica_bold.copyWith(
                                  color: Colors.black, fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' ${controller.nameT.value} ',
                                    style: HelveticaNeue_Medium.copyWith(
                                        color: Colors.black))
                              ]),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() => RichText(
                          text: TextSpan(
                              text: 'Description :',
                              style: helvetica_bold.copyWith(
                                  color: Colors.black, fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' ${controller.descriptionT.value} ',
                                    style: HelveticaNeue_Medium.copyWith(
                                        color: Colors.black))
                              ]),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() => RichText(
                          text: TextSpan(
                              text: 'Person In Charge :',
                              style: helvetica_bold.copyWith(
                                  color: Colors.black, fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' ${controller.picT.value} ',
                                    style: HelveticaNeue_Medium.copyWith(
                                        color: Colors.black))
                              ]),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() => RichText(
                          text: TextSpan(
                              text: 'Tanggal Pembelian : ',
                              style: helvetica_bold.copyWith(
                                  color: Colors.black, fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        '${controller.dateT.value.substring(0, 10)}',
                                    style: HelveticaNeue_Medium.copyWith(
                                        color: Colors.black))
                              ]),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                String itemEdit = controller.idAssetT.value;
                Get.toNamed(Routes.EDIT_ITEM, arguments: itemEdit);
              },
              icon: const Icon(Icons.edit),
            ),
            label: "Edit",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () => controller.scanBarcode(),
              icon: Icon(Icons.qr_code_outlined),
            ),
            label: "Scan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_circle),
            label: "Remove",
          ),
        ],
      ),
    );
  }
}
