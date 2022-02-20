
import 'dart:convert';

ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));
String productModelToJson(ProductsModel product) => json.encode(product.toJson());

class ProductsModel {
  List<Product> data;

  ProductsModel({required this.data});

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      ProductsModel(
          data: List<Product>.from(json['data'].map((p) => Product.fromJson(p))),
      );

  Map<String, dynamic> toJson() => {
    "data" : List<Product>.from(data.map((d) => d.toJson()))
  };
}

class Product {
  int id;
  String name;
  String price;
  String time;
  String category;

  Product({required this.id, required this.name, required this.price,
  required this.time, required this.category});

  factory Product.fromJson(Map<String, dynamic> json) =>
      Product(id: json['id'], name: json['name'], price: json['price'],
          time: json['time'], category: json['category']);

  Map<String, dynamic> toJson() => {
    "id" : id,
    "name" : name,
    "price" : price,
    "time" : time,
    "category" : category,
  };


}

































/*
import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  List<Product> data;

  ProductModel({
    required this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Product {

  int id;
  String name;
  String price;
  String time;
  String category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.time,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    time: json["time"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "time": time,
    "category": category,
  };
}
*/
