import 'package:flutter/material.dart';

void main() {
  runApp(const ProductosPapeleriaApp());
}

class ProductosPapeleriaApp extends StatelessWidget {
  const ProductosPapeleriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      title: 'Papelería Creativa',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.light,
        ),
      ),
      home: const ProductInfoScreen(),
    );
  }
}

class ProductInfoScreen extends StatefulWidget {
  const ProductInfoScreen({super.key});

  @override
  State<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  // Datos de ejemplo para el producto
  final Map<String, dynamic> producto = {
    'Id': 'PAP-001',
    'Nombre': 'Cuaderno Creativo A5',
    'Descripcion': 'Cuaderno de 100 hojas con diseño exclusivo, papel de 90g ideal para acuarela',
    'Codigo': 'CUA-2023-05',
    'id_Categoria': 'CUADERNOS',
    'Id_Provedor': 'PROV-123',
    'Fecha_Creacion': '2023-05-15',
    'Stock_Minimo': 10,
    'Existencia': 25,
    'Cantidad_Reservada': 5,
    'Url_Imagen': 'https://example.com/cuaderno.jpg',
    'Precio_Compra': 8.50,
    'Precio_Venta': 15.99,
    'Iva_Venta': 0.12,
    'Popularidad': 4.5,
    'Destacado': true,
    'Estado': 'Activo',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información del Producto'),
        backgroundColor: Colors.orange[800],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del producto
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.amber[100],
                  borderRadius: BorderRadius.circular(10),
                  image: producto['Url_Imagen'] != null
                      ? DecorationImage(
                          image: NetworkImage(producto['Url_Imagen']),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: producto['Url_Imagen'] == null
                    ? const Icon(Icons.image, size: 50, color: Colors.orange)
                    : null,
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Nombre y código
            Row(
              children: [
                Expanded(
                  child: Text(
                    producto['Nombre'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
                Chip(
                  backgroundColor: Colors.amber[100],
                  label: Text(
                    producto['Codigo'],
                    style: const TextStyle(color: Colors.deepOrange),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 10),
            
            // Precio y IVA
            Row(
              children: [
                Text(
                  '\$${producto['Precio_Venta'].toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'IVA: ${(producto['Iva_Venta'] * 100).toStringAsFixed(0)}%',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.orange[800],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            
            // Descripción
            Card(
              color: Colors.amber[50],
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Descripción:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(producto['Descripcion']),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Sección de información detallada
            const Text(
              'Detalles del Producto:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            
            const SizedBox(height: 10),
            
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _buildDetailItem('Categoría', producto['id_Categoria']),
                _buildDetailItem('Proveedor', producto['Id_Provedor']),
                _buildDetailItem('Fecha Creación', producto['Fecha_Creacion']),
                _buildDetailItem('Stock Mínimo', producto['Stock_Minimo'].toString()),
                _buildDetailItem('Existencia', producto['Existencia'].toString()),
                _buildDetailItem('Reservados', producto['Cantidad_Reservada'].toString()),
                _buildDetailItem('Precio Compra', '\$${producto['Precio_Compra'].toStringAsFixed(2)}'),
                _buildDetailItem('Popularidad', '${producto['Popularidad']}/5'),
              ],
            ),
            
            const SizedBox(height: 20),
            
            // Estado y destacado
            Row(
              children: [
                Chip(
                  backgroundColor: producto['Estado'] == 'Activo' 
                      ? Colors.green[100] 
                      : Colors.red[100],
                  label: Text(
                    producto['Estado'],
                    style: TextStyle(
                      color: producto['Estado'] == 'Activo' 
                          ? Colors.green[800] 
                          : Colors.red[800],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                if (producto['Destacado'])
                  Chip(
                    backgroundColor: Colors.amber[100],
                    label: const Text(
                      'Destacado',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
              ],
            ),
            
            const SizedBox(height: 30),
            
            // Botones de acción
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text('Editar', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[700],
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  onPressed: () {
                    // Acción para editar
                  },
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.inventory, color: Colors.white),
                  label: const Text('Inventario', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[700],
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  onPressed: () {
                    // Acción para inventario
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.orange[800],
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}