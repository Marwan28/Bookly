import 'package:bookly/core/constants.dart';
import 'package:bookly/features/splash/presentation/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookly',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: SplashScreen(),
    );
  }
}



