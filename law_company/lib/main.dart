import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Юридическая фирма',
      theme: ThemeData(useMaterial3: true),
      home: const LoginScreen(),
    );
  }
}
