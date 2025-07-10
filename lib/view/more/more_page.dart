import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller.dart';

class MorePage extends StatelessWidget {
  MorePage({super.key});

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More'),
        backgroundColor: const Color(0xFF00b0bd),
      ),
      body: Column(
        children: [
          Obx(() {
            final user = authController.currentUser.value;

            return Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF00b0bd),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: (user != null && user.avatarUrl.isNotEmpty)
                        ? NetworkImage(user.avatarUrl)
                        : const AssetImage('assets/images/default_avatar.png'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.name ?? 'Nombre de Usuario',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          user?.email ?? '',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // TODO: acción editar perfil
                    },
                    icon: const Icon(Icons.edit, color: Colors.white),
                  )
                ],
              ),
            );
          }),

          const SizedBox(height: 20),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                _buildListTile("Specialist", Icons.medical_services, () {}),
                _buildListTile("About", Icons.info_outline, () {}),
                _buildListTile("Term & Conditions", Icons.description, () {}),
                _buildListTile("Report Issues", Icons.report_problem, () {}),
                _buildListTile("Logout", Icons.logout, () async {
                  await authController.logout();
                  Get.offAllNamed('/home');
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black54),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onTap,
        ),
        const Divider(height: 1),
      ],
    );
  }
}
