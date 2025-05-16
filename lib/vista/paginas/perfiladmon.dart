import 'package:flutter/material.dart';

void main() {
  runApp(const AdminApp());
}

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Clientes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
          // Colores adicionales de Material 3
          primary: const Color.fromARGB(255, 233, 145, 30),
          secondary: const Color.fromARGB(255, 229, 159, 30),
          tertiary: const Color.fromARGB(255, 245, 173, 66),
        ),
        useMaterial3: true,
      ),
      home: const AdminHomePage(),
      routes: {
        '/create': (context) => const CreateClientPage(),
        '/edit': (context) => const EditClientPage(),
        '/view': (context) => const ViewClientPage(),
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
        title: const Text('Administración de Clientes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Acción de búsqueda
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Sección de búsqueda (como en la imagen)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        'Consultar cliente',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Nombre',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Correo',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Teléfono',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Estado cliente',
                          border: OutlineInputBorder(),
                        ),
                        items: ['Activo', 'Inactivo', 'Potencial']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: () {
                          // Acción de búsqueda
                        },
                        child: const Text('Buscar'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Botones de acciones principales
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildActionButton(
                    context,
                    Icons.person_add,
                    'Crear cliente',
                    '/create',
                    Colors.green,
                  ),
                  _buildActionButton(
                    context,
                    Icons.edit,
                    'Editar cliente',
                    '/edit',
                    Colors.blue,
                  ),
                  _buildActionButton(
                    context,
                    Icons.search,
                    'Consultar cliente',
                    '/view',
                    Colors.orange,
                  ),
                  _buildActionButton(
                    context,
                    Icons.delete,
                    'Eliminar cliente',
                    null,
                    Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    IconData icon,
    String label,
    String? route,
    Color color,
  ) {
    return Card(
      color: color.withOpacity(0.1),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: route != null
            ? () {
                Navigator.pushNamed(context, route);
              }
            : () {
                // Acción para eliminar
                _showDeleteDialog(context);
              },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar cliente'),
        content: const Text('¿Está seguro que desea eliminar este cliente?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              // Lógica para eliminar
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cliente eliminado')),
              );
            },
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }
}

class CreateClientPage extends StatelessWidget {
  const CreateClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Cliente'),
      ),
      body: const Center(
        child: Text('Página para crear cliente'),
      ),
    );
  }
}

class EditClientPage extends StatelessWidget {
  const EditClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Cliente'),
      ),
      body: const Center(
        child: Text('Página para editar cliente'),
      ),
    );
  }
}

class ViewClientPage extends StatelessWidget {
  const ViewClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ver Cliente'),
      ),
      body: const Center(
        child: Text('Página para ver cliente'),
      ),
    );
  }
}