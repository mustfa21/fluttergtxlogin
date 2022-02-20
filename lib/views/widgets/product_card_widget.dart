import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String time;
  final String category;

  const ProductCard({Key? key, required this.name, required this.price,
    required this.time, required this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                blurRadius: 5,
                color: Colors.blueGrey
            )
          ],
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/4,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Expanded(child: Center(
                  child: Text(name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)))),
        Expanded(child: Center(
            child: Text(price, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)))),
          Expanded(child: Center(
              child: Text(time, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)))),
              Expanded(child: Center(
                  child: Text(category, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))))
            ],
          ),
        ),
      ),
    );
  }
}