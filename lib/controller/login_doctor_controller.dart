import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller.dart';
import '../../model/user_model.dart';
import '../../service/databasehelper.dart';
import '../addons/scaffold.dart';

class LoginDoctorController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var loading = false.obs;
  var showPassword = true.obs;

  @override
  void onInit() {
    super.onInit();
    emailController.text = 'mahajan@gmail.com'; // Por defecto para pruebas
    passwordController.text = '123456';
  }

  Future<void> loginDoctor() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      errorScaffold(Get.context!, 'Por favor, completa ambos campos');
      return;
    }

    loading(true);
    final db = Databasehelper();
    final UserModel? user = await db.loginUser(email, password);
    loading(false);

    if (user != null) {
      if (user.role?.toLowerCase() == 'doctor') {
        final authController = Get.find<AuthController>();
        authController.setUser(user);

        successScaffold(Get.context!, 'Inicio de sesión exitoso');
        Get.offAllNamed('/home');
      } else {
        errorScaffold(Get.context!, 'El usuario no tiene permiso de doctor');
      }
    } else {
      errorScaffold(Get.context!, 'Credenciales incorrectas');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
