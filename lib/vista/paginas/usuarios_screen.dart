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
      home: const UsuariosScreen(),
    ),
  );
}

class UsuariosScreen extends StatefulWidget {
  const UsuariosScreen({super.key});

  @override
  State<UsuariosScreen> createState() => _UsuariosScreenState();
}

class _UsuariosScreenState extends State<UsuariosScreen> {
  // Datos de ejemplo
  List<Map<String, dynamic>> usuarios = [
    {
      'Id': 1,
      'Usuario': 'admin',
      'Celular': '3001234567',
      'Correo': 'admin@sssales.com',
      'Contrasena': '123456',
      'id_rol': 1,
      'Estado': 'Activo',
      'Codigo': 'USER-001'
    },
    {
      'Id': 2,
      'Usuario': 'vendedor1',
      'Celular': '3109876543',
      'Correo': 'vendedor@sssales.com',
      'Contrasena': '78901',
      'id_rol': 2,
      'Estado': 'Activo',
      'Codigo': 'USER-002'
    },
  ];

  // Controladores para el formulario
  final _formKey = GlobalKey<FormState>();
  final _usuarioController = TextEditingController();
  final _celularController = TextEditingController();
  final _correoController = TextEditingController();
  final _contrasenaController = TextEditingController();
  int _idRol = 1;
  String _estado = 'Activo';

  @override
  void dispose() {
    _usuarioController.dispose();
    _celularController.dispose();
    _correoController.dispose();
    _contrasenaController.dispose();
    super.dispose();
  }

  void _mostrarFormulario() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange[50],
        title: Text(
          'Nuevo Usuario',
          style: TextStyle(color: Colors.orange[800]),
        ),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _usuarioController,
                  decoration: InputDecoration(
                    labelText: 'Usuario',
                    filled: true,
                    fillColor: Colors.amber[50],
                  ),
                  validator: (value) => value!.isEmpty ? 'Requerido' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _celularController,
                  decoration: InputDecoration(
                    labelText: 'Celular',
                    filled: true,
                    fillColor: Colors.amber[50],
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) => value!.isEmpty ? 'Requerido' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _correoController,
                  decoration: InputDecoration(
                    labelText: 'Correo',
                    filled: true,
                    fillColor: Colors.amber[50],
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value!.isEmpty || !value.contains('@') 
                    ? 'Correo inválido' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _contrasenaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    filled: true,
                    fillColor: Colors.amber[50],
                  ),
                  validator: (value) => value!.isEmpty ? 'Requerido' : null,
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<int>(
                  value: _idRol,
                  items: const [
                    DropdownMenuItem(value: 1, child: Text('Administrador')),
                    DropdownMenuItem(value: 2, child: Text('Vendedor')),
                    DropdownMenuItem(value: 3, child: Text('Cliente')),
                  ],
                  onChanged: (value) => setState(() => _idRol = value!),
                  decoration: InputDecoration(
                    labelText: 'Rol',
                    filled: true,
                    fillColor: Colors.amber[50],
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _estado,
                  items: const [
                    DropdownMenuItem(value: 'Activo', child: Text('Activo')),
                    DropdownMenuItem(value: 'Inactivo', child: Text('Inactivo')),
                    DropdownMenuItem(value: 'Bloqueado', child: Text('Bloqueado')),
                  ],
                  onChanged: (value) => setState(() => _estado = value!),
                  decoration: InputDecoration(
                    labelText: 'Estado',
                    filled: true,
                    fillColor: Colors.amber[50],
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: _agregarUsuario,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
            ),
            child: const Text('Guardar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _agregarUsuario() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        usuarios.add({
          'Id': usuarios.isNotEmpty ? usuarios.last['Id'] + 1 : 1,
          'Usuario': _usuarioController.text,
          'Celular': _celularController.text,
          'Correo': _correoController.text,
          'Contrasena': _contrasenaController.text,
          'id_rol': _idRol,
          'Estado': _estado,
          'Codigo': 'USER-${(usuarios.length + 1).toString().padLeft(3, '0')}',
        });
      });

      // Limpiar campos
      _usuarioController.clear();
      _celularController.clear();
      _correoController.clear();
      _contrasenaController.clear();
      _idRol = 1;
      _estado = 'Activo';

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Text('Gestión de Usuarios'),
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
        itemCount: usuarios.length,
        itemBuilder: (context, index) {
          final user = usuarios[index];
          return Card(
            color: Colors.amber[50],
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange[100],
                        child: Text(user['Id'].toString()),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user['Usuario'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.orange[800],
                              ),
                            ),
                            Text(
                              user['Correo'],
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Chip(
                        label: Text(user['Estado']),
                        backgroundColor: user['Estado'] == 'Activo' 
                          ? Colors.green[100] 
                          : Colors.red[100],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildInfoRow('Código:', user['Codigo']),
                  _buildInfoRow('Celular:', user['Celular']),
                  _buildInfoRow('Rol:', _getRolName(user['id_rol'])),
                ],
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

  String _getRolName(int idRol) {
    switch(idRol) {
      case 1: return 'Administrador';
      case 2: return 'Vendedor';
      case 3: return 'Cliente';
      default: return 'Desconocido';
    }
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.orange[800],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}