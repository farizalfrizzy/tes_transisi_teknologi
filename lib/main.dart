import 'package:flutter/material.dart';
import 'package:tes_transisi/view/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List Karyawan',
      theme: ThemeData(),
      home: const SplashView(),
    );
  }
}
