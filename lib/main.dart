// import 'package:doctorapp/view/carrusel_page.dart';
import 'package:doctorapp/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

Future<void> main() async {

  const bool isProduction = bool.fromEnvironment('dart.vm.product');
  await dotenv.load(fileName: isProduction ? ".env.production" : ".env");

  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Color(0xFF00b0bd), // tu color principal
  //     statusBarIconBrightness: Brightness.light, // iconos blancos
  //     statusBarBrightness: Brightness.light, // barra de estado clara
  //     systemNavigationBarColor: Color(0xFF00b0bd), // color de la barra de navegación
  //   ),
  // );

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
        home: HomePage()
        // debugShowCheckedModeBanner: false,
      ),
    );
  }
}
