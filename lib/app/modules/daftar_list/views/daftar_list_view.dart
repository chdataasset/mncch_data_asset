import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/daftar_list_controller.dart';

import '../views/daftar_list_view_small.dart';
import '../views/daftar_list_view_medium.dart';
import '../views/daftar_list_view_large.dart';

class DaftarListView extends GetView<DaftarListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Barang'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return DaftarListViewSmall();
          } else if (constraints.maxWidth < 961) {
            return DaftarListViewMedium();
          } else {
            return DaftarListViewLarge();
          }
        },
      ),
    );
  }
}
