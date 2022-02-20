import 'package:get/get.dart';
import 'package:products_youtube/logic/controllers/auth_controller.dart';
import 'package:products_youtube/logic/controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => AuthController());
  }
}
