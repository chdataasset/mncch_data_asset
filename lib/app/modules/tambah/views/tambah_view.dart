import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_controller.dart';

class TambahView extends GetView<TambahController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: controller.registerFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Id Asset",
                        prefixIcon: Icon(Icons.person),
                      ),
                      autocorrect: false,
                      keyboardType: TextInputType.name,
                      controller: controller.idAssetC,
                      onChanged: (value) {
                        value = controller.idAssetC.text;
                      },
                      onSaved: (value) {
                        controller.idAssetC.text = value!;
                      },
                      validator: (value) {
                        return controller.validateidAsset(value!);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
