// Favoritos.dart
import 'package:flutter/material.dart';
import '../app_header.dart'; // Importe o header
import '../bottom_navigation.dart'; // Importe o menu inferior

class FavoritosScreen extends StatelessWidget {
  final List<dynamic> favoritos;

  FavoritosScreen({required this.favoritos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Adicione o header aqui
          AppHeader(),

          Expanded(
            child: ListView.builder(
              itemCount: favoritos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoritos[index]['title']),
                  subtitle: Text(favoritos[index]['author']),
                  // Adicione mais informações conforme necessário
                );
              },
            ),
          ),

          // Adicione o menu inferior aqui
          BottomNavigation(
            selectedIcon: Icons.favorite, // Certifique-se de ajustar conforme necessário
            onIconSelected: (icon) {
              // Lógica para tratar a seleção de ícones, se necessário
            },
          ),
        ],
      ),
    );
  }
}
