import 'package:go_router/go_router.dart';
import 'package:shop/entities/product.dart';
import 'package:shop/presentation/screen/home_screen.dart';
import 'package:shop/presentation/screen/product_detail.dart';

final router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'detail',
            builder: (context , state){
              final product = state.extra as ProductDisplay;
              return ProductDetailScreen(product: product);
            },
          )
        ]),
  ],
);
