// app_header.dart
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      child: Center(
        child: Image.asset(
          'assets/escribo.png',
          height: 100.0,
        ),
      ),
    );
  }
}
