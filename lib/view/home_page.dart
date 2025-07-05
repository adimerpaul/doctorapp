import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctorapp/controller/carrusel_controller.dart';
import 'package:doctorapp/view/home/opcion_inicio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(CarruselController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header + Search
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF00b0bd), Color(0xFF01d8c9)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Bienvenido", style: TextStyle(color: Colors.white, fontSize: 16)),
                    const Text("User",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2)
                          )
                        ]
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Buscar por nombre del doctor",
                          prefixIcon: const Icon(Icons.search),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20)
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Carrusel
              Obx(() {
                if (controller.loading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.carruseles.isEmpty) {
                  return const Center(child: Text('No hay imágenes'));
                }

                return CarouselSlider(
                  options: CarouselOptions(
                    height: 180,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                  ),
                  items: controller.carruseles.map((item) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        item.src,
                        fit: BoxFit.cover,
                        width: size.width * 0.9,
                        errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                      ),
                    );
                  }).toList(),
                );
              }),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OpcionInicio(
                      label: "Doctores",
                      onTap: () {
                        // Acción para Perfil
                      },
                    ),
                    OpcionInicio(
                      label: "Especialidades",
                      onTap: () {
                        // Acción para Citas
                      },
                    ),
                    // /farmacia
                    OpcionInicio(
                      label: "Farmacia",
                      onTap: () {
                        // Acción para Farmacia
                      },
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
