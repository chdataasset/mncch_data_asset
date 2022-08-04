import 'package:ch_data_asset/_assets/data/struc/tbl_masteritem.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../_assets/constant.dart';
import '../../../routes/app_pages.dart';
import '../controllers/daftar_list_controller.dart';

class DaftarListViewSmall extends GetView<DaftarListController> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.red, Colors.purple]),
            ),
            child: FutureBuilder(
              future: controller.getData(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Obx(
                  () => (controller.getAllData.length == null)
                      ? const Center(
                          child: Text(
                            "Data Tidak Ada",
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: () => controller.getData(),
                          child: (controller.isloading.value)
                              ? const Center(child: CircularProgressIndicator())
                              // : Text("loading")
                              : SafeArea(
                                  child: SingleChildScrollView(
                                    child: ListView.builder(
                                        itemCount: controller.getAllData().length,
                                        itemBuilder: (context, index) {
                                          TblMasterItem itemBody =
                                              controller.getAllData[index];
                                          return Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: InkWell(
                                              onTap: () {
                                                Get.toNamed(Routes.DETAILITEM,
                                                    arguments: itemBody);
                                              },
                                              child: Container(
                                                  width: double.infinity,
                                                  height: 100,
                                                  color: kLightgreen,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                3.0),
                                                        child: Container(
                                                          height:
                                                              double.maxFinite,
                                                          width: 100,
                                  
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  width: 3,
                                                                  color: Colors
                                                                      .white)),
                                                          // child: Text(
                                                          //     "${BaseUrl.cPathImgUrl}${itemBody.imageUrl}")
                                                          child: Image.network(
                                                            "${BaseUrl.cPathImgUrl}${itemBody.imageUrl}",
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                left: 10.0,
                                                                bottom: 2,
                                                                right: 2),
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              // height: 30,
                                                              width: 250,
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  "${itemBody.nameAsset} ",
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          20),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 1,
                                                            ),
                                                            SizedBox(
                                                              width: 250,
                                                              child: Text(
                                                                itemBody
                                                                    .descAsset,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                        ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
