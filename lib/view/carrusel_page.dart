import 'package:doctorapp/controller/carrusel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarruselPage extends StatelessWidget {
  CarruselPage({super.key});

  final controller = Get.put(CarruselController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrusel')),
      body: Obx(
        () => controller.loading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.carruseles.isEmpty
                ? const Center(child: Text('No hay carruseles disponibles'))
                : ListView.builder(
                    itemCount: controller.carruseles.length,
                    itemBuilder: (context, index) {
                      final carrusel = controller.carruseles[index];
                      return ListTile(
                        leading: Image.network(carrusel.src),
                        title: Text('Carrusel ${carrusel.id}'),
                      );
                    },
                  ),
      ),
    );
  }
}