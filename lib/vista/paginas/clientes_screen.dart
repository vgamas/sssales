import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';

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
      home: const ClientesScreen(),
    ),
  );
}

class ClientesScreen extends StatefulWidget {
  const ClientesScreen({super.key});

  @override
  State<ClientesScreen> createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
  // Datos de ejemplo
  List<Map<String, dynamic>> clientes = [
    {
      'id': 1,
      'Nombre_completo': 'Juan Pérez',
      'tipo_documento': 'Cédula',
      'numero_documento': '123456789',
      'Correo': 'juan@example.com',
      'Celular': '3001234567',
      'Direccion': 'Calle 123 #45-67',
      'Id_Ciudad': 1,
      'Estado': 'Activo',
      'Observaciones': 'Cliente frecuente',
      'Id_Tipo': 1,
      'Facebook': 'juanperez',
      'Instagram': '@juanperez',
      'Whatsapp': '3001234567',
      'Tiktok': '@juanperez',
      'Fecha_Nacimiento': '1985-05-15',
      'id_Usuario': 101,
      'Url_Imagen': 'https://via.placeholder.com/150?text=JP',
      'Codigo': 'CLI-001'
    },
  ];

  // Controladores para el formulario
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _tipoDocController = TextEditingController();
  final _numDocController = TextEditingController();
  final _correoController = TextEditingController();
  final _celularController = TextEditingController();
  final _direccionController = TextEditingController();
  final _ciudadController = TextEditingController();
  final _obsController = TextEditingController();
  final _facebookController = TextEditingController();
  final _instagramController = TextEditingController();
  final _whatsappController = TextEditingController();
  final _tiktokController = TextEditingController();
  final _fechaNacController = TextEditingController();
  final _usuarioController = TextEditingController();
  final _imagenController = TextEditingController();

  String _estado = 'Activo';
  int _idTipo = 1;
  DateTime? _fechaNacimiento;

