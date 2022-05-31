import 'package:ch_data_asset/app/modules/login/views/login_view_mobile.dart';
import 'package:ch_data_asset/app/modules/login/views/login_view_tablet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: (width < 600) ? LoginViewMobile() : LoginViewTablet(),
    );
  }
}
