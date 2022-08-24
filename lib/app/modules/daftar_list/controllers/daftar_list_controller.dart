import '../../../../_assets/data/struc/tbl_masteritem.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DaftarListController extends GetxController {
  RxBool isloading = false.obs;
  RxList getAllData = List.empty().obs;

  TextEditingController searchC = TextEditingController();

  Future getData() async {
    getAllData.clear(); //menghapus data list
    isloading.value = true;

    SupabaseClient client = Supabase.instance.client;
    try {
      print("oke");
      PostgrestResponse response = await client
          .from('tbl_masteritem')
          .select()
          .order('id_asset', ascending: true)
          .execute();
      ;
      final data = response.data;
      final error = response.status;

      List<TblMasterItem> dataItem =
          TblMasterItem.fromJsonList(response.data as List);

      getAllData.value = List.from(dataItem);

      getAllData.refresh();

      isloading.value = false;
    } catch (err) {
      print(err);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}
