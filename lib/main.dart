import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:four_deals_app/Pages/splash_page.dart';
import 'package:get/get.dart';

// testing
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Color(0xFFEAEAEA),
  ));
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(),
  ));
}

// hello
