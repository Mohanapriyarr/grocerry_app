import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:gropto_app/app/routes/app_pages.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(GetMaterialApp(
    title: 'Gropto',
    initialRoute: AppPages.INITIAL,
    theme: ThemeData.light(),
    getPages: AppPages.route,
    debugShowCheckedModeBanner: false,
  ));
  FlutterNativeSplash.remove();
}
