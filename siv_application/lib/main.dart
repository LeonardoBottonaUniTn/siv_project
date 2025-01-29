import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:siv_application/ui/theme.dart';
import 'package:siv_application/ui/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Siv Project',
      theme: CustomTheme.theme,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
