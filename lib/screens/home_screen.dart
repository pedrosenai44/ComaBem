// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:comabem/screens/restaurant_details_screen.dart'; // Mude 'comabem' se necessário
import 'package:comabem/screens/welcome_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> restaurantes = const [
    {'nome': 'Sabor Divino', 'tipo': 'Comida Brasileira', 'imagem': 'restaurante1.jfif'},
    {'nome': 'La Pasteria', 'tipo': 'Comida Italiana', 'imagem': 'restaurante2.jfif'},
    {'nome': 'Sushi House', 'tipo': 'Comida Japonesa', 'imagem': 'restaurante3.jfif'},
    {'nome': 'El Mexicano', 'tipo': 'Comida Mexicana', 'imagem': 'restaurante4.jfif'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurantes'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sair',
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                    (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: restaurantes.length,
        itemBuilder: (context, index) {
          final restaurante = restaurantes[index];
          final ranking = index + 1;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  '$ranking',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(restaurante['nome']!),
              subtitle: Text(restaurante['tipo']!),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RestaurantDetailsScreen(
                      restaurante: restaurante,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

