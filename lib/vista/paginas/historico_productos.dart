import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Papelería Creativa - Histórico',
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
      home: const HistoricoProductosScreen(),
    );
  }
}

class HistoricoProductosScreen extends StatefulWidget {
  const HistoricoProductosScreen({super.key});

  @override
  State<HistoricoProductosScreen> createState() => _HistoricoProductosScreenState();
}

class _HistoricoProductosScreenState extends State<HistoricoProductosScreen> {
  final List<Map<String, dynamic>> _historico = [
    {
      'Id': '1',
      'Id_Producto': 'PAP-001',
      'Fecha': DateTime(2023, 5, 10),
      'Cantidad': 100,
      'Precio_Compra': 1.20,
      'Precio_Venta': 2.50,
      'Iva_Venta': 0.38,
      'Codigo': 'HIST-001'
    },
    {
      'Id': '2',
      'Id_Producto': 'PAP-002',
      'Fecha': DateTime(2023, 5, 15),
      'Cantidad': 50,
      'Precio_Compra': 2.80,
      'Precio_Venta': 5.99,
      'Iva_Venta': 0.90,
      'Codigo': 'HIST-002'
    },
    {
      'Id': '3',
      'Id_Producto': 'PAP-003',
      'Fecha': DateTime(2023, 6, 1),
      'Cantidad': 75,
      'Precio_Compra': 0.90,
      'Precio_Venta': 2.20,
      'Iva_Venta': 0.33,
      'Codigo': 'HIST-003'
    },
  ];

  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _nuevoRegistro = {
    'Id': '',
    'Id_Producto': '',
    'Fecha': DateTime.now(),
    'Cantidad': 0,
    'Precio_Compra': 0.0,
    'Precio_Venta': 0.0,
    'Iva_Venta': 0.0,
    'Codigo': '',
  };

  final TextEditingController _fechaController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    _fechaController.text = _dateFormat.format(_nuevoRegistro['Fecha']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Productos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _mostrarFormulario(context),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.orangeAccent,
              Colors.amber,
            ],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _historico.length,
          itemBuilder: (context, index) {
            final registro = _historico[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(
                  'Producto: ${registro['Id_Producto']}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Fecha: ${_dateFormat.format(registro['Fecha'])}'),
                    Text('Cantidad: ${registro['Cantidad']}'),
                    Text('P. Compra: \$${registro['Precio_Compra'].toStringAsFixed(2)}'),
                    Text('P. Venta: \$${registro['Precio_Venta'].toStringAsFixed(2)}'),
                    Text('IVA: \$${registro['Iva_Venta'].toStringAsFixed(2)}'),
                  ],
                ),
                trailing: Text(registro['Codigo']),
                onTap: () => _mostrarDetalles(context, registro),
              ),
            );
          },
        ),
      ),
    );
  }

  void _mostrarDetalles(BuildContext context, Map<String, dynamic> registro) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Detalles: ${registro['Id_Producto']}'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('ID:', registro['Id']),
              _buildDetailRow('Código Producto:', registro['Id_Producto']),
              _buildDetailRow('Fecha:', _dateFormat.format(registro['Fecha'])),
              _buildDetailRow('Cantidad:', registro['Cantidad'].toString()),
              _buildDetailRow('Precio Compra:', '\$${registro['Precio_Compra'].toStringAsFixed(2)}'),
              _buildDetailRow('Precio Venta:', '\$${registro['Precio_Venta'].toStringAsFixed(2)}'),
              _buildDetailRow('IVA Venta:', '\$${registro['Iva_Venta'].toStringAsFixed(2)}'),
              _buildDetailRow('Código:', registro['Codigo']),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Text(value),
        ],
      ),
    );
  }

  void _mostrarFormulario(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('Nuevo Registro Histórico'),
            content: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'ID'),
                      initialValue: _nuevoRegistro['Id'],
                      onChanged: (value) => _nuevoRegistro['Id'] = value,
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Ingrese un ID' : null,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'ID Producto'),
                      initialValue: _nuevoRegistro['Id_Producto'],
                      onChanged: (value) => _nuevoRegistro['Id_Producto'] = value,
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Ingrese ID Producto' : null,
                    ),
                    TextFormField(
                      controller: _fechaController,
                      decoration: const InputDecoration(labelText: 'Fecha'),
                      readOnly: true,
                      onTap: () async {
                        final fecha = await showDatePicker(
                          context: context,
                          initialDate: _nuevoRegistro['Fecha'],
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (fecha != null) {
                          setState(() {
                            _nuevoRegistro['Fecha'] = fecha;
                            _fechaController.text = _dateFormat.format(fecha);
                          });
                        }
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Cantidad'),
                      initialValue: _nuevoRegistro['Cantidad'].toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) =>
                          _nuevoRegistro['Cantidad'] = int.tryParse(value) ?? 0,
                      validator: (value) =>
                          (int.tryParse(value ?? '') ?? 0) <= 0
                              ? 'Ingrese cantidad válida'
                              : null,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Precio Compra'),
                      initialValue: _nuevoRegistro['Precio_Compra'].toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => _nuevoRegistro['Precio_Compra'] =
                          double.tryParse(value) ?? 0.0,
                      validator: (value) =>
                          (double.tryParse(value ?? '') ?? 0.0) <= 0
                              ? 'Ingrese precio válido'
                              : null,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Precio Venta'),
                      initialValue: _nuevoRegistro['Precio_Venta'].toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => _nuevoRegistro['Precio_Venta'] =
                          double.tryParse(value) ?? 0.0,
                      validator: (value) =>
                          (double.tryParse(value ?? '') ?? 0.0) <= 0
                              ? 'Ingrese precio válido'
                              : null,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'IVA Venta'),
                      initialValue: _nuevoRegistro['Iva_Venta'].toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => _nuevoRegistro['Iva_Venta'] =
                          double.tryParse(value) ?? 0.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Código'),
                      initialValue: _nuevoRegistro['Codigo'],
                      onChanged: (value) => _nuevoRegistro['Codigo'] = value,
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    setState(() {
                      _historico.add(Map.from(_nuevoRegistro));
                    });
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Registro histórico agregado'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
                child: const Text('Guardar'),
              ),
            ],
          );
        },
      ),
    );
  }
}