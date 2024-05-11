import 'package:get_it/get_it.dart';
import 'package:shop/mocks/mock_http_service.dart';
import 'package:shop/network/http/dio_service.dart';
import 'package:shop/network/http/http_service.dart';
import 'package:shop/port/product.dart';
import 'package:shop/repositories/product_repository.dart';
import 'package:shop/services/product_services.dart';

final getit = GetIt.instance;

void registerServices(){
  getit.registerSingleton<HttpService>(DioService('https://fakestoreapi.com'));
  getit.registerSingleton<IProductRepository>(ProductRepository());
  getit.registerSingleton<IProductService>(ProductService());
}