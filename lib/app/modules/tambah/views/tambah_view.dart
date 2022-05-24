import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_controller.dart';

class TambahView extends GetView<TambahController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TambahView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TambahView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
