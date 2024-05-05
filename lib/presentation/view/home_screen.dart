import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop/entities/product.dart';
import 'package:shop/mocks/products.dart';
import 'package:shop/network/http/dio_service.dart';
import 'package:shop/port/product.dart';
import 'package:shop/presentation/elements/buttons/primary_button.dart';
import 'package:shop/presentation/elements/texts/big_text.dart';
import 'package:shop/presentation/elements/texts/price_text.dart';
import 'package:shop/presentation/elements/texts/small_text.dart';
import 'package:shop/presentation/elements/texts/text_title.dart';
import 'package:shop/presentation/widget/card/product_card.dart';
import 'package:shop/presentation/widget/home_appbar.dart';
import 'package:shop/presentation/widget/home_jumbutton.dart';
import 'package:shop/presentation/widget/list/product_list.dart';
import 'package:shop/presentation/widget/section/catalog.dart';
import 'package:shop/repositories/product_repository.dart';
import 'package:shop/services/product_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final IProductService service;

  List<List<ProductDisplay>> products = [];
  List<String> categories = [];

  // _HomePageState() {
  //   final http = DioService('https://fakestoreapi.com');
  //   final repo = ProductRepository(http);
  //   service = ProductService(repo);

  //   getProducts();
  // }

  @override
  void initState() {
    super.initState();
    final http = DioService('https://fakestoreapi.com');
    final repo = ProductRepository(http);
    service = ProductService(repo);
    getProducts();
  }

  
  void getProducts() async {
    final categories = await service.getCategories();
    final productsFetchers = categories.map((e) => service.getByCategory(e));
    final products = await Future.wait(productsFetchers);

    setState(() {
      this.categories = categories;
      this.products = products;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const HomeAppBar(),
            Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        HomeJumButton(
                            url: categoryImages[categories[index]]!,
                            title: categories[index].toUpperCase(),
                            buttonTitle: 'ViewCollection'
                        ),
                        Catalog(title: 'All products',products: products[index]),
                        const SizedBox(height: 24,)
                      ],
                    );
                  },
                )
              ),
            // Expanded(
            //   child: ListView(
            //     children: [
            //       const HomeJumButton(
            //         url:
            //             'https://i0.wp.com/digital-photography-school.com/wp-content/uploads/2022/06/fashion-photography-tips-3.jpg?fit=1500%2C1000&ssl=1',
            //         title: "OUTERWEAR",
            //         buttonTitle: "View Collection",
            //       ),
                  
            //       Catalog(products: products, title: "Most Popular Outerwear"),
            //       const HomeJumButton(
            //         url:
            //             'https://images.unsplash.com/photo-1552223412-1a326064d46c?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            //         title: "CLOTHING",
            //         buttonTitle: "View Collection",
            //       ),
            //       Catalog(products: clothes, title: "Most Popular Dress"),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
