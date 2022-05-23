import 'package:ch_data_asset/app/assets/models/tbl_listhome.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import './widgets/cardlist.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.getAllList(),
      ),
      body: FutureBuilder(
        future: controller.dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Obx(() => (controller.allList.length == null)
              ? Center(
                  child: Text(
                    "Data Tidak Ada",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              : RefreshIndicator(
                  onRefresh: () => controller.getAllList(),
                  child: (controller.isLoading.value)
                      ? CircularProgressIndicator()
                      // : Text("loading")
                      : SafeArea(
                          child: Center(
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              final width = constraints.maxWidth;
                              final height = constraints.maxHeight;
                              return Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topCenter,
                                    height: 0.25,
                                    width: width,
                                    color: Colors.red,
                                  ),
                                  Container(
                                    width: width,
                                    height: height * 0.50,
                                    color: Colors.amber,
                                    child: GridView.builder(
                                      itemCount: controller.allList.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 2,
                                        mainAxisSpacing: 2,
                                        // mainAxisExtent: 5,
                                        childAspectRatio: 1 / 1,
                                      ),
                                      itemBuilder: (context, index) {
                                        //   Text("${listBody.judul}"),
                                        TableListHome listBody =
                                            controller.allList[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: LayoutBuilder(
                                            builder: ((context, constraints) {
                                              return Column(
                                                children: [
                                                  Container(
                                                    width: constraints.maxWidth,
                                                    height:
                                                        constraints.maxHeight *
                                                            0.85,
                                                    decoration: BoxDecoration(
                                                      image:
                                                          new DecorationImage(
                                                        image: AssetImage(
                                                            "${listBody.icon}"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  // Text("${listBody.judul}"),
                                                ],
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              );
                            }),
                          ),
                        ),
                ));
        },
      ),
    );
  }
}
