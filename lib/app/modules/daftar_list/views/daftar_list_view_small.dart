import 'package:ch_data_asset/_assets/data/struc/tbl_masteritem.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../_assets/constant.dart';
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
              gradient: LinearGradient(
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
                              ? Center(child: const CircularProgressIndicator())
                              // : Text("loading")
                              : ListView.builder(
                                  itemCount: controller.getAllData().length,
                                  itemBuilder: (context, index) {
                                    TblMasterItem itemBody =
                                        controller.getAllData[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                            width: double.infinity,
                                            height: 100,
                                            color: kLightgreen,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                    height: 100,
                                                    width: 100,
                                                    color: Colors.transparent,
                                                    child: Image.network(
                                                      itemBody.imageUrl,
                                                      fit: BoxFit.fill,
                                                    )),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10.0,
                                                          bottom: 2,
                                                          right: 2),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 30,
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
                                                                fontSize: 20),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 1,
                                                      ),
                                                      SizedBox(
                                                        width: 250,
                                                        child: Text(
                                                          itemBody.descAsset,
                                                          overflow: TextOverflow
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
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}






  // child: Form(
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.all(5.0),
              //         child: Row(
              //           children: [
              //             Expanded(
              //               child: TextFormField(
              //                 validator: (value) {
              //                   if (value == null || value.isEmpty) {
              //                     return 'Please enter some text';
              //                   }
              //                   return null;
              //                 },
              //                 controller: controller.searchC,
              //                 keyboardType: TextInputType.text,
              //                 autocorrect: false,
              //                 decoration: kTextFieldDecoration.copyWith(
              //                     label: Text("Search")),
              //                 onChanged: (value) =>
              //                     value = controller.searchC.text,
              //               ),
              //             ),
            
              //             IconButton(
              //               constraints: BoxConstraints(
              //                 minWidth: kMinInteractiveDimension,
              //                 minHeight: kMinInteractiveDimension,
              //               ),
              //               onPressed: () {
              //                 print("search");
              //               },
              //               icon: Icon(Icons.search),
              //             ),
              //             IconButton(
              //               constraints: BoxConstraints(
              //                 minWidth: kMinInteractiveDimension,
              //                 minHeight: kMinInteractiveDimension,
              //               ),
              //               onPressed: () {},
              //               icon: Icon(Icons.sort_rounded),
              //             ),
              //             // SizedBox(
              //             //   width: 5,
              //             // ),
              //             // IconButton(
              //             //     onPressed: () {}, icon: Icon(Icons.sort_rounded)),
              //             // SizedBox(
              //             //   width: 2,
              //             // ),
              //           ],
              //         ),
                      
              //       ),
            
              //     ],
              //   ),
              // ),