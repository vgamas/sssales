import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Papelería Creativa - Proveedores',
      debugShowCheckedModeBanner:false ,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.orange,
          accentColor: Colors.amber,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
        ),
      ),
      home: const ProveedoresScreen(),
    );
  }
}

class ProveedoresScreen extends StatefulWidget {
  const ProveedoresScreen({super.key});

  @override
  State<ProveedoresScreen> createState() => _ProveedoresScreenState();
}

class _ProveedoresScreenState extends State<ProveedoresScreen> {
  final List<Proveedor> proveedores = [
    Proveedor(
      id: '1',
      nombre: 'Distribuidora Papelera S.A.',
      contacto: 'Juan Pérez',
      telefono: '5551234567',
      celular: '5559876543',
      codigo: 'PAP001',
    ),
    Proveedor(
      id: '2',
      nombre: 'Creativos Unidos',
      contacto: 'María García',
      telefono: '5557654321',
      celular: '5551239876',
      codigo: 'CRT002',
    ),
  ];

  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nombreController = TextEditingController();
  final _contactoController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _celularController = TextEditingController();
  final _codigoController = TextEditingController();

  bool _isEditing = false;
  String _editingId = '';

  @override
  void dispose() {
    _idController.dispose();
    _nombreController.dispose();
    _contactoController.dispose();
    _telefonoController.dispose();
    _celularController.dispose();
    _codigoController.dispose();
    super.dispose();
  }

  void _agregarProveedor() {
    if (_formKey.currentState!.validate()) {
      final nuevoProveedor = Proveedor(
        id: _idController.text,
        nombre: _nombreController.text,
        contacto: _contactoController.text,
        telefono: _telefonoController.text,
        celular: _celularController.text,
        codigo: _codigoController.text,
      );

      setState(() {
        if (_isEditing) {
          final index = proveedores.indexWhere((p) => p.id == _editingId);
          proveedores[index] = nuevoProveedor;
          _isEditing = false;
          _editingId = '';
        } else {
          proveedores.add(nuevoProveedor);
        }
        _limpiarFormulario();
      });
    }
  }

  void _editarProveedor(Proveedor proveedor) {
    setState(() {
      _isEditing = true;
      _editingId = proveedor.id;
      _idController.text = proveedor.id;
      _nombreController.text = proveedor.nombre;
      _contactoController.text = proveedor.contacto;
      _telefonoController.text = proveedor.telefono;
      _celularController.text = proveedor.celular;
      _codigoController.text = proveedor.codigo;
    });
  }

  void _eliminarProveedor(String id) {
    setState(() {
      proveedores.removeWhere((proveedor) => proveedor.id == id);
    });
  }

  void _limpiarFormulario() {
    _formKey.currentState?.reset();
    _idController.clear();
    _nombreController.clear();
    _contactoController.clear();
    _telefonoController.clear();
    _celularController.clear();
    _codigoController.clear();
    _isEditing = false;
    _editingId = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Proveedores'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _limpiarFormulario,
            tooltip: 'Limpiar formulario',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: Colors.amber[50],
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _idController,
                        decoration: const InputDecoration(
                          labelText: 'ID',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.numbers, color: Colors.orange),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese el ID';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _nombreController,
                        decoration: const InputDecoration(
                          labelText: 'Nombre del Proveedor',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.business, color: Colors.orange),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese el nombre';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _contactoController,
                        decoration: const InputDecoration(
                          labelText: 'Persona de Contacto',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person, color: Colors.orange),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _telefonoController,
                        decoration: const InputDecoration(
                          labelText: 'Teléfono',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone, color: Colors.orange),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _celularController,
                        decoration: const InputDecoration(
                          labelText: 'Celular',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone_android, color: Colors.orange),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _codigoController,
                        decoration: const InputDecoration(
                          labelText: 'Código',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.code, color: Colors.orange),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: _agregarProveedor,
                        child: Text(_isEditing ? 'Actualizar Proveedor' : 'Agregar Proveedor'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Lista de Proveedores',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: proveedores.length,
              itemBuilder: (context, index) {
                final proveedor = proveedores[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  color: Colors.orange[50],
                  child: ListTile(
                    title: Text(
                      proveedor.nombre,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Contacto: ${proveedor.contacto}'),
                        Text('Tel: ${proveedor.telefono} | Cel: ${proveedor.celular}'),
                        Text('Código: ${proveedor.codigo}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.orange),
                          onPressed: () => _editarProveedor(proveedor),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _eliminarProveedor(proveedor.id),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Proveedor {
  final String id;
  final String nombre;
  final String contacto;
  final String telefono;
  final String celular;
  final String codigo;

  Proveedor({
    required this.id,
    required this.nombre,
    required this.contacto,
    required this.telefono,
    required this.celular,
    required this.codigo,
  });
}