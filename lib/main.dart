import 'package:flutter/material.dart';
import 'package:template/core/config/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      initialRoute: home,
      routes: routes,
    );
  }
}
