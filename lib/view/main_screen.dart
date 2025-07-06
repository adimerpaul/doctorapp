import 'package:doctorapp/view/chat/chat_page.dart';
import 'package:doctorapp/view/citas/citas_page.dart';
import 'package:doctorapp/view/login/login_doctor_page.dart';
import 'package:doctorapp/view/more/more_page.dart';
import 'package:flutter/material.dart';
import 'home/home_page.dart'; // Tu vista actual
// import 'appointment_page.dart'; // Crea una página simple
// import 'doctor_login_page.dart'; // Igual
// import 'recent_chats_page.dart';
// import 'more_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    CitasPage(),
    LoginDoctorPage(),
    ChatPage(),
    MorePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF00b0bd),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Citas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Doctor login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Mas',
          ),
        ],
      ),
    );
  }
}
