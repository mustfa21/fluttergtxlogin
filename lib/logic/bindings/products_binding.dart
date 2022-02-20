import 'package:get/get.dart';
import 'package:products_youtube/logic/controllers/auth_controller.dart';
import 'package:products_youtube/logic/controllers/post_controller.dart';
import 'package:products_youtube/logic/controllers/register_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostsController());
    Get.lazyPut(() => AuthController());
  }
}
