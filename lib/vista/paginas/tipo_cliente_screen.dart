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
      home: const TipoClienteScreen(),
    ),
  );
}

class TipoClienteScreen extends StatefulWidget {
  const TipoClienteScreen({super.key});

  @override
  State<TipoClienteScreen> createState() => _TipoClienteScreenState();
}

class _TipoClienteScreenState extends State<TipoClienteScreen> {
  // Datos de ejemplo
  List<Map<String, dynamic>> tiposCliente = [
    {
      'Id': 1,
      'nombre': 'Regular',
      'descripcion': 'Cliente estándar sin beneficios especiales',
      'Codigo': 'CLI-REG'
    },
    {
      'Id': 2,
      'nombre': 'VIP',
      'descripcion': 'Cliente con beneficios exclusivos',
      'Codigo': 'CLI-VIP'
    },
    {
      'Id': 3,
      'nombre': 'Empresarial',
      'descripcion': 'Cliente corporativo con descuentos especiales',
      'Codigo': 'CLI-EMP'
    },
  ];

  // Controladores para el formulario
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _codigoController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    _codigoController.dispose();
    super.dispose();
  }

  void _mostrarFormulario() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange[50],
        title: Text(
          'Nuevo Tipo de Cliente',
          style: TextStyle(color: Colors.orange[800]),
        ),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nombreController,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    filled: true,
                    fillColor: Colors.amber[50],
                  ),
                  validator: (value) => value!.isEmpty ? 'Requerido' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descripcionController,
                  decoration: InputDecoration(
                    labelText: 'Descripción',
                    filled: true,
                    fillColor: Colors.amber[50],
                  ),
                  maxLines: 3,
                  validator: (value) => value!.isEmpty ? 'Requerido' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _codigoController,
                  decoration: InputDecoration(
                    labelText: 'Código',
                    filled: true,
                    fillColor: Colors.amber[50],
                  ),
                  validator: (value) => value!.isEmpty ? 'Requerido' : null,
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
            onPressed: _agregarTipoCliente,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
            ),
            child: const Text('Guardar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _agregarTipoCliente() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        tiposCliente.add({
          'Id': tiposCliente.isNotEmpty ? tiposCliente.last['Id'] + 1 : 1,
          'nombre': _nombreController.text,
          'descripcion': _descripcionController.text,
          'Codigo': _codigoController.text.toUpperCase(),
        });
      });

      _nombreController.clear();
      _descripcionController.clear();
      _codigoController.clear();
      Navigator.pop(context);
    }
  }

  void _eliminarTipoCliente(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange[50],
        title: Text(
          'Eliminar Tipo de Cliente',
          style: TextStyle(color: Colors.orange[800]),
        ),
        content: const Text('¿Estás seguro de eliminar este tipo de cliente?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                tiposCliente.removeWhere((tipo) => tipo['Id'] == id);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Text('Tipos de Cliente'),
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
        itemCount: tiposCliente.length,
        itemBuilder: (context, index) {
          final tipo = tiposCliente[index];
          return Card(
            color: Colors.amber[50],
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ExpansionTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange[100],
                child: Text(tipo['Codigo'].toString().substring(0, 2)),
              ),
              title: Text(
                tipo['nombre'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
              ),
              subtitle: Text('ID: ${tipo['Id']}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => _eliminarTipoCliente(tipo['Id']),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow('Código:', tipo['Codigo']),
                      const SizedBox(height: 8),
                      const Text(
                        'Descripción:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(tipo['descripcion']),
                    ],
                  ),
                ),
              ],
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