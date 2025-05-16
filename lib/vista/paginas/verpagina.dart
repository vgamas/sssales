import 'package:flutter/material.dart';
import 'edit_page.dart';


class ViewProductPage extends StatelessWidget {
  final Map<String, dynamic> productData;
  
  const ViewProductPage({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Producto'),
        backgroundColor: Colors.orange.shade800,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProductPage(productData: productData),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contenido de la vista (igual que en tu código original)
            // ...
            
            const SizedBox(height: 24),
            // Botones de acción
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProductPage(productData: productData),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade800,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Editar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final newStatus = !(productData['status'] ?? true);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Producto ${newStatus ? 'activado' : 'desactivado'}',
                          ),
                          backgroundColor: newStatus ? Colors.green : Colors.amber,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: (productData['status'] ?? true) 
                          ? Colors.red.shade800 
                          : Colors.green.shade800,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      (productData['status'] ?? true) ? 'Desactivar' : 'Activar',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.orange.shade50,
        child: Center(
          child: Text(
            'Sistema de Administración de Productos',
            style: TextStyle(
              color: Colors.orange.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}