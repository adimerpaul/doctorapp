import 'package:doctorapp/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

Future<void> main() async {

  const bool isProduction = bool.fromEnvironment('dart.vm.product');
  await dotenv.load(fileName: isProduction ? ".env.production" : ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Color(0xFF00b0bd),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: GetMaterialApp(
        title: 'doctorapp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainScreen()
        // debugShowCheckedModeBanner: false,
      ),
    );
  }
}
