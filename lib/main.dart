import 'package:aserar/constants.dart';
import 'package:aserar/controller/api_controller.dart';
import 'package:aserar/themes/themes.dart';
import 'package:aserar/view/home/homes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Constants.colors['homeScreen']['topsearchbarColor'],
    statusBarIconBrightness: Brightness.dark, // status bar color
  ));
  Get.put<ApiController>(ApiController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aserar',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Color(0xffFAFCFE),
      ),
      // theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      home: Homes(),
    );
  }
}
