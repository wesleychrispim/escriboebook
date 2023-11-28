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

          AppHeader(),

          Expanded(
            child: ListView.builder(
              itemCount: favoritos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoritos[index]['title']),
                  subtitle: Text(favoritos[index]['author']),

                );
              },
            ),
          ),


          BottomNavigation(
            selectedIcon: Icons.favorite,
            onIconSelected: (icon) {

            },
          ),
        ],
      ),
    );
  }
}
