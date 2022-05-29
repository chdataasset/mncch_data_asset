import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

SupabaseClient client = Supabase.instance.client;

class RegisterController extends GetxController {
  RxBool isShowHide = true.obs;
  RxBool isLoading = false.obs;

  TextEditingController userNameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  SupabaseClient client = Supabase.instance.client;

  String? validateName(String value) {
    if (value.length <= 0 || value.isEmpty) {
      return "Username Harus Diisi";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6 || value.isEmpty) {
      return "Password  minimal 6 karakter";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  void validRegister() {
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      _register();
    }

    registerFormKey.currentState!.save();
  }

  void _register() async {
    isLoading.value = true;
    try {
      GotrueSessionResponse res =
          await client.auth.signUp(emailC.text, passwordC.text);

      print(res.data);

      if (res.error == null) {
        await client.from("tbl_user").insert({
          "user_id": client.auth.currentUser!.id,
          "username": userNameC.text,
          "email": client.auth.currentUser!.email,
          "created_at": DateTime.now().toIso8601String(),
        }).execute();

        Get.defaultDialog(
            title: "Attantion",
            middleText: "Silahkan Cek Email Anda",
            textConfirm: "Confirm",
            onConfirm: () {
              userNameC.text = "";
              emailC.text = "";
              passwordC.text = "";
              Get.back();
              Get.back();
            });
      } else {
        Get.defaultDialog(
            title: "Attantion",
            middleText: "Registrasi Gagal",
            textConfirm: "Confirm",
            onConfirm: () {
              Get.back();
              Get.back();
            });
      }
    } catch (err) {
      Get.snackbar("Error", "${err}", duration: Duration(seconds: 2));
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    // Simulating obtaining the user name from some local storage
    super.onInit();
    userNameC = TextEditingController();
    emailC = TextEditingController();
    passwordC = TextEditingController();
  }

  @override
  void onClose() {
    userNameC.dispose();
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}
