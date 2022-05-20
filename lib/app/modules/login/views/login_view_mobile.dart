import 'package:ch_data_asset/app/modules/register/views/register_view.dart';
import 'package:ch_data_asset/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: kWhite.withOpacity(0.4),
                    ),
                    width: width * 0.8,
                    height: 150,
                    child: Image.asset(
                      "lib/app/assets/images/mncchannels.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: kWhite.withOpacity(0.8),
                  ),
                  width: width * 0.8,
                  height: 300,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 30, right: 30, left: 30, bottom: 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: width * 0.75,
                            height: 50,
                            child: TextFormField(
                              // controller: Control,
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,

                              decoration: kTextFieldDecoration.copyWith(
                                  label: Text("Email")),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: width * 0.8,
                            height: 50,
                            child: Obx(() => TextFormField(
                                  obscureText: (controller.isShowHide.value)
                                      ? false
                                      : true,
                                  autocorrect: false,
                                  keyboardType: TextInputType.name,
                                  decoration: kTextFieldDecoration.copyWith(
                                    label: Text("Password"),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          controller.isShowHide.toggle();
                                        },
                                        icon: Icon(controller.isShowHide.value
                                            ? Icons.visibility_off
                                            : Icons.visibility)),
                                  ),
                                )),
                          ),
                          Obx(
                            () => Container(
                              child: CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text("Remember Me"),
                                value: controller.isRemember.value,
                                onChanged: (value) {
                                  controller.isRemember.toggle();
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.8,
                            height: 50,
                            decoration: kDecorPurple,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Submit"),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
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
                                        fontStyle: FontStyle.italic),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
