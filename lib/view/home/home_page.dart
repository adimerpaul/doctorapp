import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctorapp/controller/carrusel_controller.dart';
import 'package:doctorapp/controller/doctor_controller.dart';
import 'package:doctorapp/service/databasehelper.dart';
import 'package:doctorapp/view/doctor/detail_doctor.dart';
import 'package:doctorapp/view/doctor/doctor_card.dart';
import 'package:doctorapp/view/home/opcion_inicio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final carruselController = Get.put(CarruselController());
  final userName = ''.obs;
  HomePage({super.key}) {
    cargarUsuario(); // cargar nombre al construir
  }
  void cargarUsuario() async {
    final db = Databasehelper();
    final user = await db.getCurrentUser();
    if (user != null) {
      userName.value = user.name;
    }
  }
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
                    Obx(() => AutoSizeText(
                      userName.value.isNotEmpty ? userName.value : 'Usuario',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      minFontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    )),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(0, 0, 0, 0.1),
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
                if (carruselController.loading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (carruselController.carruseles.isEmpty) {
                  return const Center(child: Text('No hay imágenes'));
                }

                return CarouselSlider(
                  options: CarouselOptions(
                    height: 180,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                  ),
                  items: carruselController.carruseles.map((item) {
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
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Doctores cercanos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    TextButton(
                      onPressed: () {
                        // Acción para ver todos los doctores
                      },
                      child: const Text('Ver todos', style: TextStyle(color: Color(0xFF00b0bd))),
                    ),
                  ],
                )
              ),
          Obx(() {
            final controller = Get.put(DoctorController());
            if (controller.loading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.doctores.isEmpty) {
              return const Center(child: Text('No hay doctores disponibles'));
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.doctores.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 160,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return DoctorCard(
                      doctor: controller.doctores[index],
                      onTap: () {
                        // Get.toNamed('/doctor/${controller.doctores[index].id}');
                        Get.to(() => DetailDoctor(
                          doctor: controller.doctores[index],
                        ));
                      }
                  );
                },
              ),
            );
          })
            ],
          ),
        ),
      ),
    );
  }
}
