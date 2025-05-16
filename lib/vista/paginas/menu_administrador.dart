import 'package:flutter/material.dart';
import 'package:sssales/vista/paginas/adminproducto.dart';
import 'package:sssales/vista/paginas/create_page.dart';
import 'package:sssales/vista/paginas/edit_page.dart';
import 'package:sssales/vista/paginas/verpagina.dart';
import 'categorias.dart';
import 'crearcliente.dart';
import 'consultarcliente.dart';

void main() {
  runApp(const AdminApp());
}

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SSales Admin',
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
      home: const AdminHomePage(),
      routes: {
        '/admin-products': (context) => const AdminProductApp(),
        '/admin-categories': (context) => const MyApp(),
        '/create-client': (context) => const CreateClientPage(),
        '/view-client': (context) => const ViewClientPage(),
        '/create-product': (context) => const CreateProductPage(),
        '/edit-product': (context) => EditProductPage(
              productData: {
                'id': '',
                'name': '',
                'description': '',
                'status': true,
              },
            ),
        '/view-product': (context) => ViewProductPage(
              productData: {
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

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Administración SSales'),
        backgroundColor: Colors.orange.shade800,
        foregroundColor: Colors.white,
      ),
      drawer: _buildDrawer(context),
      body: _buildBody(context),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange.shade800,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.person, size: 30),
                ),
                SizedBox(height: 10),
                Text(
                  'Administrador',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'admin@ssales.com',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            context,
            'Dashboard',
            Icons.dashboard,
            () {},
          ),
          _buildDrawerSectionTitle('Gestión de Productos'),
          _buildDrawerItem(
            context,
            'Productos',
            Icons.shopping_basket,
            () => Navigator.pushNamed(context, '/admin-products'),
          ),
          _buildDrawerItem(
            context,
            'Categorías',
            Icons.category,
            () => Navigator.pushNamed(context, '/admin-categories'),
          ),
          _buildDrawerSectionTitle('Gestión de Clientes'),
          _buildDrawerItem(
            context,
            'Clientes',
            Icons.people,
            () => Navigator.pushNamed(context, '/view-client'),
          ),
          _buildDrawerItem(
            context,
            'Crear Cliente',
            Icons.person_add,
            () => Navigator.pushNamed(context, '/create-client'),
          ),
          _buildDrawerSectionTitle('Configuración'),
          _buildDrawerItem(
            context,
            'Ajustes',
            Icons.settings,
            () {},
          ),
          _buildDrawerItem(
            context,
            'Cerrar Sesión',
            Icons.logout,
            () {},
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.orange.shade800,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange.shade600),
      title: Text(title),
      onTap: onTap,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Bienvenido, Administrador',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.5,
            children: [
              _buildAdminCard(
                context,
                'Productos',
                Icons.shopping_basket,
                Colors.orange.shade800,
                () => Navigator.pushNamed(context, '/admin-products'),
              ),
              _buildAdminCard(
                context,
                'Categorías',
                Icons.category,
                Colors.orange.shade600,
                () => Navigator.pushNamed(context, '/admin-categories'),
              ),
              _buildAdminCard(
                context,
                'Clientes',
                Icons.people,
                Colors.orange.shade400,
                () => Navigator.pushNamed(context, '/view-client'),
              ),
              _buildAdminCard(
                context,
                'Estadísticas',
                Icons.bar_chart,
                Colors.orange.shade300,
                () {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Acciones rápidas',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildQuickAction(
                'Crear Producto',
                Icons.add,
                () => Navigator.pushNamed(context, '/create-product'),
              ),
              _buildQuickAction(
                'Crear Cliente',
                Icons.person_add,
                () => Navigator.pushNamed(context, '/create-client'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAdminCard(
      BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.9),
                color.withOpacity(0.7),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAction(String title, IconData icon, VoidCallback onTap) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange.shade50,
        foregroundColor: Colors.orange.shade800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(title),
        ],
      ),
    );
  }
}