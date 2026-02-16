import 'package:flutter/material.dart';
import '../api/api_client.dart';
import 'clients_screen.dart';
import 'lawyers_screen.dart';
import 'requests_screen.dart';
import 'services_screen.dart';
import 'provided_services_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  final ApiClient api;
  const HomeScreen({super.key, required this.api});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  late final pages = [
    ClientsScreen(api: widget.api),
    LawyersScreen(api: widget.api),
    RequestsScreen(api: widget.api),
    ServicesScreen(api: widget.api),
    ProvidedServicesScreen(api: widget.api),
  ];

  void logout() {
    widget.api.logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Главная'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: logout,
            tooltip: 'Выйти',
          )
        ],
      ),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Клиент'),
          BottomNavigationBarItem(icon: Icon(Icons.gavel), label: 'Юристы'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Заявления'),
          BottomNavigationBarItem(icon: Icon(Icons.miscellaneous_services), label: 'Услуги'),
          BottomNavigationBarItem(icon: Icon(Icons.done_all), label: 'Оказано'),
        ],
      ),
    );
  }
}
