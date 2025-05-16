import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          primary: Colors.orange,
          secondary: Colors.amber,
        ),
      ),
      home: const RolesScreen(),
    ),
  );
}

class RolesScreen extends StatefulWidget {
  const RolesScreen({super.key});

  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  // Datos de ejemplo
  List<Map<String, dynamic>> roles = [
    {'Id': 1, 'nombre': 'Administrador', 'Codigo': 'ROL-001'},
    {'Id': 2, 'nombre': 'Vendedor', 'Codigo': 'ROL-002'},
    {'Id': 3, 'nombre': 'Cliente', 'Codigo': 'ROL-003'},
  ];

  // Controladores para el formulario
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }

  void _mostrarFormulario() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange[50],
        title: Text(
          'Nuevo Rol',
          style: TextStyle(color: Colors.orange[800]),
        ),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre del Rol',
                  filled: true,
                  fillColor: Colors.amber[50],
                ),
                validator: (value) => value!.isEmpty ? 'Requerido' : null,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: _agregarRol,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
            ),
            child: const Text('Guardar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _agregarRol() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        roles.add({
          'Id': roles.isNotEmpty ? roles.last['Id'] + 1 : 1,
          'nombre': _nombreController.text,
          'Codigo': 'ROL-${(roles.length + 1).toString().padLeft(3, '0')}',
        });
      });

      _nombreController.clear();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Text('Gestión de Roles'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Funcionalidad de búsqueda
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: roles.length,
        itemBuilder: (context, index) {
          final rol = roles[index];
          return Card(
            color: Colors.amber[50],
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange[100],
                child: Text(rol['Id'].toString()),
              ),
              title: Text(
                rol['nombre'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
              ),
              subtitle: Text(rol['Codigo']),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  _mostrarOpcionesRol(context, rol['Id']);
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarFormulario,
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _mostrarOpcionesRol(BuildContext context, int idRol) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.orange[50],
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.amber),
              title: const Text('Editar Rol'),
              onTap: () {
                Navigator.pop(context);
                _editarRol(idRol);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text('Eliminar Rol'),
              onTap: () {
                Navigator.pop(context);
                _eliminarRol(idRol);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _editarRol(int idRol) {
    final rol = roles.firstWhere((r) => r['Id'] == idRol);
    _nombreController.text = rol['nombre'];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange[50],
        title: Text(
          'Editar Rol',
          style: TextStyle(color: Colors.orange[800]),
        ),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre del Rol',
                  filled: true,
                  fillColor: Colors.amber[50],
                ),
                validator: (value) => value!.isEmpty ? 'Requerido' : null,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  final index = roles.indexWhere((r) => r['Id'] == idRol);
                  roles[index]['nombre'] = _nombreController.text;
                });
                _nombreController.clear();
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
            ),
            child: const Text('Guardar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _eliminarRol(int idRol) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange[50],
        title: Text(
          'Eliminar Rol',
          style: TextStyle(color: Colors.orange[800]),
        ),
        content: const Text('¿Estás seguro de eliminar este rol?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                roles.removeWhere((r) => r['Id'] == idRol);
              });
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Eliminar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}