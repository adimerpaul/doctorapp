import 'package:doctorapp/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
// import '../../addons/scaffold.dart';
import '../../model/doctor_model.dart';
import '../login/login_screen.dart';

class DetailDoctor extends StatelessWidget {
  final Doctor doctor;

  DetailDoctor({super.key, required this.doctor});
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeeeeee),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00b0bd),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Detalle del doctor",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    // shadowColor: const Color.fromRGBO(0, 0, 0, 0.1),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            doctor.avatar,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctor.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                doctor.especialidad?.nombre ?? '',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: const [
                                  Icon(Icons.star, color: Colors.orange, size: 16),
                                  Icon(Icons.star, color: Colors.orange, size: 16),
                                  Icon(Icons.star_border, size: 16),
                                  Icon(Icons.star_border, size: 16),
                                  Icon(Icons.star_border, size: 16),
                                  SizedBox(width: 6),
                                  Text(
                                    "(2 reseñas)",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    // shadowColor: const Color.fromRGBO(0, 0, 0, 0.1),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _sectionTitle("Número de teléfono"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                doctor.celular,
                                style: const TextStyle(fontSize: 16),
                              ),
                              // CircleAvatar(
                              //   backgroundColor: Colors.orange.shade300,
                              //   child: const Icon(Icons.phone, color: Colors.white),
                              // ),
                              InkWell(
                                onTap: () async {
                                  final url = 'tel:${doctor.celular}';
                                  // if (await canLaunchUrl(Uri.parse(url))) {
                                    await launchUrl(Uri.parse(url));
                                  // } else {
                                  //   error(context, "No se pudo realizar la llamada");
                                  // }
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.orange.shade300,
                                  child: const Icon(Icons.phone, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 12),
                          _sectionTitle("Acerca del doctor"),
                          _textContent(doctor.acerca),
                          const SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _sectionTitle("Dirección"),
                                    Text(
                                      doctor.direccion,
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    const SizedBox(height: 12),
                                    _sectionTitle("Horario de atención"),
                                    Text(
                                      doctor.horasDeTrabajo,
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _sectionTitle("Ubicación"),
                                    InkWell(
                                      onTap: () async {
                                        final url = Uri.parse(
                                          'https://www.google.com/maps/search/?api=1&query=${doctor.lat},${doctor.lng}',
                                        );
                                        await launchUrl(url, mode: LaunchMode.externalApplication);
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          'assets/images/map_icon.png',
                                          height: 100,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          _sectionTitle("Servicios"),
                          _textContent(doctor.servicio),
                          const SizedBox(height: 12),
                          _sectionTitle("Cuidado de la salud"),
                          _textContent(doctor.cuidado),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Botón inferior
          // Container(
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [Color(0xFF00b0bd), Color(0xFF01d8c9)],
          //     ),
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(28),
          //       topRight: Radius.circular(28),
          //     ),
          //   ),
          //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "\$${doctor.tarifa.toStringAsFixed(0)}",
          //         style: const TextStyle(
          //           color: Colors.white,
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       ElevatedButton(
          //         onPressed: () {
          //           // Get.to(() => const LoginScreen(),)
          //           //   transition: Transition.rightToLeft,
          //           //   duration: const Duration(milliseconds: 300),
          //           // );
          //           Get.to(() => LoginScreen(),
          //             transition: Transition.rightToLeft,
          //             duration: const Duration(milliseconds: 300),
          //           );
          //         },
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: Colors.white,
          //           foregroundColor: const Color(0xFF00b0bd),
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(20),
          //           ),
          //         ),
          //         child: const Text("Iniciar sesión para agendar"),
          //       ),
          //     ],
          //   ),
          // ),
          Obx(() => Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00b0bd), Color(0xFF01d8c9)],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${doctor.tarifa.toStringAsFixed(0)}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                authController.isLoggedIn.value
                    ? TextButton(
                  onPressed: () {
                    // TODO: acción para agendar cita
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF00b0bd),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Agendar"),
                )
                    : ElevatedButton(
                  onPressed: () {
                    Get.to(() => LoginScreen(),
                      transition: Transition.rightToLeft,
                      duration: const Duration(milliseconds: 300),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF00b0bd),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Iniciar sesión para agendar"),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _sectionTitle(String titulo) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        titulo,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _textContent(String contenido) {
    return Text(
      contenido,
      style: const TextStyle(
        fontSize: 13,
        height: 1.0, // menor separación entre líneas
        color: Colors.black45,
      ),
    );
  }
}
