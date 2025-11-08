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

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            clipBehavior: Clip.antiAlias,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RestaurantDetailsScreen(
                      restaurante: restaurante,
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/${restaurante['imagem']!}',
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurante['nome']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          restaurante['tipo']!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
