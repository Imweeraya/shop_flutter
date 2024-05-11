import 'package:shop/di/get_it.dart';
import 'package:shop/models/product.dart';
import 'package:shop/network/http/http_service.dart';
import 'package:shop/port/product.dart';

class ProductRepository implements IProductRepository {

   final HttpService httpService = getit.get<HttpService>();

  @override
  Future<List<Product>> getByCategory(String category) async {
    final response = await httpService.get('/products/category/$category');
    List<Product> products = [];
    for(dynamic res in response) {
      products.add(Product.fromJson(res));
    }
    return products;
  }

  @override
  Future<List<String>> getCatagories() async {
    final response = await httpService.get('/products/categories');
    return (response as List<dynamic>).map((e) => e.toString()).toList();
  }
}
