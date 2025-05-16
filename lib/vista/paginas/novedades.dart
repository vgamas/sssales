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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          primary: Colors.amber,
          secondary: Colors.amberAccent,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
          elevation: 4,
        ),
      ),
      home: const HomeNovedades(),
    );
  }
}

class Producto {
  final String id;
  final String nombre;
  final String descripcion;
  final double precio;
  final String imagen;
  final bool esNuevo;
  final double rating;

  const Producto({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.imagen,
    this.esNuevo = true,
    this.rating = 0.0,
  });
}

class HomeNovedades extends StatelessWidget {
  const HomeNovedades({super.key});

  // Lista de productos nuevos (simulados)
  final List<Producto> productosNuevos = const [
    Producto(
      id: '1',
      nombre: 'Cuaderno Ecológico',
      descripcion: 'Cuaderno con papel reciclado, 200 hojas',
      precio: 12.99,
      imagen: 'assets/cuaderno.jpg',
      esNuevo: true,
      rating: 4.5,
    ),
    Producto(
      id: '2',
      nombre: 'Set de Bolígrafos Gel',
      descripcion: 'Pack de 6 bolígrafos gel de colores',
      precio: 8.50,
      imagen: 'assets/boligrafos.jpg',
      esNuevo: true,
      rating: 4.2,
    ),
    Producto(
      id: '3',
      nombre: 'Agenda 2024 Profesional',
      descripcion: 'Agenda semanal con cubierta de cuero',
      precio: 24.99,
      imagen: 'assets/agenda.jpg',
      esNuevo: true,
      rating: 4.8,
    ),
    Producto(
      id: '4',
      nombre: 'Kit Manualidades Premium',
      descripcion: 'Incluye tijeras, pegamentos y accesorios',
      precio: 18.75,
      imagen: 'assets/manualidades.jpg',
      esNuevo: true,
      rating: 4.3,
    ),
    Producto(
      id: '5',
      nombre: 'Mochila con USB',
      descripcion: 'Mochila escolar con puerto USB integrado',
      precio: 39.99,
      imagen: 'assets/mochila.jpg',
      esNuevo: true,
      rating: 4.7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Parametros.nombreTienda),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Acción de búsqueda
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Acción de filtro
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Novedades',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[800],
                  ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: productosNuevos.length,
              itemBuilder: (context, index) {
                return _buildProductoCard(context, productosNuevos[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home, size: 30, color: Colors.white),
              onPressed: () {
                // Navegar a inicio
              },
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart, size: 30, color: Colors.white),
              onPressed: () {
                // Navegar al carrito
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite, size: 30, color: Colors.white),
              onPressed: () {
                // Navegar a favoritos
              },
            ),
            IconButton(
              icon: const Icon(Icons.person, size: 30, color: Colors.white),
              onPressed: () {
                // Navegar a perfil
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductoCard(BuildContext context, Producto producto) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          _mostrarDetalleProducto(context, producto);
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del producto (placeholder por ahora)
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.amber[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.image, size: 50, color: Colors.amber),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          producto.nombre,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (producto.esNuevo)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'NUEVO',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      producto.descripcion,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(
                          ' ${producto.rating}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[800],
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '\$${producto.precio.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarDetalleProducto(BuildContext context, Producto producto) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.amber[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.image, size: 80, color: Colors.amber),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                producto.nombre,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '\$${producto.precio.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber[800],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text('${producto.rating}'),
                  const SizedBox(width: 16),
                  if (producto.esNuevo)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'NUEVO',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Descripción:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                producto.descripcion,
                style: const TextStyle(fontSize: 16),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Añadir al carrito
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${producto.nombre} añadido al carrito'),
                        backgroundColor: Colors.amber,
                      ),
                    );
                  },
                  child: const Text(
                    'Añadir al carrito',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}