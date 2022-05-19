import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../assets/models/constant.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: new DecorationImage(
          image: AssetImage("lib/app/assets/images/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      child: AppBar(
                        backgroundColor: Colors.black.withOpacity(0.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(30))),
                        shadowColor: Colors.black,
                        elevation: 0,
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.transparent,
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.green,
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.amber,
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.black,
                    )),
                Expanded(
                    flex: 3,
                    child: Container(
                      // ignore: sort_child_properties_last
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: ListView(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null) {
                                  Get.snackbar(
                                      "Error", "Email Tidak Boleh Kosong");
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: kTextFieldDecoration,
                              validator: (value) {
                                if (value == null) {
                                  Get.snackbar(
                                      "Error", "Password Tidak Boleh Kosong");
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  // controller.cek();
                                },
                                child: Text(
                                  "Submit",
                                ))
                          ],
                        ),
                      ),
                      color: Colors.pink,
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.lightGreen,
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.red,
                    )),
              ],
            ),
          )),
    );
  }
}
