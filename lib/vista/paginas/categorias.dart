import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: "Productos",
            prefixIcon: const Icon(Icons.search, color: Colors.orange),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.orange),
            ),
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.orange),
                onPressed: () {},
              ),
              const Positioned(
                right: 8,
                top: 8,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Seleccionado para ti"),
                  Text("Novedades", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            // GridView con las categorías de papelería
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Dos columnas
                childAspectRatio: 1.2, // Relación de aspecto
              ),
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                return _buildCategoryCard(categorias[index]);
              },
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Más vendidos", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Comprar"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: "Cesta"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Mi Cuenta"),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
    );
  }

  // Método para construir una tarjeta de categoría
  Widget _buildCategoryCard(Categoria categoria) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          // Acción al tocar la tarjeta
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(categoria.icon, size: 40, color: categoria.color),
            const SizedBox(height: 10),
            Text(
              categoria.titulo,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              categoria.descripcion,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Modelo de datos para las categorías
class Categoria {
  final String titulo;
  final String descripcion;
  final IconData icon;
  final Color color;

  Categoria({
    required this.titulo,
    required this.descripcion,
    required this.icon,
    required this.color,
  });
}

// Lista de categorías basada en el PDF
final List<Categoria> categorias = [
  Categoria(
    titulo: "Papelería básica",
    descripcion: "Cuadernos, libretas, hojas sueltas, carpetas",
    icon: Icons.book,
    color: Colors.blueAccent,
  ),
  Categoria(
    titulo: "Escritura y dibujo",
    descripcion: "Lápices, bolígrafos, marcadores, pinturas",
    icon: Icons.brush,
    color: Colors.green,
  ),
  Categoria(
    titulo: "Manualidades",
    descripcion: "Papeles decorativos, pegamentos, tijeras, adornos",
    icon: Icons.cut,
    color: Colors.purple,
  ),
  Categoria(
    titulo: "Planificación",
    descripcion: "Agendas, calendarios, etiquetas, stickers",
    icon: Icons.calendar_today,
    color: Colors.orange,
  ),
  Categoria(
    titulo: "Decoración",
    descripcion: "Washi tape, sellos, plantillas, troqueles",
    icon: Icons.photo,
    color: Colors.pink,
  ),
  Categoria(
    titulo: "Proyectos",
    descripcion: "Material para proyectos escolares y de oficina",
    icon: Icons.work,
    color: Colors.brown,
  ),
  Categoria(
    titulo: "Regalos",
    descripcion: "Tarjetas, papel de regalo, kits de manualidades",
    icon: Icons.card_giftcard,
    color: Colors.red,
  ),
  Categoria(
    titulo: "Temporada",
    descripcion: "Artículos para fiestas y proyectos navideños",
    icon: Icons.celebration,
    color: Colors.teal,
  ),
  Categoria(
    titulo: "Ecológica",
    descripcion: "Productos reciclados y biodegradables",
    icon: Icons.eco,
    color: Colors.lightGreen,
  ),
  Categoria(
    titulo: "Arte digital",
    descripcion: "Recursos para impresión y diseño gráfico",
    icon: Icons.computer,
    color: Colors.indigo,
  ),
];