import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../assets/models/tbl_listhome.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
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

      allList.forEach(
        (element) {
          allListHome.add(
            TableListHome(
                id: element.id,
                urut: element.urut,
                judul: element.judul,
                icon: element.icon),
          );
        },
      );

      print(allListHome);
    } catch (err) {
      print(err);
    }

    isLoading.value = false;
    Get.back();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dataFuture = getAllList();
  }
}
