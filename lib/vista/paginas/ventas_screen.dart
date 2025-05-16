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
      home: const VentasScreen(),
    ),
  );
}

class VentasScreen extends StatefulWidget {
  const VentasScreen({super.key});

  @override
  State<VentasScreen> createState() => _VentasScreenState();
}

class _VentasScreenState extends State<VentasScreen> {
  // Datos de ejemplo
  List<Map<String, dynamic>> ventas = [
    {
      'Id': 1,
      'Id_Cliente': 101,
      'Fecha': '2023-11-20',
      'Hora': '14:30',
      'Valor_Productos': 175000,
      'Iva_Productos': 33250,
      'Id_Medio_Pago': 1,
      'Referencia_Pago': 'PAGO-12345',
      'Codigo': 'VENT-001',
      'Nombre_Cliente': 'Juan Pérez',
      'Medio_Pago': 'Tarjeta Crédito'
    },
    {
      'Id': 2,
      'Id_Cliente': 102,
      'Fecha': '2023-11-21',
      'Hora': '10:15',
      'Valor_Productos': 85000,
      'Iva_Productos': 16150,
      'Id_Medio_Pago': 2,
      'Referencia_Pago': 'PAGO-12346',
      'Codigo': 'VENT-002',
      'Nombre_Cliente': 'María Gómez',
      'Medio_Pago': 'Transferencia'
    },
  ];

  // Controladores para el formulario
  final _formKey = GlobalKey<FormState>();
  final _clienteController = TextEditingController();
  final _valorController = TextEditingController();
  final _ivaController = TextEditingController();
  final _medioPagoController = TextEditingController();
  final _referenciaController = TextEditingController();
  final _fechaController = TextEditingController();
  final _horaController = TextEditingController();
  DateTime? _fechaVenta;
  TimeOfDay? _horaVenta;

  @override
  void dispose() {
    _clienteController.dispose();
    _valorController.dispose();
    _ivaController.dispose();
    _medioPagoController.dispose();
    _referenciaController.dispose();
    _fechaController.dispose();
    _horaController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaVenta ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.orange,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _fechaVenta) {
      setState(() {
        _fechaVenta = picked;
        _fechaController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _horaVenta ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.orange,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _horaVenta = picked;
        _horaController.text = picked.format(context);
      });
    }
  }

  void _mostrarFormulario() {
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Registrar Nueva Venta',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[800],
                  ),
                ),
                const SizedBox(height: 16),
                _buildTextFormField(_clienteController, 'ID Cliente',
                    keyboardType: TextInputType.number),
                _buildTextFormField(_valorController, 'Valor Productos',
                    keyboardType: TextInputType.number),
                _buildTextFormField(_ivaController, 'IVA Productos',
                    keyboardType: TextInputType.number),
                _buildTextFormField(_medioPagoController, 'ID Medio Pago',
                    keyboardType: TextInputType.number),
                _buildTextFormField(_referenciaController, 'Referencia Pago'),
                
                // Selector de fecha
                TextFormField(
                  controller: _fechaController,
                  decoration: InputDecoration(
                    labelText: 'Fecha Venta',
                    filled: true,
                    fillColor: Colors.amber[50],
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ),
                  readOnly: true,
                  validator: (value) => value!.isEmpty ? 'Requerido' : null,
                ),
                
                // Selector de hora
                TextFormField(
                  controller: _horaController,
                  decoration: InputDecoration(
                    labelText: 'Hora Venta',
                    filled: true,
                    fillColor: Colors.amber[50],
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.access_time),
                      onPressed: () => _selectTime(context),
                    ),
                  ),
                  readOnly: true,
                  validator: (value) => value!.isEmpty ? 'Requerido' : null,
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
                      onPressed: _agregarVenta,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Registrar'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(TextEditingController controller, String labelText,
      {TextInputType keyboardType = TextInputType.text}) {
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
        keyboardType: keyboardType,
        validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
      ),
    );
  }

  void _agregarVenta() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        ventas.add({
          'Id': ventas.isNotEmpty ? ventas.last['Id'] + 1 : 1,
          'Id_Cliente': int.parse(_clienteController.text),
          'Fecha': _fechaController.text,
          'Hora': _horaController.text,
          'Valor_Productos': double.parse(_valorController.text),
          'Iva_Productos': double.parse(_ivaController.text),
          'Id_Medio_Pago': int.parse(_medioPagoController.text),
          'Referencia_Pago': _referenciaController.text,
          'Codigo': 'VENT-${(ventas.length + 1).toString().padLeft(3, '0')}',
          'Nombre_Cliente': 'Cliente ${_clienteController.text}',
          'Medio_Pago': _getMedioPago(int.parse(_medioPagoController.text)),
        });
      });

      _clienteController.clear();
      _valorController.clear();
      _ivaController.clear();
      _medioPagoController.clear();
      _referenciaController.clear();
      _fechaController.clear();
      _horaController.clear();
      _fechaVenta = null;
      _horaVenta = null;
      Navigator.pop(context);
    }
  }

  String _getMedioPago(int idMedioPago) {
    switch (idMedioPago) {
      case 1:
        return 'Tarjeta Crédito';
      case 2:
        return 'Transferencia';
      case 3:
        return 'Efectivo';
      default:
        return 'Otro';
    }
  }

  void _eliminarVenta(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange[50],
        title: Text(
          'Eliminar Venta',
          style: TextStyle(color: Colors.orange[800]),
        ),
        content: const Text('¿Estás seguro de eliminar este registro de venta?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                ventas.removeWhere((venta) => venta['Id'] == id);
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

  double _calcularTotalVentas() {
    return ventas.fold(0, (total, venta) {
      return total + venta['Valor_Productos'] + venta['Iva_Productos'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Text('Registro de Ventas'),
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: ventas.length,
              itemBuilder: (context, index) {
                final venta = ventas[index];
                final totalVenta = venta['Valor_Productos'] + venta['Iva_Productos'];
                
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
                      child: Text(venta['Codigo'].toString().substring(0, 2)),
                    ),
                    title: Text(
                      venta['Nombre_Cliente'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[800],
                      ),
                    ),
                    subtitle: Text(
                      '${venta['Fecha']} ${venta['Hora']} - ${venta['Medio_Pago']}',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _eliminarVenta(venta['Id']),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoRow('Código:', venta['Codigo']),
                            _buildInfoRow('Referencia Pago:', venta['Referencia_Pago']),
                            _buildInfoRow('Valor Productos:',
                                '\$${venta['Valor_Productos'].toStringAsFixed(2)}'),
                            _buildInfoRow('IVA Productos:',
                                '\$${venta['Iva_Productos'].toStringAsFixed(2)}'),
                            const SizedBox(height: 8),
                            Text(
                              'TOTAL VENTA: \$${totalVenta.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange[800],
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.orange[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TOTAL GENERAL:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[800],
                  ),
                ),
                Text(
                  '\$${_calcularTotalVentas().toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[800],
                  ),
                ),
              ],
            ),
          ),
        ],
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
            width: 120,
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