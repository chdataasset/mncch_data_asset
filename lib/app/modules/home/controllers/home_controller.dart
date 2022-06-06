import 'package:ch_data_asset/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../_assets/data/struc/tbl_listhome.dart';

class HomeController extends GetxController {
  RxList<TableListHome> allList = List<TableListHome>.empty().obs;

  RxBool isLoading = false.obs;

  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  late SupabaseClient client = Supabase.instance.client;
  late Future<dynamic> dataFuture;

  Future<void> getAllList() async {
    List<TableListHome> allListHome = [];
    isLoading.value = true;
    try {
      PostgrestResponse<dynamic> response = await client
          .from("tbl_listhome")
          .select()
          .order("urut", ascending: true)
          .execute();

      List<TableListHome> dataList =
          TableListHome.fromJsonList((response.data as List));

      allList.value = List.from(dataList);

      allList.refresh();

      for (var element in allList) {
        allListHome.add(
          TableListHome(
            id: element.id,
            urut: element.urut,
            judul: element.judul,
            icon: element.icon,
          ),
        );
      }

      print(allListHome);
    } catch (err) {
      print(err);
    }

    isLoading.value = false;
    Get.back();
  }

  void GetRoute(route) {
    switch (route) {
      case 0:
        print(route);
        Get.toNamed(Routes.TAMBAH);
        break;
      case 1:
        print(route);
        // Get.toNamed(Routes.TAMBAH)
        break;
      case 2:
        // Get.toNamed(Routes.TAMBAH)
        break;
      case 3:
        // Get.toNamed(Routes.TAMBAH)
        break;
      case 4:
        // Get.toNamed(Routes.TAMBAH)
        break;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dataFuture = getAllList();
  }

  @override
  void onClose() {
    // TODO: implement onClose

    super.onClose();
  }
}
