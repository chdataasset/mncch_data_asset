import 'package:avatar_glow/avatar_glow.dart';
import 'package:ch_data_asset/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../_assets/constant.dart';
import '../../../../_assets/data/struc/tbl_listhome.dart';
import '../controllers/home_controller.dart';

class HomeViewSmall extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: AvatarGlow(
      //   glowColor: Colors.white,
      //   showTwoGlows: true,
      //   endRadius: 50.0,
      //   child: FloatingActionButton(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Icon(Icons.qr_code_2_outlined),
      //         Text(
      //           "Scan",
      //           style: TextStyle(fontSize: 8),
      //         )
      //       ],
      //     ),
      //     onPressed: () => controller.scanBarcode(),
      //   ),
      // ),

      body: FutureBuilder(
        future: controller.dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Obx(() => (controller.allList.length == null)
              ? const Center(
                  child: const Text(
                    "Data Tidak Ada",
                    style: const TextStyle(fontSize: 16),
                  ),
                )
              : RefreshIndicator(
                  onRefresh: () => controller.getAllList(),
                  child: (controller.isLoading.value)
                      ? const CircularProgressIndicator()
                      // : Text("loading")
                      : SafeArea(
                          child: Center(child:
                              LayoutBuilder(builder: (context, constraints) {
                            final width = constraints.maxWidth;
                            final height = constraints.maxHeight;
                            return Container(
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.centerRight,
                                      colors: [Colors.red, Colors.purple])),
                              child: DraggableScrollableSheet(
                                  initialChildSize: 0.75,
                                  minChildSize: 0.4,
                                  maxChildSize: 0.75,
                                  builder: (context, controllerdrag) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.2),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft:
                                                  const Radius.circular(25),
                                              topRight:
                                                  const Radius.circular(25),
                                            ),
                                          ),
                                          child: GridView.builder(
                                            controller: controllerdrag,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 2,
                                              mainAxisSpacing: 2,
                                              // mainAxisExtent: 5,

                                              childAspectRatio: 4 / 4,
                                            ),
                                            // controller: controllerdrag,
                                            itemCount:
                                                controller.allList.length,
                                            itemBuilder: (context, index) {
                                              TableListHome allData =
                                                  controller.allList[index];

                                              return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30.0,
                                                          left: 10,
                                                          right: 10,
                                                          bottom: 20),
                                                  child: Column(
                                                    children: [
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            shape:
                                                                const CircleBorder(),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3),

                                                            primary: const Color
                                                                    .fromARGB(
                                                                255,
                                                                212,
                                                                216,
                                                                219), // <-- Button color
                                                            onPrimary: Colors
                                                                .red, // <-- Splash color
                                                          ),
                                                          onPressed: (() {
                                                            switch (index) {
                                                              case 0:
                                                                Get.toNamed(
                                                                    Routes
                                                                        .TAMBAH);
                                                                break;
                                                              case 1:
                                                                Get.toNamed(Routes
                                                                    .DAFTAR_LIST);
                                                                break;
                                                              case 2:
                                                                Get.toNamed(Routes
                                                                    .DETAILITEM);
                                                                break;
                                                              case 3:
                                                                // Get.toNamed(Routes.TAMBAH)
                                                                break;
                                                              case 4:
                                                                // Get.toNamed(Routes.TAMBAH)
                                                                break;
                                                            }
                                                          }),
                                                          child: Column(
                                                            children: [
                                                              Image(
                                                                image: AssetImage(
                                                                    "${allData.icon}"),
                                                              ),
                                                            ],
                                                          )),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                            "${allData.judul}",
                                                            style: FreeSansReg
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white)),
                                                      ),
                                                    ],
                                                  ));
                                            },
                                          )),
                                    );
                                  }),
                            );
                          })),
                        ),
                ));
        },
      ),
    );
  }
}
