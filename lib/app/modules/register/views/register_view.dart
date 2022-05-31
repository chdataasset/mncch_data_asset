import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../models/constant.dart';
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
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 16, left: 16, right: 16),
            alignment: Alignment.center,
            width: width * 0.85,
            height: 360,
            color: Color.fromARGB(255, 227, 224, 224),
            child: SingleChildScrollView(
                child: Form(
              key: controller.registerFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Container(
                      width: width * 0.85,
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "User Name",
                          prefixIcon: Icon(Icons.person),
                        ),
                        autocorrect: false,
                        keyboardType: TextInputType.name,
                        controller: controller.userNameC,
                        onChanged: (value) {
                          value = controller.userNameC.text;
                        },
                        onSaved: (value) {
                          controller.userNameC.text = value!;
                        },
                        validator: (value) {
                          return controller.validateName(value!);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      controller: controller.emailC,
                      onChanged: (value) {
                        value = controller.emailC.text;
                      },
                      onSaved: (value) {
                        controller.emailC.text = value!;
                      },
                      validator: (value) {
                        return controller.validateEmail(value!);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: Obx(() => TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Password",
                            prefixIcon: Icon(Icons.key_outlined),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.isShowHide.toggle();
                                },
                                icon: Icon(controller.isShowHide.value
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                          ),
                          autocorrect: false,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText:
                              (controller.isShowHide.value) ? true : false,
                          controller: controller.passwordC,
                          onChanged: (value) {
                            value = controller.passwordC.text;
                          },
                          onSaved: (value) {
                            controller.passwordC.text = value!;
                          },
                          validator: (value) {
                            return controller.validatePassword(value!);
                          },
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      margin: EdgeInsets.all(30),
                      decoration: kBoxRounded,
                      width: double.infinity,
                      height: 50,
                      child: Obx(() => ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: () {
                            // controller.isLoading.value = true;
                            controller.validRegister();
                          },
                          child: (controller.isLoading.value)
                              ? Text("LOADING...")
                              : Text("SUBMIT"))))
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
