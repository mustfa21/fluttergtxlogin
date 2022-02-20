import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class InsertProductsView extends GetView {
  InsertProductsView({Key? key}) : super(key: key);
  final productsFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
              child: Form(
                key: productsFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: null,
                      validator: (v) {},
                      onSaved: (v) {},
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "name",
                        prefixIcon: const Icon(Icons.article_outlined),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: null,
                      validator: (v) {},
                      onSaved: (v) {},
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "price",
                        prefixIcon: const Icon(Icons.monetization_on),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: null,
                      validator: (v) {},
                      onSaved: (v) {},
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "category_id",
                        prefixIcon: const Icon(Icons.category),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text("Register"))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
