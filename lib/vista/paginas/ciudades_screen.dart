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
      home: const CiudadesScreen(),
    ),
  );
}

class CiudadesScreen extends StatefulWidget {
  const CiudadesScreen({super.key});

  @override
  State<CiudadesScreen> createState() => _CiudadesScreenState();
}

class _CiudadesScreenState extends State<CiudadesScreen> {
  // Lista de ciudades 
  List<Map<String, dynamic>> ciudades = [
    {
      'Id': 1,
      'Nombre': 'Bogotá',
      'Id_Departamento': 11,
      'Codigo': '11001'
    },
    {
      'Id': 2,
      'Nombre': 'Medellín',
      'Id_Departamento': 5,
      'Codigo': '05001'
    },
    {
      'Id': 3,
      'Nombre': 'Cali',
      'Id_Departamento': 76,
      'Codigo': '76001'
    },
  ];

  // Controladores para el formulario
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _departamentoController = TextEditingController();
  final _codigoController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _departamentoController.dispose();
    _codigoController.dispose();
    super.dispose();
  }

  void _mostrarFormularioAgregar() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.orange[50],
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Agregar Nueva Ciudad',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.amber[50],
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
                controller: _departamentoController,
                decoration: InputDecoration(
                  labelText: 'ID Departamento',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.amber[50],
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el ID';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _codigoController,
                decoration: InputDecoration(
                  labelText: 'Código',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.amber[50],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el código';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('Cancelar'),
                  ),
                  ElevatedButton(
                    onPressed: _agregarCiudad,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Guardar'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _agregarCiudad() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        ciudades.add({
          'Id': ciudades.length + 1, // Auto-incremento simple
          'Nombre': _nombreController.text,
          'Id_Departamento': int.parse(_departamentoController.text),
          'Codigo': _codigoController.text,
        });
      });

      // Limpiar campos y cerrar modal
      _nombreController.clear();
      _departamentoController.clear();
      _codigoController.clear();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Text('Información de Ciudades'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: ciudades.length,
        itemBuilder: (context, index) {
          final ciudad = ciudades[index];
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
                  _buildInfoRow('ID:', ciudad['Id'].toString()),
                  const Divider(color: Colors.orange),
                  _buildInfoRow('Nombre:', ciudad['Nombre']),
                  const Divider(color: Colors.orange),
                  _buildInfoRow('ID Departamento:', ciudad['Id_Departamento'].toString()),
                  const Divider(color: Colors.orange),
                  _buildInfoRow('Código:', ciudad['Codigo']),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarFormularioAgregar,
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.orange[800],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}