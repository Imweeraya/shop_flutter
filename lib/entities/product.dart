import 'dart:collection';
import 'dart:ffi';

class ProductDisplay {
  String id;
  String category;
  String name;
  String? description;
  String imageUrl;
  double price;

  ProductDisplay(
      {required this.id,
      required this.category,
      required this.name,
      this.description,
      required this.imageUrl,
      required this.price});
}
