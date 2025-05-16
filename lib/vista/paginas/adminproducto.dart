import 'package:flutter/material.dart';
import 'package:sssales/vista/paginas/create_page.dart';
import 'package:sssales/vista/paginas/edit_page.dart';
import 'package:sssales/vista/paginas/home_productos.dart';
import 'package:sssales/vista/paginas/verpagina.dart';


void main() {
  runApp(const AdminProductApp());
}

class AdminProductApp extends StatelessWidget {
  const AdminProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Productos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
          primary: Colors.orange.shade800,
          secondary: Colors.orange.shade600,
          tertiary: Colors.orange.shade400,
        ),
        useMaterial3: true,
      ),
      home: const ProductHomePage(), 
      routes: {
        '/create-product': (context) => const CreateProductPage(),
        '/edit-product': (context) => EditProductPage(
              productData: {
                // Datos por defecto para evitar errores
                'id': '',
                'name': '',
                'description': '',
                'status': true,
              },
            ),
        '/view-product': (context) => ViewProductPage(
              productData: {
                // Datos por defecto para evitar errores
                'id': '',
                'name': '',
                'description': '',
                'status': true,
              },
            ),
      },
    );
  }
}