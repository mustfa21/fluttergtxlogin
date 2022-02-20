import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_youtube/logic/controllers/auth_controller.dart';
import 'package:products_youtube/logic/controllers/post_controller.dart';
import 'package:products_youtube/routes/routes.dart';
import 'package:products_youtube/views/widgets/product_card_widget.dart';

class ProductsView extends GetView {
  ProductsView({Key? key}) : super(key: key);
  final AuthController authController = Get.find();
  @override
  final PostsController postsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          appBar: AppBar(),
          drawer: Drawer(
            child: Container(
                child: Column(
              children: [
                ElevatedButton(
                    onPressed: () => authController.logout(),
                    child: Text("logout"))
              ],
            )),
          ),
          body: Obx(() {
            if (postsController.isLoading.value) {
              return Container(
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: postsController.postList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(
                          postsController.postList[index].title.toString()));
                },
              );
            }
          })),
    );
  }
}
