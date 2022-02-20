import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:products_youtube/routes/routes.dart';

class AuthController extends GetxController {
  var storage = const FlutterSecureStorage();
  var name = ''.obs;
  var token = ''.obs;

  @override
  void onInit() {
    authData();
    super.onInit();
  }

  authData() async {
    try {
      name.value = (await storage.read(key: "name"))!;
      token.value = (await storage.read(key: "token"))!;
    } catch (v) {
      Get.snackbar("title", "$v");
    }
  }

  bool isAuth() {
    return token.isNotEmpty;
  }

  logout() async {
    try {
      await storage.delete(key: "token");
      await storage.delete(key: "name");
    } catch (e) {
      return Get.snackbar("title", '$e');
    } finally {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
