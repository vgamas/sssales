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
      home: const DetalleVentasScreen(),
    ),
  );
}

class DetalleVentasScreen extends StatefulWidget {
  const DetalleVentasScreen({super.key});

  @override
  State<DetalleVentasScreen> createState() => _DetalleVentasScreenState();
}

class _DetalleVentasScreenState extends State<DetalleVentasScreen> {
  final List<Map<String, dynamic>> _detallesVenta = [
    {
      'id': 1,
      'idVenta': 101,
      'idProducto': 1001,
      'cantidad': 2,
      'precioUnitario': 25000.0,
      'ivaUnitario': 4750.0,
      'codigo': 'DV-001',
      'nombreProducto': 'papeleria creativa',
      'imagen': 'https://via.placeholder.com/100?text=papel'
    },
    {
      'id': 2,
      'idVenta': 101,
      'idProducto': 1002,
      'cantidad': 1,
      'precioUnitario': 120000.0,
      'ivaUnitario': 22800.0,
      'codigo': 'DV-002',
      'nombreProducto': 'kit cumpleaños',
      'imagen': 'https://via.placeholder.com/100?text=vasos'
    },
    {
      'id': 3,
      'idVenta': 102,
      'idProducto': 1003,
      'cantidad': 3,
      'precioUnitario': 35000.0,
      'ivaUnitario': 6650.0,
      'codigo': 'DV-003',
      'nombreProducto': 'carteles decorativos',
      'imagen': 'https://via.placeholder.com/100?text=cartel'
    },
  ];

  final _formKey = GlobalKey<FormState>();
  final _ventaController = TextEditingController();
  final _productoController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _precioController = TextEditingController();
  final _ivaController = TextEditingController();
  final _nombreProductoController = TextEditingController();

  @override
  void dispose() {
    _ventaController.dispose();
    _productoController.dispose();
    _cantidadController.dispose();
    _precioController.dispose();
    _ivaController.dispose();
    _nombreProductoController.dispose();
    super.dispose();
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
                  'Agregar Detalle de Venta',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[800],
                  ),
                ),
                const SizedBox(height: 16),
                _buildTextFormField(
                  controller: _ventaController,
                  labelText: 'ID Venta',
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
                ),
                _buildTextFormField(
                  controller: _productoController,
                  labelText: 'ID Producto',
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
                ),
                _buildTextFormField(
                  controller: _nombreProductoController,
                  labelText: 'Nombre Producto',
                  validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
                ),
                _buildTextFormField(
                  controller: _cantidadController,
                  labelText: 'Cantidad',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) return 'Campo requerido';
                    if (int.tryParse(value) == null) return 'Ingrese un número válido';
                    return null;
                  },
                ),
                _buildTextFormField(
                  controller: _precioController,
                  labelText: 'Precio Unitario',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) return 'Campo requerido';
                    if (double.tryParse(value) == null) return 'Ingrese un número válido';
                    return null;
                  },
                ),
                _buildTextFormField(
                  controller: _ivaController,
                  labelText: 'IVA Unitario',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) return 'Campo requerido';
                    if (double.tryParse(value) == null) return 'Ingrese un número válido';
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
                      onPressed: _agregarDetalleVenta,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Agregar'),
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

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
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
        validator: validator,
      ),
    );
  }

  void _agregarDetalleVenta() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _detallesVenta.add({
          'id': _detallesVenta.isNotEmpty ? _detallesVenta.last['id'] + 1 : 1,
          'idVenta': int.parse(_ventaController.text),
          'idProducto': int.parse(_productoController.text),
          'cantidad': int.parse(_cantidadController.text),
          'precioUnitario': double.parse(_precioController.text),
          'ivaUnitario': double.parse(_ivaController.text),
          'codigo': 'DV-${(_detallesVenta.length + 1).toString().padLeft(3, '0')}',
          'nombreProducto': _nombreProductoController.text,
          'imagen': 'https://via.placeholder.com/100?text=${_nombreProductoController.text.split(' ').take(2).join('+')}'
        });
      });

      _ventaController.clear();
      _productoController.clear();
      _cantidadController.clear();
      _precioController.clear();
      _ivaController.clear();
      _nombreProductoController.clear();
      Navigator.pop(context);
    }
  }

  void _eliminarDetalleVenta(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange[50],
        title: Text(
          'Eliminar Detalle',
          style: TextStyle(color: Colors.orange[800]),
        ),
        content: const Text('¿Estás seguro de eliminar este detalle de venta?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _detallesVenta.removeWhere((dv) => dv['id'] == id);
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

  double _calcularSubtotal(Map<String, dynamic> detalle) {
    return (detalle['precioUnitario'] + detalle['ivaUnitario']) * detalle['cantidad'];
  }

  double _calcularTotal() {
    return _detallesVenta.fold(0, (total, detalle) {
      return total + _calcularSubtotal(detalle);
    });
  }

  String _formatearPrecio(double precio) {
    return NumberFormat.currency(
      locale: 'es_CO',
      symbol: '\$',
      decimalDigits: 0,
    ).format(precio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Text('Detalle de Ventas'),
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
              itemCount: _detallesVenta.length,
              itemBuilder: (context, index) {
                final detalle = _detallesVenta[index];
                final subtotal = _calcularSubtotal(detalle);
                
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
                      child: ClipOval(
                        child: Image.network(
                          detalle['imagen'],
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => 
                            const Icon(Icons.shopping_bag),
                        ),
                      ),
                    ),
                    title: Text(
                      detalle['nombreProducto'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[800],
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Venta: ${detalle['idVenta']} - Cantidad: ${detalle['cantidad']}'),
                        Text('Precio: ${_formatearPrecio(detalle['precioUnitario'])}'),
                        Text('IVA: ${_formatearPrecio(detalle['ivaUnitario'])}'),
                        Text('Subtotal: ${_formatearPrecio(subtotal)}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _eliminarDetalleVenta(detalle['id']),
                    ),
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
                  'TOTAL DETALLES:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[800],
                  ),
                ),
                Text(
                  _formatearPrecio(_calcularTotal()),
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
}