  @override
  void dispose() {
    _nombreController.dispose();
    _tipoDocController.dispose();
    _numDocController.dispose();
    _correoController.dispose();
    _celularController.dispose();
    _direccionController.dispose();
    _ciudadController.dispose();
    _obsController.dispose();
    _facebookController.dispose();
    _instagramController.dispose();
    _whatsappController.dispose();
    _tiktokController.dispose();
    _fechaNacController.dispose();
    _usuarioController.dispose();
    _imagenController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaNacimiento ?? DateTime.now(),
      firstDate: DateTime(1900),
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
    if (picked != null && picked != _fechaNacimiento) {
      setState(() {
        _fechaNacimiento = picked;
        _fechaNacController.text = DateFormat('yyyy-MM-dd').format(picked);
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
                  'Nuevo Cliente',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[800],
                  ),
                ),
                const SizedBox(height: 16),
                _buildTextFormField(_nombreController, 'Nombre Completo'),
                _buildTextFormField(_tipoDocController, 'Tipo Documento'),
                _buildTextFormField(_numDocController, 'Número Documento',
                    keyboardType: TextInputType.number),
                _buildTextFormField(_correoController, 'Correo',
                    keyboardType: TextInputType.emailAddress),
                _buildTextFormField(_celularController, 'Celular',
                    keyboardType: TextInputType.phone),
                _buildTextFormField(_direccionController, 'Dirección'),
                _buildTextFormField(_ciudadController, 'ID Ciudad',
                    keyboardType: TextInputType.number),
                _buildTextFormField(_obsController, 'Observaciones',
                    maxLines: 2),
                _buildTextFormField(_facebookController, 'Facebook'),
                _buildTextFormField(_instagramController, 'Instagram'),
                _buildTextFormField(_whatsappController, 'WhatsApp',
                    keyboardType: TextInputType.phone),
                _buildTextFormField(_tiktokController, 'TikTok'),
                _buildTextFormField(_imagenController, 'URL Imagen'),
                _buildTextFormField(_usuarioController, 'ID Usuario',
                    keyboardType: TextInputType.number),
                
                // Selector de fecha
                TextFormField(
                  controller: _fechaNacController,
                  decoration: InputDecoration(
                    labelText: 'Fecha Nacimiento',
                    filled: true,
                    fillColor: Colors.amber[50],
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ),
                  readOnly: true,
                ),
                
                // Dropdown para Estado
                DropdownButtonFormField<String>(
                  value: _estado,
                  items: ['Activo', 'Inactivo', 'Bloqueado'].map((String value) {
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
                
                // Dropdown para Tipo
                DropdownButtonFormField<int>(
                  value: _idTipo,
                  items: const [
                    DropdownMenuItem(value: 1, child: Text('Normal')),
                    DropdownMenuItem(value: 2, child: Text('VIP')),
                    DropdownMenuItem(value: 3, child: Text('Empresarial')),
                  ],
                  onChanged: (value) => setState(() => _idTipo = value!),
                  decoration: InputDecoration(
                    labelText: 'Tipo Cliente',
                    filled: true,
                    fillColor: Colors.amber[50],
                  ),
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
                      onPressed: _agregarCliente,
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
      ),
    );
  }

  Widget _buildTextFormField(TextEditingController controller, String labelText,
      {TextInputType keyboardType = TextInputType.text, int maxLines = 1}) {
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
        maxLines: maxLines,
        validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
      ),
    );
  }

  void _agregarCliente() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        clientes.add({
          'id': clientes.isNotEmpty ? clientes.last['id'] + 1 : 1,
          'Nombre_completo': _nombreController.text,
          'tipo_documento': _tipoDocController.text,
          'numero_documento': _numDocController.text,
          'Correo': _correoController.text,
          'Celular': _celularController.text,
          'Direccion': _direccionController.text,
          'Id_Ciudad': int.parse(_ciudadController.text),
          'Estado': _estado,
          'Observaciones': _obsController.text,
          'Id_Tipo': _idTipo,
          'Facebook': _facebookController.text,
          'Instagram': _instagramController.text,
          'Whatsapp': _whatsappController.text,
          'Tiktok': _tiktokController.text,
          'Fecha_Nacimiento': _fechaNacController.text,
          'id_Usuario': int.parse(_usuarioController.text),
          'Url_Imagen': _imagenController.text,
          'Codigo': 'CLI-${(clientes.length + 1).toString().padLeft(3, '0')}',
        });
      });

      // Limpiar campos
      _nombreController.clear();
      _tipoDocController.clear();
      _numDocController.clear();
      _correoController.clear();
      _celularController.clear();
      _direccionController.clear();
      _ciudadController.clear();
      _obsController.clear();
      _facebookController.clear();
      _instagramController.clear();
      _whatsappController.clear();
      _tiktokController.clear();
      _fechaNacController.clear();
      _usuarioController.clear();
      _imagenController.clear();
      _estado = 'Activo';
      _idTipo = 1;
      _fechaNacimiento = null;

      Navigator.pop(context);
    }
  }

  void _eliminarCliente(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange[50],
        title: Text(
          'Eliminar Cliente',
          style: TextStyle(color: Colors.orange[800]),
        ),
        content: const Text('¿Estás seguro de eliminar este cliente?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                clientes.removeWhere((cliente) => cliente['id'] == id);
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
        title: const Text('Gestión de Clientes'),
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
        itemCount: clientes.length,
        itemBuilder: (context, index) {
          final cliente = clientes[index];
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
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: cliente['Url_Imagen'],
                    placeholder: (context, url) => const Icon(Icons.person),
                    errorWidget: (context, url, error) => const Icon(Icons.person),
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              title: Text(
                cliente['Nombre_completo'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
              ),
              subtitle: Text(cliente['Correo']),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => _eliminarCliente(cliente['id']),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow('Código:', cliente['Codigo']),
                      _buildInfoRow('Documento:',
                          '${cliente['tipo_documento']} ${cliente['numero_documento']}'),
                      _buildInfoRow('Celular:', cliente['Celular']),
                      _buildInfoRow('Dirección:', cliente['Direccion']),
                      _buildInfoRow('Ciudad ID:', cliente['Id_Ciudad'].toString()),
                      _buildInfoRow('Estado:', cliente['Estado']),
                      _buildInfoRow('Tipo:', _getTipoCliente(cliente['Id_Tipo'])),
                      _buildInfoRow('Fecha Nacimiento:', cliente['Fecha_Nacimiento']),
                      _buildInfoRow('Usuario ID:', cliente['id_Usuario'].toString()),
                      if (cliente['Facebook'].isNotEmpty)
                        _buildInfoRow('Facebook:', cliente['Facebook']),
                      if (cliente['Instagram'].isNotEmpty)
                        _buildInfoRow('Instagram:', cliente['Instagram']),
                      if (cliente['Whatsapp'].isNotEmpty)
                        _buildInfoRow('WhatsApp:', cliente['Whatsapp']),
                      if (cliente['Tiktok'].isNotEmpty)
                        _buildInfoRow('TikTok:', cliente['Tiktok']),
                      if (cliente['Observaciones'].isNotEmpty) ...[
                        const SizedBox(height: 8),
                        const Text('Observaciones:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(cliente['Observaciones']),
                      ],
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

  String _getTipoCliente(int idTipo) {
    switch (idTipo) {
      case 1:
        return 'Normal';
      case 2:
        return 'VIP';
      case 3:
        return 'Empresarial';
      default:
        return 'Desconocido';
    }
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