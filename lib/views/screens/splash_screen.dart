import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_youtube/logic/controllers/auth_controller.dart';
import 'package:products_youtube/routes/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  AuthController authController = Get.find();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      if (authController.isAuth()) {
        Get.offAndToNamed(AppRoutes.products);
      } else {
        Get.toNamed(AppRoutes.login);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.lightBlueAccent,
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "مرحبا بكم",
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: 30,
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
