import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:products_youtube/logic/controllers/login_controller.dart';
import 'package:products_youtube/routes/routes.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
              child: Form(
            key: controller.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller.emailController,
                  validator: (v) {
                    return controller.validateEmail(v!);
                  },
                  onSaved: (v) {
                    controller.email = v!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "email",
                    prefixIcon: const Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.passwordController,
                  validator: (v) {
                    return controller.validatePssword(v!);
                  },
                  onSaved: (v) {
                    controller.password = v!;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "password",
                    prefixIcon: const Icon(Icons.password),
                  ),
                ),
                const SizedBox(height: 10),
                // ignore: unrelated_type_equality_checks
                Obx(
                  () => controller.isLoding == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text(""),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      controller.go();
                    },
                    child: const Text("Login")),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () => Get.toNamed(AppRoutes.register),
                  child: const Text(
                    "register",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
