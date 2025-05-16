import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imágenes de Productos',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.orange,
          accentColor: Colors.amber,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          elevation: 4,
        ),
      ),
      home: const ImagenesProductosScreen(),
    );
  }
}

class ImagenesProductosScreen extends StatefulWidget {
  const ImagenesProductosScreen({super.key});

  @override
  State<ImagenesProductosScreen> createState() => _ImagenesProductosScreenState();
}

class _ImagenesProductosScreenState extends State<ImagenesProductosScreen> {
  final List<Map<String, dynamic>> _imagenesProductos = [
    {
      'Id': '1',
      'Id_Producto': 'PAP-001',
      'Url_Imagen': 'https://via.placeholder.com/150/FFA500/FFFFFF?text=Producto+1',
      'Estado': 'Activo',
    },
    {
      'Id': '2',
      'Id_Producto': 'PAP-002',
      'Url_Imagen': 'https://via.placeholder.com/150/FF8C00/FFFFFF?text=Producto+2',
      'Estado': 'Inactivo',
    },
    {
      'Id': '3',
      'Id_Producto': 'PAP-003',
      'Url_Imagen': 'https://via.placeholder.com/150/FF7F00/FFFFFF?text=Producto+3',
      'Estado': 'Activo',
    },
    {
      'Id': '4',
      'Id_Producto': 'PAP-004',
      'Url_Imagen': 'https://via.placeholder.com/150/FFA500/FFFFFF?text=Producto+4',
      'Estado': 'Pendiente',
    },
  ];

  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _nuevaImagen = {
    'Id': '',
    'Id_Producto': '',
    'Url_Imagen': '',
    'Estado': 'Activo',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imágenes de Productos'),
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
              Color(0xFFFFA500), // Naranja
              Color(0xFFFFD700), // Ámbar
            ],
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemCount: _imagenesProductos.length,
          itemBuilder: (context, index) {
            final imagen = _imagenesProductos[index];
            return _buildImageCard(imagen, context);
          },
        ),
      ),
    );
  }

  Widget _buildImageCard(Map<String, dynamic> imagen, BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _mostrarDetalles(context, imagen),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: CachedNetworkImage(
                  imageUrl: imagen['Url_Imagen'],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.amber[100],
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.orange[100],
                    child: const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID: ${imagen['Id']}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Producto: ${imagen['Id_Producto']}'),
                  Chip(
                    backgroundColor: _getEstadoColor(imagen['Estado']),
                    label: Text(
                      imagen['Estado'],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getEstadoColor(String estado) {
    switch (estado) {
      case 'Activo':
        return Colors.green;
      case 'Inactivo':
        return Colors.red;
      case 'Pendiente':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  void _mostrarDetalles(BuildContext context, Map<String, dynamic> imagen) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Detalles: ${imagen['Id_Producto']}'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(imagen['Url_Imagen']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildDetailRow('ID:', imagen['Id']),
              _buildDetailRow('ID Producto:', imagen['Id_Producto']),
              _buildDetailRow('Estado:', imagen['Estado']),
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
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  void _mostrarFormulario(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Agregar Nueva Imagen',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ID',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Ingrese un ID' : null,
                  onChanged: (value) => _nuevaImagen['Id'] = value,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ID Producto',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Ingrese ID Producto' : null,
                  onChanged: (value) => _nuevaImagen['Id_Producto'] = value,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'URL Imagen',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value?.isEmpty ?? true ? 'Ingrese URL de imagen' : null,
                  onChanged: (value) => _nuevaImagen['Url_Imagen'] = value,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Estado',
                    border: OutlineInputBorder(),
                  ),
                  value: _nuevaImagen['Estado'],
                  items: ['Activo', 'Inactivo', 'Pendiente']
                      .map((estado) => DropdownMenuItem(
                            value: estado,
                            child: Text(estado),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      _nuevaImagen['Estado'] = value;
                    }
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      setState(() {
                        _imagenesProductos.add(Map.from(_nuevaImagen));
                      });
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Imagen agregada correctamente'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                  child: const Text('Guardar Imagen'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}