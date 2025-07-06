import 'package:flutter/material.dart';

class CitasPage extends StatelessWidget {
  const CitasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Citas'),
        backgroundColor: const Color(0xFF00b0bd),
      ),
      body: Center(
        child: Text(
          'Aquí van las citas',
          style: TextStyle(fontSize: 24, color: Colors.black87),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción al presionar el botón
        },
        backgroundColor: const Color(0xFF00b0bd),
        child: const Icon(Icons.add),
      ),
    );
  }
}
