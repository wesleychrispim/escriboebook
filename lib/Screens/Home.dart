import 'package:flutter/material.dart';
import '../bottom_navigation.dart';
import '../app_header.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IconData selectedIcon = Icons.book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppHeader(),
          Expanded(
            child: Center(
              child: Text(
                'Conteúdo da Tela Principal Aqui',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIcon: selectedIcon,
        onIconSelected: (icon) {
          _onIconSelected(icon, context);
        },
      ),
    );
  }

  void _onIconSelected(IconData icon, BuildContext context) {
    setState(() {
      selectedIcon = icon;
    });


  }
}
