import 'package:flutter/material.dart';
import 'package:shop/entities/product.dart';
import 'package:shop/presentation/widget/card/product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key , required this.products});
  final List<ProductDisplay> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16,);
        },
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context , index){
          return ProductCard(product: products[index]);
      }),
    );
  }
}