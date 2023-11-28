import 'package:flutter/material.dart';
import 'package:escribo/screens/Livros.dart';
import 'package:escribo/Screens/Favoritos.dart';

class BottomNavigation extends StatelessWidget {
  final IconData selectedIcon;
  final ValueChanged<IconData> onIconSelected;

  BottomNavigation({
    required this.selectedIcon,
    required this.onIconSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFF1B9DFF), // Cor do fundo do menu
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIconButton(Icons.book, 'Livros', context),
          _buildIconButton(Icons.favorite, 'Favoritos', context),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label, BuildContext context) {
    Color iconColor = selectedIcon == icon ? Color(0xFF93D64B) : Colors.white;
    FontWeight fontWeight = selectedIcon == icon ? FontWeight.bold : FontWeight.normal;

    return GestureDetector(
      onTap: () {
        onIconSelected(icon);
        if (icon == Icons.book) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LivrosScreen()),
          );
        } else if (icon == Icons.favorite) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FavoritosScreen(favoritos: [],)),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: selectedIcon == icon ? 30.0 : 24.0,
            color: iconColor,
          ),
          Text(
            label,
            style: TextStyle(
              color: iconColor,
              fontWeight: fontWeight,
              fontFamily: 'Nunito', //
            ),
          ),
        ],
      ),
    );
  }
}
