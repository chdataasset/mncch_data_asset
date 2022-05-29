import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controllers/home_controller.dart';
import 'home_view_mobile.dart';
import 'home_view_tablet.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: (width < 600) ? HomeViewMobile() : HomeViewTablet(),
    );
  }
}
