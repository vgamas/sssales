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
      home: const Menuprincipal(),
    );
  }
}

class Menuprincipal extends StatelessWidget {
  const Menuprincipal({super.key});

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
                    hintText: 'Buscar ...',
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text(
                'Menú SSales',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.explore, color: Colors.amber),
              title: const Text('Explorar'),
              onTap: () {
                // Acción al tocar Explorar
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_basket, color: Colors.amber),
              title: const Text('Productos'),
              onTap: () {
                // Acción al tocar Products
              },
            ),
            ListTile(
              leading: const Icon(Icons.star, color: Colors.amber),
              title: const Text('Especiales'),
              onTap: () {
                // Acción al tocar Especiales
              },
            ),
            ListTile(
              leading: const Icon(Icons.more_horiz, color: Colors.amber),
              title: const Text('Otros'),
              onTap: () {
                // Acción al tocar Otros
              },
            ),
            ListTile(
              leading: const Icon(Icons.push_pin_rounded, color: Colors.amber),
              title: const Text('Puntos'),
              onTap: () {
                // Acción al tocar Puntos
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_offer, color: Colors.amber),
              title: const Text('Super ofertas'),
              onTap: () {
                // Acción al tocar Super ofertas
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment, color: Colors.amber),
              title: const Text('Liquidacion'),
              onTap: () {
                // Acción al tocar Liquidacion
              },
            ),
            ListTile(
              leading: const Icon(Icons.category_sharp, color: Colors.amber),
              title: const Text('Categorias'),
              onTap: () {
                // Acción al tocar Categorias
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.amber),
              title: const Text('Mi Cuenta'),
              onTap: () {
                // Acción al tocar Mi Cuenta
              },
            ),
          ],
        ),
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
                _buildIconSection('Productos', Icons.shopping_basket, Colors.brown),
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
