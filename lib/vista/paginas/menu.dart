import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true, // Habilita Material 3
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange, // Color principal
          brightness: Brightness.light, // Tema claro
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('SSales', style: TextStyle(color: Colors.white)),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar productos...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    suffixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.orange, // Usa el color primario del tema
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconSection('Explorar', Icons.explore, Colors.blueAccent),
                _buildIconSection('Products', Icons.shopping_basket, Colors.brown),
                _buildIconSection('Especiales', Icons.star, Colors.orange),
                _buildIconSection('Otros', Icons.more_horiz, Colors.black),
              ],
            ),
            const SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconSection('Puntos', Icons.more_vert, Colors.black),
                _buildIconSection('Super Ofertas', Icons.local_offer, Colors.red),
                _buildIconSection('Liquidacion', Icons.assignment, Colors.purple),
                _buildIconSection('Categorias', Icons.category_sharp, Colors.green),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.orange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildFooterItem('Inicio', Icons.home, Colors.white),
            _buildFooterItem('Comprar', Icons.shopping_cart, Colors.white),
            _buildFooterItem('Cesta', Icons.shopping_basket, Colors.white),
            _buildFooterItem('Mi Cuenta', Icons.account_circle, Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildIconSection(String title, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, size: 40, color: color),
        const SizedBox(height: 8),
        Text(title, style: TextStyle(color: color)),
      ],
    );
  }

  Widget _buildFooterItem(String title, IconData icon, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 24, color: color),
        const SizedBox(height: 4),
        Text(title, style: TextStyle(color: color, fontSize: 12)),
      ],
    );
  }
}