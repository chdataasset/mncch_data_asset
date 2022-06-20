import 'package:get/get.dart';

import '../controllers/daftar_list_controller.dart';

class DaftarListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarListController>(
      () => DaftarListController(),
    );
  }
}
