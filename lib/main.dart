import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shopapp/utils/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shop App',
      debugShowCheckedModeBanner: false,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeMode.light,
      getPages: Routes.getPages,
      initialRoute: Routes.initialPage,
    );
  }
}
