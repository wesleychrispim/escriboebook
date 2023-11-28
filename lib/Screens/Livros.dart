// livros_screen.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../bottom_navigation.dart'; // Importe o menu inferior
import 'Favoritos.dart';

class LivrosScreen extends StatefulWidget {
  @override
  _LivrosScreenState createState() => _LivrosScreenState();
}

class _LivrosScreenState extends State<LivrosScreen> {
  List<dynamic> livros = [];
  int currentPage = 0;
  List<bool> favoritos = [];

  @override
  void initState() {
    super.initState();
    carregarLivros();
  }

  Future<void> carregarLivros() async {
    final response =
    await http.get(Uri.parse('https://escribo.com/books.json'));

    if (response.statusCode == 200) {
      setState(() {
        livros = json.decode(response.body);
        favoritos = List.generate(livros.length, (index) => false);
      });
    } else {
      throw Exception('Falha ao carregar os livros');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Livros'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: livros.length,
              controller: PageController(viewportFraction: 0.8),
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                if (index >= 0 && index < livros.length) {
                  return Card(
                    color: const Color(0xFF1b9dff),
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1b9dff),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 3 / 4,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    livros[index]['cover_url'] ??
                                        'URL_PADRAO_SE_NULO',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 8.0,
                                  right: 8.0,
                                  child: IconButton(
                                    icon: Icon(
                                      favoritos[index]
                                          ? Icons.bookmark
                                          : Icons.bookmark_border,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (index >= 0 &&
                                            index < favoritos.length) {
                                          favoritos[index] = !favoritos[index];
                                        }
                                      });

                                      if (favoritos[index]) {

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                FavoritosScreen(
                                                  favoritos: livros
                                                      .where((livro) =>
                                                  favoritos[livros
                                                      .indexOf(livro)])
                                                      .toList(),
                                                ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              livros[index]['title'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Text(livros[index]['author'],
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Card(
                    child: Text('Índice fora dos limites'),
                  );
                }
              },
            ),
          ),
          BottomNavigation(
            selectedIcon: Icons.book,
            onIconSelected: (icon) {

            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LivrosScreen(),
  ));
}
