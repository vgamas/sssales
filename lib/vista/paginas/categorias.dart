import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.orange,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
        ),
      ),
      home: const HomeScreen(),
      routes: {
        '/papeleria': (context) => const CategoryScreen(title: 'Papelería Básica'),
        '/escritura': (context) => const CategoryScreen(title: 'Escritura y Dibujo'),
        '/manualidades': (context) => const CategoryScreen(title: 'Manualidades'),
        '/planificacion': (context) => const CategoryScreen(title: 'Planificación'),
        '/decoracion': (context) => const CategoryScreen(title: 'Decoración'),
        '/proyectos': (context) => const CategoryScreen(title: 'Proyectos'),
        '/regalos': (context) => const CategoryScreen(title: 'Regalos'),
        '/temporada': (context) => const CategoryScreen(title: 'Temporada'),
        '/ecologica': (context) => const CategoryScreen(title: 'Ecológica'),
        '/arteDigital': (context) => const CategoryScreen(title: 'Arte Digital'),
      },
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
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
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
                  Text("Seleccionado para ti", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Novedades", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
              ),
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                return _buildCategoryCard(context, categorias[index]);
              },
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Más vendidos", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange[100],
                      border: Border.all(color: Colors.orange),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 30),
                        const SizedBox(height: 8),
                        Text("Producto ${index + 1}", style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Comprar"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: "Cesta"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Mi Cuenta"),
        ],
        onTap: (index) {
          // Navegación del BottomNavigationBar
          if (index == 1) {
            Navigator.pushNamed(context, '/comprar');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/cesta');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/cuenta');
          }
        },
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, Categoria categoria) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          // Navegación a la pantalla de categoría correspondiente
          switch (categoria.titulo) {
            case "Papelería básica":
              Navigator.pushNamed(context, '/papeleria');
              break;
            case "Escritura y dibujo":
              Navigator.pushNamed(context, '/escritura');
              break;
            case "Manualidades":
              Navigator.pushNamed(context, '/manualidades');
              break;
            case "Planificación":
              Navigator.pushNamed(context, '/planificacion');
              break;
            case "Decoración":
              Navigator.pushNamed(context, '/decoracion');
              break;
            case "Proyectos":
              Navigator.pushNamed(context, '/proyectos');
              break;
            case "Regalos":
              Navigator.pushNamed(context, '/regalos');
              break;
            case "Temporada":
              Navigator.pushNamed(context, '/temporada');
              break;
            case "Ecológica":
              Navigator.pushNamed(context, '/ecologica');
              break;
            case "Arte digital":
              Navigator.pushNamed(context, '/arteDigital');
              break;
          }
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.orange[50]!,
                Colors.orange[100]!,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(categoria.icon, size: 40, color: Colors.orange[800]),
              const SizedBox(height: 10),
              Text(
                categoria.titulo,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[900],
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  categoria.descripcion,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  final String title;

  const CategoryScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.category, size: 80, color: Colors.orange),
            const SizedBox(height: 20),
            Text(
              'Contenido de $title',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}

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