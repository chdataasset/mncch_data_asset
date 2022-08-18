import 'package:ch_data_asset/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool rememberme = false.obs;
  RxBool isHide = false.obs;
  RxString resultUserName = "".obs;

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  SupabaseClient client = Supabase.instance.client;

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6 || value.isEmpty) {
      return "Password Harus Diisi";
    }
    return null;
  }

  void validLogin() {
    isLoading.value = true;
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      _login();
    }

    loginFormKey.currentState!.save();
    isLoading.value = false;
  }

  void _login() async {
    isLoading.value = true;
    try {
      GotrueSessionResponse res = await client.auth
          .signIn(email: emailC.text, password: passwordC.text);
      if (res.error == null) {
        if (rememberme.isTrue) {
          //kalau dichecklist simpan data ke get storage
          final box = GetStorage();
          box.erase();
          box.write(
            "dataLogin",
            {
              "email": client.auth.currentUser!.email,
              "userUiD": client.auth.currentUser!.id,
              "password": passwordC.text,
              "rememberme": rememberme.value,
            },
          );
        }

        Get.offAndToNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
            title: "Error",
            middleText: "Error ${res.error}",
            textConfirm: "Ok",
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
    emailC = TextEditingController();
    passwordC = TextEditingController();
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}
