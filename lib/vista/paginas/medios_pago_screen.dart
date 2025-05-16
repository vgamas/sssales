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
      home: const MediosPagoScreen(),
    ),
  );
}

class MediosPagoScreen extends StatefulWidget {
  const MediosPagoScreen({super.key});

  @override
  State<MediosPagoScreen> createState() => _MediosPagoScreenState();
}

class _MediosPagoScreenState extends State<MediosPagoScreen> {
  // Datos de ejemplo
  List<Map<String, dynamic>> mediosPago = [
    {
      'Id': 1,
      'Nombre': 'Tarjeta de Crédito',
      'Conexion': 'Pasarela de Pago XYZ',
      'Estado': 'Activo',
      'Instrucciones': 'Asegúrese de tener saldo disponible',
      'Codigo': 'MP-001'
    },
    {
      'Id': 2,
      'Nombre': 'Transferencia Bancaria',
      'Conexion': 'Banco ABC',
      'Estado': 'Activo',
      'Instrucciones': 'Enviar comprobante al correo',
      'Codigo': 'MP-002'
    },
    {
      'Id': 3,
      'Nombre': 'Efectivo',
      'Conexion': 'Punto de Venta',
      'Estado': 'Activo',
      'Instrucciones': 'Solo en horario de atención',
      'Codigo': 'MP-003'
    },
  ];

  // Controladores para el formulario
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _conexionController = TextEditingController();
  final _instruccionesController = TextEditingController();
  String _estado = 'Activo';

  @override
  void dispose() {
    _nombreController.dispose();
    _conexionController.dispose();
    _instruccionesController.dispose();
    super.dispose();
  }

  void _mostrarFormulario() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange[50],
        title: Text(
          'Nuevo Medio de Pago',
          style: TextStyle(color: Colors.orange[800]),
        ),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextFormField(_nombreController, 'Nombre'),
                _buildTextFormField(_conexionController, 'Conexión'),
                _buildTextFormField(_instruccionesController, 'Instrucciones', maxLines: 3),
                DropdownButtonFormField<String>(
                  value: _estado,
                  items: ['Activo', 'Inactivo', 'En Mantenimiento'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
            onPressed: _agregarMedioPago,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
            ),
            child: const Text('Guardar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField(TextEditingController controller, String labelText,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Colors.amber[50],
          border: const OutlineInputBorder(),
        ),
        maxLines: maxLines,
        validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
      ),
    );
  }

  void _agregarMedioPago() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        mediosPago.add({
          'Id': mediosPago.isNotEmpty ? mediosPago.last['Id'] + 1 : 1,
          'Nombre': _nombreController.text,
          'Conexion': _conexionController.text,
          'Estado': _estado,
          'Instrucciones': _instruccionesController.text,
          'Codigo': 'MP-${(mediosPago.length + 1).toString().padLeft(3, '0')}',
        });
      });

      _nombreController.clear();
      _conexionController.clear();
      _instruccionesController.clear();
      _estado = 'Activo';
      Navigator.pop(context);
    }
  }

  void _eliminarMedioPago(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange[50],
        title: Text(
          'Eliminar Medio de Pago',
          style: TextStyle(color: Colors.orange[800]),
        ),
        content: const Text('¿Estás seguro de eliminar este medio de pago?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                mediosPago.removeWhere((mp) => mp['Id'] == id);
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
        title: const Text('Medios de Pago'),
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
        itemCount: mediosPago.length,
        itemBuilder: (context, index) {
          final medio = mediosPago[index];
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
                child: Text(medio['Codigo'].toString().substring(0, 2)),
              ),
              title: Text(
                medio['Nombre'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
              ),
              subtitle: Text('Estado: ${medio['Estado']}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => _eliminarMedioPago(medio['Id']),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow('Código:', medio['Codigo']),
                      _buildInfoRow('Conexión:', medio['Conexion']),
                      const SizedBox(height: 8),
                      const Text(
                        'Instrucciones:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(medio['Instrucciones']),
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
            width: 100,
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