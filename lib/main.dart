import 'package:flutter/material.dart';
import 'package:pas_mobiledev/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "PAS Semester 1 Flutter",
      initialRoute: Routes.login,
      getPages: Routes.myPages,
    );
  }
}
