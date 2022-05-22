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

          return Obx(
            () => (controller.allList.length == null)
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
                        : Center(
                            child: GridView.builder(
                              itemCount: controller.allList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 2,
                                // mainAxisExtent: 5,
                                childAspectRatio: 3 / 4,
                              ),
                              itemBuilder: (context, index) {
                                TableListHome listBody =
                                    controller.allList[index];

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: LayoutBuilder(
                                    builder: ((context, constraints) {
                                      return Card(
                                        child: Column(
                                          children: [
                                            Icon(listBody.icon.to),
                                            Text("${listBody.judul}"),
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
          );
        },
      ),
    );
  }
}
