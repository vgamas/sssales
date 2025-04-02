import 'package:flutter/material.dart';
import 'package:sssales/vista/paginas/parametros.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Parametros.nombreTienda,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeNovedades(),
    );
  }
}

class HomeNovedades extends StatelessWidget {
  const HomeNovedades({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Parametros.nombreTienda),
        backgroundColor: Colors.amber, // Color ámbar para el AppBar
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Contenido Principal'),
            // Aquí puedes agregar más widgets según sea necesario
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber, // Color ámbar para el Footer
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white),
              onPressed: () {
                // Acción para el botón de inicio
              },
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                // Acción para el botón de carrito
              },
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.white),
              onPressed: () {
                // Acción para el botón de perfil
              },
            ),
          ],
        ),
      ),
    );
  }
}