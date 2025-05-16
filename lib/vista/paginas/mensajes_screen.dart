import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      home: const MensajesScreen(),
    ),
  );
}

class MensajesScreen extends StatefulWidget {
  const MensajesScreen({super.key});

  @override
  State<MensajesScreen> createState() => _MensajesScreenState();
}

class _MensajesScreenState extends State<MensajesScreen> {
  // Datos de ejemplo
  List<Map<String, dynamic>> mensajes = [
    {
      'Id': 1,
      'Usuario_Origen': 'admin',
      'Usuario_Final': 'cliente1',
      'Fecha': '2023-11-15',
      'Hora': '10:30',
      'Promocional': 'Sí',
      'Asunto': 'Oferta especial',
      'Mensaje': 'Descuento del 20% en todos los productos',
      'Tipo': 'Promoción',
      'Estado': 'Enviado',
      'Codigo': 'MSG-001'
    },
    {
      'Id': 2,
      'Usuario_Origen': 'soporte',
      'Usuario_Final': 'cliente2',
      'Fecha': '2023-11-16',
      'Hora': '14:15',
      'Promocional': 'No',
      'Asunto': 'Soporte técnico',
      'Mensaje': 'Hemos resuelto tu incidencia',
      'Tipo': 'Soporte',
      'Estado': 'Leído',
      'Codigo': 'MSG-002'
    },
  ];

  // Controladores para el formulario
  final _formKey = GlobalKey<FormState>();
  final _origenController = TextEditingController();
  final _destinoController = TextEditingController();
  final _asuntoController = TextEditingController();
  final _mensajeController = TextEditingController();
  String _promocional = 'No';
  String _tipo = 'Normal';
  String _estado = 'Pendiente';

  @override
  void dispose() {
    _origenController.dispose();
    _destinoController.dispose();
    _asuntoController.dispose();
    _mensajeController.dispose();
    super.dispose();
  }

  void _mostrarFormulario() {
    final now = DateTime.now();
    final fechaActual = DateFormat('yyyy-MM-dd').format(now);
    final horaActual = DateFormat('HH:mm').format(now);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange[50],
        title: Text(
          'Nuevo Mensaje',
          style: TextStyle(color: Colors.orange[800]),
        ),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _origenController,
                  decoration: InputDecoration(
                    labelText: 'Usuario Origen',
                    filled: true,
                    fillColor: Colors.amber[50],
                  ),
                  validator: (value) => value!.isEmpty ? 'Requerido' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _destinoController,
                  decoration: InputDecoration(
                    labelText: 'Usuario Final',
                    filled: true,
                    fillColor: Colors.amber[50],
                  ),
                  validator: (value) => value!.isEmpty ? 'Requerido' : null,
                ),
                const SizedBox(height: 10),
                Text('Fecha: $fechaActual'),
                Text('Hora: $horaActual'),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _promocional,
                  items: ['Sí', 'No'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => _promocional = value!),
                  decoration: InputDecoration(
                    labelText: 'Promocional',
                    filled: true,
                    fillColor: Colors.amber[50],
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _asuntoController,
                  decoration: InputDecoration(
                    labelText: 'Asunto',
                    filled: true,
                    fillColor: Colors.amber[50],
                  ),
                  validator: (value) => value!.isEmpty ? 'Requerido' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _mensajeController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Mensaje',
                    filled: true,
                    fillColor: Colors.amber[50],
                  ),
                  validator: (value) => value!.isEmpty ? 'Requerido' : null,
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _tipo,
                  items: ['Normal', 'Promoción', 'Soporte', 'Urgente']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => _tipo = value!),
                  decoration: InputDecoration(
                    labelText: 'Tipo',
                    filled: true,
                    fillColor: Colors.amber[50],
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _estado,
                  items: ['Pendiente', 'Enviado', 'Leído', 'Error']
                      .map((String value) {
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
            onPressed: _agregarMensaje,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
            ),
            child: const Text('Guardar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _agregarMensaje() {
    if (_formKey.currentState!.validate()) {
      final now = DateTime.now();
      setState(() {
        mensajes.add({
          'Id': mensajes.isNotEmpty ? mensajes.last['Id'] + 1 : 1,
          'Usuario_Origen': _origenController.text,
          'Usuario_Final': _destinoController.text,
          'Fecha': DateFormat('yyyy-MM-dd').format(now),
          'Hora': DateFormat('HH:mm').format(now),
          'Promocional': _promocional,
          'Asunto': _asuntoController.text,
          'Mensaje': _mensajeController.text,
          'Tipo': _tipo,
          'Estado': _estado,
          'Codigo': 'MSG-${(mensajes.length + 1).toString().padLeft(3, '0')}',
        });
      });

      // Limpiar campos
      _origenController.clear();
      _destinoController.clear();
      _asuntoController.clear();
      _mensajeController.clear();
      _promocional = 'No';
      _tipo = 'Normal';
      _estado = 'Pendiente';

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Text('Mensajes de Texto'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: () {
              // Acción para filtrar mensajes
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mensajes.length,
        itemBuilder: (context, index) {
          final msg = mensajes[index];
          return Card(
            color: Colors.amber[50],
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ExpansionTile(
              title: Text(
                msg['Asunto'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
              ),
              subtitle: Text('De: ${msg['Usuario_Origen']} - ${msg['Fecha']}'),
              leading: CircleAvatar(
                backgroundColor: Colors.orange[100],
                child: Text(msg['Id'].toString()),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow('ID:', msg['Id'].toString()),
                      _buildInfoRow('Código:', msg['Codigo']),
                      _buildInfoRow('Para:', msg['Usuario_Final']),
                      _buildInfoRow('Fecha/Hora:', '${msg['Fecha']} ${msg['Hora']}'),
                      _buildInfoRow('Promocional:', msg['Promocional']),
                      _buildInfoRow('Tipo:', msg['Tipo']),
                      _buildInfoRow('Estado:', msg['Estado']),
                      const SizedBox(height: 10),
                      const Text('Mensaje:', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(msg['Mensaje']),
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