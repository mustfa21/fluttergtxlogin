import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_youtube/database/services/auth_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:products_youtube/routes/routes.dart';

class LoginController extends GetxController {
  var isLoding = false.obs;
  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  String email = "", password = "";
  final storage = const FlutterSecureStorage();

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "this is wrong email";
    } else {
      return null;
    }
  }

  String? validatePssword(String value) {
    if (value.length <= 6) {
      return "this password not good";
    } else {
      return null;
    }
  }

  go() async {
    bool isValidate = loginFormKey.currentState!.validate();
    if (isValidate) {
      isLoding.value = true;

      try {
        var data1 = await AuthServices.login(
            email: emailController.text, password: passwordController.text);
        if (data1 != null) {
          await storage.write(key: 'name', value: data1.data.name);
          await storage.write(key: 'token', value: data1.data.token);
          loginFormKey.currentState!.save();
          Get.toNamed(AppRoutes.products);
        } else {
          Get.snackbar("login", "ooops login fild");
        }
      } finally {
        isLoding.value = false;
      }
    }
  }
}
