import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_youtube/views/widgets/product_card_widget.dart';


class ProductsDetails extends GetView {
  const ProductsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/6,
      child: Scaffold(
        body: Center(
          child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  child: const ProductCard(
                      name: "name", price: "price", time: "time", category: "category"
                  ),
                ),
        ),
            ));
          }
}
