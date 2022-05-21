import 'package:ch_data_asset/app/assets/models/tbl_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

SupabaseClient client = Supabase.instance.client;

class RegisterController extends GetxController {
  RxBool isShowHide = false.obs;
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
      return "Password Harus Diisi";
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
    isLoading.value = true;
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      _register();
    }

    registerFormKey.currentState!.save();
    isLoading.value = false;
  }

  void _register() async {
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
            middleText: "Registrasi",
            textConfirm: "Confirm",
            onConfirm: () {
              Get.back();
              Get.back();
            });
      }

      // print((Response != null) ? "ada data" : "tidak ada data");
      // var hasil = json.decode(Response.body) as Map<String, dynamic>;

      // print(hasil);
      // int value = hasil["value"];
      // if (value == 1) {
      //   Get.defaultDialog(
      //       title: "Register",
      //       middleText: "Register Berhasil Ditambahkan",
      //       onConfirm: () {
      //         Get.back();
      //         Get.back();
      //       });
      // }
    } catch (err) {
      print(err);
    }
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
