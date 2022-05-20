import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

SupabaseClient client = Supabase.instance.client;

class RegisterController extends GetxController {
  //TODO: Implement LoginController
  RxString userName = "".obs;
  RxString email = "".obs;

  final loginFormKey = GlobalKey<FormState>();
  final userNameC = TextEditingController();
  final emailC = TextEditingController();
  final pass1C = TextEditingController();
  final pass2C = TextEditingController();

  validator(String value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  validator_pass1(String pass1) {
    if (pass1.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  validator_pass2(String pass2) {
    if (pass2.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  void register() async {
    if (pass1C.value != pass2C.value) {
      Get.defaultDialog(
          title: "Error",
          middleText: "Password Tidak Sesuai",
          textConfirm: "Confirm",
          onConfirm: () {
            userNameC.text = "";
            emailC.text = "";
            pass1C.text = "";
            Get.back();
            Get.back();
          });
      return null;
    } else {
      try {
        GotrueSessionResponse res =
            await client.auth.signUp(emailC.text, pass2C.text);

        print(res.data);
        if (res.error == null) {
          await client.from("tbl_user").insert({
            "email": client.auth.currentUser!.email,
            "username": userNameC.text,
            "created_at": DateTime.now().toIso8601String(),
            "user_id": client.auth.currentUser!.id,
          }).execute();

          Get.defaultDialog(
              title: "Attantion",
              middleText: "Silahkan Cek Email Anda",
              textConfirm: "Confirm",
              onConfirm: () {
                userNameC.text = "";
                emailC.text = "";
                pass1C.text = "";
                Get.back();
                Get.back();
              });
        } else {
          print("register gagal");
        }
      } catch (err) {
        print(err);
      }
    }
  }

  @override
  void onInit() {
    // Simulating obtaining the user name from some local storage
    super.onInit();
  }

  @override
  void onClose() {
    userNameC.dispose();
    emailC.dispose();
    pass1C.dispose();
    pass2C.dispose();
    super.onClose();
  }
}
