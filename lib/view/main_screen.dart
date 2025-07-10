import 'package:doctorapp/controller/auth_controller.dart';
import 'package:doctorapp/view/chat/chat_page.dart';
import 'package:doctorapp/view/citas/citas_page.dart';
import 'package:doctorapp/view/doctor/doctor_appointments_page.dart';
import 'package:doctorapp/view/doctor/edit_doctor_profile_page.dart';
import 'package:doctorapp/view/home/doctor_home_page.dart';
import 'package:doctorapp/view/login/login_doctor_page.dart';
import 'package:doctorapp/view/more/more_page.dart';
import 'package:flutter/material.dart';
import 'home/home_page.dart'; // Tu vista actual
// import 'appointment_page.dart'; // Crea una página simple
// import 'doctor_login_page.dart'; // Igual
// import 'recent_chats_page.dart';
// import 'more_page.dart';
import 'package:get/get.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final isDoctor = authController.currentUser.value?.role?.toLowerCase() == 'doctor';

    final List<Widget> doctorPages = [
      DoctorHomePage(),
      DoctorAppointmentsPage(),
      EditDoctorProfilePage(),
      ChatPage(),
      MorePage(),
    ];

    final List<Widget> patientPages = [
      HomePage(),
      CitasPage(),
      LoginDoctorPage(), // o perfil paciente
      ChatPage(),
      MorePage(),
    ];

    final List<BottomNavigationBarItem> doctorMenu = const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
      BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Citas'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
      BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Más'),
    ];

    final List<BottomNavigationBarItem> patientMenu = const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Citas'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Doctor login'),
      BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chats'),
      BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Más'),
    ];

    final currentPages = isDoctor ? doctorPages : patientPages;
    final currentMenu = isDoctor ? doctorMenu : patientMenu;

    return Scaffold(
      body: currentPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF00b0bd),
        unselectedItemColor: Colors.grey,
        items: currentMenu,
      ),
    );
  }
}

