import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tambah_controller.dart';
import './tambah_view_small.dart';
import './tambah_view_medium.dart';
import './tambah_view_large.dart';

class TambahView extends GetView<TambahController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return TambahViewSmall();
          } else if (constraints.maxWidth < 961) {
            return TambahViewMedium();
          } else {
            return TambahViewLarge();
          }
        },
      ),
    );
  }
}
