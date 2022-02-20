import 'package:get/get.dart';
import 'package:products_youtube/logic/controllers/auth_controller.dart';
import 'package:products_youtube/logic/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => AuthController());
  }
}
