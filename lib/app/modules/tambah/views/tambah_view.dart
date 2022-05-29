import 'package:ch_data_asset/app/modules/tambah/views/tambah_view_mobile.dart';
import 'package:ch_data_asset/app/modules/tambah/views/tambah_view_tablet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../login/views/login_view_mobile.dart';
import '../../login/views/login_view_tablet.dart';
import '../controllers/tambah_controller.dart';

class TambahView extends GetView<TambahController> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: (width < 600) ? TambahViewMobile() : TambahViewTablet(),
    );
  }
}
