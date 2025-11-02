// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'home_screen.dart'; // Importa a tela principal

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usamos um Container para aplicar o degradê no fundo
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.white], // Mesmo degradê da tela de boas-vindas
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        // SafeArea garante que o conteúdo não fique sob a barra de status
        child: SafeArea(
          // SingleChildScrollView permite que a tela role se o teclado aparecer
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 1. Logo "ComaBem"
                  const Text(
                    'ComaBem',
                    style: TextStyle(
                      fontFamily: 'Serif',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [Shadow(blurRadius: 10.0, color: Colors.black45)],
                    ),
                  ),
                  const SizedBox(height: 60),

                  // 2. Título da Seção de Login
                  const Text(
                    'Faça seu Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // 3. Campo de Email
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined, color: Colors.grey[600]),
                      filled: true, // Habilita o preenchimento de cor
                      fillColor: Colors.white.withOpacity(0.8), // Cor de fundo semi-transparente
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none, // Sem borda visível
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),

                  // 4. Campo de Senha estilizado
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[600]),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    obscureText: true, // Esconde a senha
                  ),
                  const SizedBox(height: 40),

                  // 5. Botão de Login
                  SizedBox(
                    width: double.infinity, // Faz o botão ocupar a largura máxima
                    child: ElevatedButton(
                      onPressed: () {
                        // Ação do botão: navegar para a tela principal
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const HomeScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue, // Cor do texto e ícone do botão
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'ENTRAR',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  // Botão para voltar
                  TextButton(
                    onPressed: () {
                      // Ação para voltar para a tela anterior
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Voltar',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
