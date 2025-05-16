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
      home: const TipoDocumentoScreen(),
    ),
  );
}

class TipoDocumentoScreen extends StatefulWidget {
  const TipoDocumentoScreen({super.key});

  @override
  State<TipoDocumentoScreen> createState() => _TipoDocumentoScreenState();
}

class _TipoDocumentoScreenState extends State<TipoDocumentoScreen> {
  // Datos de ejemplo
  List<Map<String, dynamic>> tiposDocumento = [
    {'Id': 1, 'nombre': 'Cédula de Ciudadanía', 'Codigo': 'CC'},
    {'Id': 2, 'nombre': 'Tarjeta de Identidad', 'Codigo': 'TI'},
    {'Id': 3, 'nombre': 'Cédula de Extranjería', 'Codigo': 'CE'},
    {'Id': 4, 'nombre': 'Pasaporte', 'Codigo': 'PA'},
    {'Id': 5, 'nombre': 'NIT', 'Codigo': 'NIT'},
  ];

  // Controladores para el formulario
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _codigoController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _codigoController.dispose();
    super.dispose();
  }

  void _mostrarFormulario() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange[50],
        title: Text(
          'Nuevo Tipo de Documento',
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
                  labelText: 'Nombre del Documento',
                  filled: true,
                  fillColor: Colors.amber[50],
                ),
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
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: _agregarTipoDocumento,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
            ),
            child: const Text('Guardar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _agregarTipoDocumento() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        tiposDocumento.add({
          'Id': tiposDocumento.isNotEmpty ? tiposDocumento.last['Id'] + 1 : 1,
          'nombre': _nombreController.text,
          'Codigo': _codigoController.text.toUpperCase(),
        });
      });

      _nombreController.clear();
      _codigoController.clear();
      Navigator.pop(context);
    }
  }

  void _eliminarTipoDocumento(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange[50],
        title: Text(
          'Eliminar Tipo de Documento',
          style: TextStyle(color: Colors.orange[800]),
        ),
        content: const Text('¿Estás seguro de eliminar este tipo de documento?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                tiposDocumento.removeWhere((doc) => doc['Id'] == id);
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
        title: const Text('Tipos de Documento'),
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
        itemCount: tiposDocumento.length,
        itemBuilder: (context, index) {
          final doc = tiposDocumento[index];
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
                child: Text(doc['Codigo']),
              ),
              title: Text(
                doc['nombre'],
                style: TextStyle(
                  color: Colors.orange[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('ID: ${doc['Id']}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => _eliminarTipoDocumento(doc['Id']),
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
}