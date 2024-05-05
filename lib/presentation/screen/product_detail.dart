import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shop/entities/product.dart';
import 'package:shop/presentation/elements/buttons/floating_cart.dart';
import 'package:shop/presentation/elements/texts/medium_text.dart';
import 'package:shop/presentation/elements/texts/price_text.dart';
import 'package:shop/presentation/elements/texts/small_text.dart';
import 'package:shop/presentation/elements/texts/text_title.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductDisplay product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.black87,
        title: const Text(
          "Product Detail",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 350,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50 , 10 ,50 ,10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: MediumText(title: product.name!)),
                        const SizedBox(
                          width: 30,
                        ),
                        TextTitle(
                          title: "${product.price.toString()} \$",
                          color: Color.fromARGB(255, 153, 33, 33),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
