import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/presentation/widget/appbar/home_menubar.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  void onSelectMenu(String path) {
    context.go(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeMenubar(selectMenu: onSelectMenu),
    );
  }
}
