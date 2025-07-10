import 'package:flutter/material.dart';

class EditDoctorProfilePage extends StatelessWidget {
  const EditDoctorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Editar Perfil',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF00b0bd),
      ),
    );
  }
}
