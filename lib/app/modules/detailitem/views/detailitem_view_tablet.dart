import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detailitem_controller.dart';

class DetailitemViewTablet extends GetView<DetailitemController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Item Tablet'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailitemView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
