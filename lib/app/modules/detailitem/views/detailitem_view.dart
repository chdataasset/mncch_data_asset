import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detailitem_controller.dart';

import './detailitem_view_mobile.dart';
import './detailitem_view_tablet.dart';

class DetailitemView extends GetView<DetailitemController> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: (width < 600) ? DetailitemViewMobile() : DetailitemViewTablet(),
    );
  }
}
