import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_item_controller.dart';
import '../views/edit_item_large.dart';
import '../views/edit_item_medium.dart';
import '../views/edit_item_small.dart';

class EditItemView extends GetView<EditItemController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return EditItemSmall();
          } else if (constraints.maxWidth < 961) {
            return EditItemMedium();
          } else {
            return EditItemLarge();
          }
        },
      ),
    );
  }
}
