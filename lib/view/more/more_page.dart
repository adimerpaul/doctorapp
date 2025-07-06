import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More'),
        backgroundColor: const Color(0xFF00b0bd),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'More Options',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Aquí iría la lógica para más opciones
                },
                style: ElevatedButton.styleFrom(
                  // primary: const Color(0xFF00b0bd), // Color del botón
                ),
                child: const Text('Explore More'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
