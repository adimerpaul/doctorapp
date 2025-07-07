import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../service/databasehelper.dart';
import '../addons/scaffold.dart'; // si tienes el successScaffold/errorScaffold ahí

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var loading = false.obs;
  var showPassword = true.obs;

  @override
  void onInit() {
    super.onInit();
    emailController.text = 'admin@gmail.com';
    passwordController.text = '123456';
  }

  Future<void> loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      errorScaffold(Get.context!, 'Por favor, completa ambos campos');
      return;
    }

    loading(true);
    final db = Databasehelper();
    final success = await db.loginUser(email, password);
    loading(false);

    if (success) {
      successScaffold(Get.context!, 'Inicio de sesión exitoso');
      Get.offAllNamed('/home');
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
