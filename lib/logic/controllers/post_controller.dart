// ignore_for_file: deprecated_member_use

import 'package:get/get.dart';
import 'package:products_youtube/database/models/post_model.dart';
import 'package:products_youtube/database/services/post_services.dart';

class PostsController extends GetxController {
  var isLoading = true.obs;
  // ignore: prefer_collection_literals
  var postList = List.empty().obs;
  // ignore: deprecated_member_use

  @override
  void onInit() {
    get();
    super.onInit();
  }

  void get() async {
    try {
      var data = await PostServices.getPost();
      if (data != null) {
        postList.value = data;
        print(postList[0].id);
      }
    } catch (e) {
      return Get.snackbar("title", "$e");
    } finally {
      isLoading.value = false;
    }
  }
}
