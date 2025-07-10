import 'package:doctorapp/controller/login_doctor_controller.dart';
import 'package:doctorapp/view/home/doctor_home_page.dart';
import 'package:doctorapp/view/login/login_screen.dart';
import 'package:doctorapp/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'controller/auth_controller.dart'; // 👈 Asegúrate de importar el AuthController

Future<void> main() async {
  const bool isProduction = bool.fromEnvironment('dart.vm.product');
  await dotenv.load(fileName: isProduction ? ".env.production" : ".env");
  Get.lazyPut(() => LoginDoctorController(), fenix: true);

  // 👇 Registrar AuthController globalmente
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: const Color(0xFF00b0bd),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: GetMaterialApp(
        title: 'doctorapp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/home',
        getPages: [
          GetPage(name: '/login', page: () => LoginScreen()),
          GetPage(name: '/home', page: () => MainScreen()),
          GetPage(name: '/doctor/home', page: () => DoctorHomePage()),
        ],
        // home: MainScreen()
        // debugShowCheckedModeBanner: false,
      ),
    );
  }
}
