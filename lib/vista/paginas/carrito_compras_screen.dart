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
      home: const CarritoComprasScreen(),
    ),
  );
}

class CarritoComprasScreen extends StatefulWidget {
  const CarritoComprasScreen({super.key});

  @override
  State<CarritoComprasScreen> createState() => _CarritoComprasScreenState();
}

class _CarritoComprasScreenState extends State<CarritoComprasScreen> {
  // Datos de ejemplo
  List<Map<String, dynamic>> carrito = [
    {
      'Id_Cliente': 1,
      'Id_Producto': 101,
      'Cantidad': 2,
      'Precio_Unitario': 25000,
      'Iva_Unitario': 4750,
      'Fecha_reserva': '2023-11-20',
      'Codigo': 'CART-001',
      'Nombre_Producto': 'papeleria creativa',
      'Imagen': 'https://via.placeholder.com/100?text=papel'
    },
    {
      'Id_Cliente': 1,
      'Id_Producto': 205,
      'Cantidad': 1,
      'Precio_Unitario': 120000,
      'Iva_Unitario': 22800,
      'Fecha_reserva': '2023-11-20',
      'Codigo': 'CART-002',
      'Nombre_Producto': 'sublimacion',
      'Imagen': 'https://via.placeholder.com/100?text=posillo'
    },
  ];

  // Controladores para el formulario
  final _formKey = GlobalKey<FormState>();
  final _clienteController = TextEditingController();
  final _productoController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _precioController = TextEditingController();
  final _ivaController = TextEditingController();
  final _fechaController = TextEditingController();
  DateTime? _fechaReserva;

  @override
  void dispose() {
    _clienteController.dispose();
    _productoController.dispose();
    _cantidadController.dispose();
    _precioController.dispose();
    _ivaController.dispose();
    _fechaController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaReserva ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
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
    if (picked != null && picked != _fechaReserva) {
      setState(() {
        _fechaReserva = picked;
        _fechaController.text = DateFormat('yyyy-MM-dd').format(picked);
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
                  'Agregar al Carrito',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[800],
                  ),
                ),
                const SizedBox(height: 16),
                _buildTextFormField(_clienteController, 'ID Cliente',
                    keyboardType: TextInputType.number),
                _buildTextFormField(_productoController, 'ID Producto',
                    keyboardType: TextInputType.number),
                _buildTextFormField(_cantidadController, 'Cantidad',
                    keyboardType: TextInputType.number),
                _buildTextFormField(_precioController, 'Precio Unitario',
                    keyboardType: TextInputType.number),
                _buildTextFormField(_ivaController, 'IVA Unitario',
                    keyboardType: TextInputType.number),
                TextFormField(
                  controller: _fechaController,
                  decoration: InputDecoration(
                    labelText: 'Fecha Reserva',
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
                      onPressed: _agregarAlCarrito,
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

  void _agregarAlCarrito() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        carrito.add({
          'Id_Cliente': int.parse(_clienteController.text),
          'Id_Producto': int.parse(_productoController.text),
          'Cantidad': int.parse(_cantidadController.text),
          'Precio_Unitario': double.parse(_precioController.text),
          'Iva_Unitario': double.parse(_ivaController.text),
          'Fecha_reserva': _fechaController.text,
          'Codigo': 'CART-${(carrito.length + 1).toString().padLeft(3, '0')}',
          'Nombre_Producto': 'Producto ${_productoController.text}',
          'Imagen': 'https://via.placeholder.com/100?text=Prod+${_productoController.text}'
        });
      });

      _clienteController.clear();
      _productoController.clear();
      _cantidadController.clear();
      _precioController.clear();
      _ivaController.clear();
      _fechaController.clear();
      _fechaReserva = null;
      Navigator.pop(context);
    }
  }

  void _eliminarDelCarrito(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange[50],
        title: Text(
          'Eliminar Producto',
          style: TextStyle(color: Colors.orange[800]),
        ),
        content: const Text('¿Estás seguro de eliminar este producto del carrito?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                carrito.removeAt(index);
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

  double _calcularTotal() {
    return carrito.fold(0, (total, item) {
      return total + 
             (item['Precio_Unitario'] + item['Iva_Unitario']) * 
             item['Cantidad'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
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
              itemCount: carrito.length,
              itemBuilder: (context, index) {
                final item = carrito[index];
                final subtotal = (item['Precio_Unitario'] + item['Iva_Unitario']) * 
                                item['Cantidad'];
                
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
                          item['Imagen'],
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => 
                            const Icon(Icons.shopping_cart),
                        ),
                      ),
                    ),
                    title: Text(
                      item['Nombre_Producto'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[800],
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cantidad: ${item['Cantidad']}'),
                        Text('Precio: \$${item['Precio_Unitario'].toStringAsFixed(2)}'),
                        Text('IVA: \$${item['Iva_Unitario'].toStringAsFixed(2)}'),
                        Text('Subtotal: \$${subtotal.toStringAsFixed(2)}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _eliminarDelCarrito(index),
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
                  'TOTAL:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[800],
                  ),
                ),
                Text(
                  '\$${_calcularTotal().toStringAsFixed(2)}',
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
        child: const Icon(Icons.add_shopping_cart, color: Colors.white),
      ),
    );
  }
}