import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shop/di/get_it.dart';
import 'package:shop/entities/product.dart';
import 'package:shop/mocks/products.dart';
import 'package:shop/port/product.dart';
import 'package:shop/presentation/widget/appbar/home_appbar.dart';
import 'package:shop/presentation/widget/jumbutton/home_jumbutton.dart';
import 'package:shop/presentation/widget/loading_indicator/loading.dart';
import 'package:shop/presentation/widget/section/catalog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final IProductService service;

  List<List<ProductDisplay>> products = [];
  List<String> categories = [];

  bool isloading = false;

  // _HomePageState() {
  //   final http = DioService('https://fakestoreapi.com');
  //   final repo = ProductRepository(http);
  //   service = ProductService(repo);

  //   getProducts();
  // }

  @override
  void initState() {
    super.initState();
    isloading = true;
    service = getit.get<IProductService>();
    getProducts();
  }

  void getProducts() async {
    final categories = await service.getCatagories();
    final productsFetchers = categories.map((e) => service.getByCategory(e));
    final products = await Future.wait(productsFetchers);

    setState(() {
      this.categories = categories;
      this.products = products;
      isloading = false;
    });
  }

  void onSelectProduct(ProductDisplay product) {
    print(product.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const HomeAppBar(),
            isloading
                ? const Expanded(
                    child: Center(child: Loading()),
                  )
                : Expanded(
                    child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          HomeJumButton(
                              url: categoryImages[categories[index]]!,
                              title: categories[index].toUpperCase(),
                              buttonTitle: 'ViewCollection'),
                          Catalog(
                              title: 'All products', products: products[index] , onSelectProduct: onSelectProduct,),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      );
                    },
                  )),
          ],
        ),
      ),
    );
  }
}
