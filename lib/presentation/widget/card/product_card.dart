import 'package:flutter/material.dart';
import 'package:shop/entities/product.dart';
import 'package:shop/presentation/elements/texts/price_text.dart';
import 'package:shop/presentation/elements/texts/small_text.dart';

typedef ProductCardTap = Function(ProductDisplay product);

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, this.onTap});

  final ProductDisplay product;
  final double width = 200;
  final double height = 220;
  final ProductCardTap? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(onTap != null){
          onTap!(product);
        }
      },
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Image.network(
              product.imageUrl,
              width: width,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                const Spacer(),
                Container(
                  color: Color(0x80000000),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallText(
                          title: product.name.length > 10
                              ? '${product.name.substring(0, 10)}...'
                              : product.name,
                          color: Colors.white,
                        ),
                        PriceText(
                          title: '${product.price} \$',
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
