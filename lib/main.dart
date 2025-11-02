// lib/main.dart
import 'package:flutter/material.dart';
// Importa a tela de boas-vindas, que é a tela inicial correta.
import 'package:comabem/screens/welcome_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ComaBem App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // A tela inicial ('home') está definida para a WelcomeScreen, que é o correto.
      home: const WelcomeScreen(),
    );
  }
}
