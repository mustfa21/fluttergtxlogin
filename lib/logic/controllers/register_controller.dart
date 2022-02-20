import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_youtube/database/services/auth_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:products_youtube/routes/routes.dart';

class RegisterController extends GetxController {
  var isLoding = false.obs;
  final registerFormKey = GlobalKey<FormState>();
  late TextEditingController nameController,
      emailController,
      passwordController;
  String name = "", email = "", password = "";
  final storage = const FlutterSecureStorage();

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
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
    bool isValidate = registerFormKey.currentState!.validate();
    if (isValidate) {
      isLoding.value = true;

      try {
        var data1 = await AuthServices.register(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text);
        if (data1 != null) {
          await storage.write(key: 'name', value: data1.data.name);
          await storage.write(key: 'token', value: data1.data.token);
          registerFormKey.currentState!.save();
          Get.toNamed(AppRoutes.products);
          Get.snackbar("register", "hi");
        } else {
          Get.snackbar("register", "ooops register fild");
        }
      } finally {
        isLoding.value = false;
      }
    }
  }
}
