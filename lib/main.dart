import 'package:flutter/material.dart';
import 'package:shop/di/get_it.dart';
import 'package:shop/presentation/screen/home_screen.dart';
import 'package:shop/router/go_router.dart';

void main() {
  registerServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.black,
          useMaterial3: true, 
          fontFamily: 'Ubuntu'
        ),
        routerConfig: router,);
  }
}
