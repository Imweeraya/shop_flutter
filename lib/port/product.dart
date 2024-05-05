
import 'package:shop/entities/product.dart';
import 'package:shop/models/product.dart';

abstract class IProductRepository {
  Future<List<Product>> getByCategory(String category);

  Future<List<String>> getCatagories();
}

abstract class IProductService {
  Future<List<ProductDisplay>> getByCategory(String category);

  Future<List<String>> getCategories();
}