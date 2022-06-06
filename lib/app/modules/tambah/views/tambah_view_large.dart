import 'dart:io';
import 'dart:isolate';

import 'package:ch_data_asset/_assets/constant.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../views/widget/buildimage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:barcode_widget/barcode_widget.dart';
import '../controllers/tambah_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TambahViewLarge extends GetView<TambahController> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.6;
    final height = MediaQuery.of(context).size.height;

    return Scaffold();
  }
}
