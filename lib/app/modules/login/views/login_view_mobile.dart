import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../assets/models/constant.dart';
import '../controllers/login_controller.dart';

class LoginViewMobile extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: AssetImage("lib/app/assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: kWhite.withOpacity(0.4),
                      ),
                      width: width * 0.6,
                      height: 150,
                      child: Image.asset(
                        "lib/app/assets/images/mncchannels.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: kWhite.withOpacity(0.8),
                        ),
                        width: width * 0.9,
                        height: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: width * 0.8,
                              height: 50,
                              child: TextFormField(
                                decoration: kTextFieldDecoration.copyWith(
                                    label: Text("Email")),
                              ),
                            ),
                            Container(
                              width: width * 0.8,
                              height: 50,
                              child: TextFormField(
                                obscureText: true,
                                decoration: kTextFieldDecoration.copyWith(
                                    label: Text("Password")),
                              ),
                            ),
                            CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text("Remember Me"),
                              value: controller.rememberme.value,
                              onChanged: (value) {
                                controller.rememberme.toggle();
                              },
                            ),
                            Container(
                              width: width * 0.6,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: ElevatedButton(
                                onPressed: (() {}),
                                child: Text("SUBMIT"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//  Column(
//                     children: [
//                       Expanded(
//                           flex: 1,
//                           child: Container(
//                             child: AppBar(
//                               backgroundColor: Colors.black.withOpacity(0.4),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.vertical(
//                                       bottom: Radius.circular(30))),
//                               shadowColor: Colors.black,
//                               elevation: 0,
//                             ),
//                           )),
//                       Expanded(
//                           flex: 1,
//                           child: Container(
//                             color: Colors.transparent,
//                           )),
//                       Expanded(
//                           flex: 1,
//                           child: Container(
//                             color: Colors.green,
//                           )),
//                       Expanded(
//                           flex: 1,
//                           child: Container(
//                             color: Colors.amber,
//                           )),
//                       Expanded(
//                           flex: 1,
//                           child: Container(
//                             color: Colors.black,
//                           )),
//                       Expanded(
//                           flex: 3,
//                           child: Container(
//                             // ignore: sort_child_properties_last
//                             child: Form(
//                               autovalidateMode: AutovalidateMode.onUserInteraction,
//                               child: ListView(
//                                 children: [
//                                   TextFormField(
//                                     validator: (value) {
//                                       if (value == null) {
//                                         Get.snackbar(
//                                             "Error", "Email Tidak Boleh Kosong");
//                                       } else {
//                                         return null;
//                                       }
//                                     },
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   TextFormField(
//                                     decoration: kTextFieldDecoration,
//                                     validator: (value) {
//                                       if (value == null) {
//                                         Get.snackbar(
//                                             "Error", "Password Tidak Boleh Kosong");
//                                       } else {
//                                         return null;
//                                       }
//                                     },
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   ElevatedButton(
//                                       onPressed: () {
//                                         // controller.cek();
//                                       },
//                                       child: Text(
//                                         "Submit",
//                                       ))
//                                 ],
//                               ),
//                             ),
//                             color: Colors.pink,
//                           )),
//                       Expanded(
//                           flex: 1,
//                           child: Container(
//                             color: Colors.lightGreen,
//                           )),
//                       Expanded(
//                           flex: 1,
//                           child: Container(
//                             color: Colors.red,
//                           )),
//                     ],
//                   ),
