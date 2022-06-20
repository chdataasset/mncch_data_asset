import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controllers/home_controller.dart';
import 'home_view_small.dart';
import 'home_view_medium.dart';
import 'home_view_large.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return HomeViewSmall();
          } else if (constraints.maxWidth < 961) {
            return HomeViewMedium();
          } else {
            return HomeViewLarge();
          }
        },
      ),
    );
  }
}
