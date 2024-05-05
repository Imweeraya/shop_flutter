
import 'package:shop/entities/product.dart';
import 'package:shop/port/product.dart';

class ProductService extends IProductService {
  ProductService(this.repository);
  
  final IProductRepository repository;

  @override
  Future<List<ProductDisplay>> getByCategory(String category) async {
    final rawProducts = await repository.getByCategory(category);
    return rawProducts.map((product) => ProductDisplay(id: product.id.toString(), category: product.category!, name: product.title!, imageUrl: product.image!, price: product.price!.toDouble())).toList();
  }
  
  @override
  Future<List<String>> getCategories() async{
    final catagories = await repository.getCatagories();
    return catagories;
  }

}