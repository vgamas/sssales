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
          seedColor: Colors.orange, // Color semilla naranja
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
    final colorScheme = Theme.of(context).colorScheme; // Obtén el esquema de colores

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar cuenta', style: TextStyle(color: Colors.white)),
        backgroundColor: colorScheme.primary, // Color primario (naranja)
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Colombia', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('Articular', style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 20),
            // Card del producto
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Nombre producto', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    const Text('COP 25,325.12', style: TextStyle(fontSize: 16, color: Colors.green)),
                    const SizedBox(height: 10),
                    const Text('Envio gratis', style: TextStyle(fontSize: 14, color: Colors.grey)),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Cantidad: 1', style: TextStyle(fontSize: 14)),
                        Text('Fecha: 19/02/2025', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 10),
                    const Text('Subtotal: COP 25,325.12', style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 10),
                    const Text('Ahorro: COP 391.18', style: TextStyle(fontSize: 16, color: Colors.green)),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Acción al presionar el botón de pago
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: const Text('Pagar (2)', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Resumen de la compra
            const Text('Total a pagar:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('COP 101,250.16', style: TextStyle(fontSize: 24, color: Colors.green)),
          ],
        ),
      ),
      // Footer
      bottomNavigationBar: Container(
        height: 60,
        color: colorScheme.primary, // Color primario (naranja)
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