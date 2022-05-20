import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../assets/models/constant.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          title: Text("Register Account"),
          backgroundColor: Colors.white.withOpacity(0.12),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          )),
      body: Center(
        child: Container(
            alignment: Alignment.center,
            width: width * 0.75,
            height: 360,
            color: Color.fromARGB(255, 141, 141, 141),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    width: width * 0.6,
                    height: 50,
                    child: TextFormField(
                      // controller: Control,
                      keyboardType: TextInputType.name,
                      autocorrect: false,

                      decoration:
                          kTextFieldDecoration.copyWith(label: Text("Name")),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: width * 0.6,
                  height: 50,
                  child: TextFormField(
                    // controller: Control,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    decoration:
                        kTextFieldDecoration.copyWith(label: Text("Email")),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: width * 0.6,
                  height: 50,
                  child: TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.name,
                    autocorrect: false,
                    decoration:
                        kTextFieldDecoration.copyWith(label: Text("Password")),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: width * 0.6,
                  height: 50,
                  child: TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.name,
                    autocorrect: false,
                    decoration: kTextFieldDecoration.copyWith(
                        label: Text("Confirm Password")),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Container(
                      decoration: kBoxRounded,
                      width: width * 0.6,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Submit"))),
                )
              ],
            )),
      ),
    );
  }
}
