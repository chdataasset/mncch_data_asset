import 'package:ch_data_asset/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../assets/models/constant.dart';
import '../controllers/login_controller.dart';

class LoginViewMobile extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        image: new DecorationImage(
          image: AssetImage("lib/app/assets/images/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            title: Text("MNC Channels Data Assets"),
            backgroundColor: Colors.white.withOpacity(0.12),
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            )),
        body: SafeArea(
          child: Container(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Container(
                      // margin: EdgeInsets.only(top: 60),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: kWhite.withOpacity(0.2),
                      ),
                      width: width * 0.8,
                      height: 150,
                      child: Image.asset(
                        "lib/app/assets/images/mncchannels.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Form(
                    key: controller.loginFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 28.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: kWhite.withOpacity(0.8),
                              ),
                              width: width * 0.85,
                              height: 300,
                              child: Center(
                                child: Form(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: width * 0.8,
                                        height: 50,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            labelText: "Email",
                                            prefixIcon:
                                                Icon(Icons.email_outlined),
                                          ),
                                          autocorrect: false,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller: controller.emailC,
                                          onChanged: (value) {
                                            value = controller.emailC.text;
                                          },
                                          onSaved: (value) {
                                            controller.emailC.text = value!;
                                          },
                                          validator: (value) {
                                            return controller
                                                .validateEmail(value!);
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: width * 0.8,
                                        height: 50,
                                        child: Obx(() => TextFormField(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                labelText: "Password",
                                                prefixIcon:
                                                    Icon(Icons.key_outlined),
                                                suffixIcon: IconButton(
                                                    onPressed: () {
                                                      controller.isHide
                                                          .toggle();
                                                    },
                                                    icon: Icon(controller
                                                            .isHide.value
                                                        ? Icons.visibility
                                                        : Icons
                                                            .visibility_off_outlined)),
                                              ),
                                              autocorrect: false,
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              obscureText:
                                                  (controller.isHide.value)
                                                      ? false
                                                      : true,
                                              controller: controller.passwordC,
                                              onChanged: (value) {
                                                value =
                                                    controller.passwordC.text;
                                              },
                                              onSaved: (value) {
                                                controller.passwordC.text =
                                                    value!;
                                              },
                                              validator: (value) {
                                                return controller
                                                    .validatePassword(value!);
                                              },
                                            )),
                                      ),
                                      Obx(
                                        () => CheckboxListTile(
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          title: Text("Remember Me"),
                                          value: controller.isRemember.value,
                                          onChanged: (value) {
                                            controller.isRemember.toggle();
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: width * 0.8,
                                        height: 50,
                                        decoration: kDecorPurple,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            controller.validLogin();
                                          },
                                          child: (controller.isLoading.value)
                                              ? Text("LOADING...")
                                              : Text("SUBMIT"),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text("Don't have an account?"),
                                          TextButton(
                                              onPressed: () {
                                                Get.toNamed(Routes.REGISTER);
                                              },
                                              child: Text(
                                                "Sign Up",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
