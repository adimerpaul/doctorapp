import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00b0bd),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text("Iniciar sesión", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset('assets/images/login_icon.png', height: 160),
            const SizedBox(height: 30),
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Obx(() => TextField(
              controller: controller.passwordController,
              obscureText: controller.showPassword.value,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: const UnderlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.showPassword.value ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    controller.showPassword.toggle(); // temporal para mostrar/ocultar
                  },
                ),
              ),
            )),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text("¿Olvidaste tu contraseña?", style: TextStyle(color: Colors.grey)),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF00b0bd), Color(0xFF01d8c9)],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Obx(() => ElevatedButton(
                onPressed: controller.loading.value ? null : controller.loginUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: controller.loading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Iniciar sesión", style: TextStyle(fontSize: 16, color: Color(0xFFf8f8f8))),
              )),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("¿No tienes una cuenta? "),
                GestureDetector(
                  onTap: () {
                    // acción para registro
                  },
                  child: const Text("Regístrate", style: TextStyle(color: Colors.orange)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {}, // Google login
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text("Continuar con Google"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
