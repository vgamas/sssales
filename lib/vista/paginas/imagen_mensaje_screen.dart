import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
      home: const ImagenMensajeScreen(),
    ),
  );
}

class ImagenMensajeScreen extends StatefulWidget {
  const ImagenMensajeScreen({super.key});

  @override
  State<ImagenMensajeScreen> createState() => _ImagenMensajeScreenState();
}

class _ImagenMensajeScreenState extends State<ImagenMensajeScreen> {
  // Datos de ejemplo
  List<Map<String, dynamic>> imagenes = [
    {
      'Id': 1,
      'Id_Mensaje': 101,
      'Url_Imagen': 'https://via.placeholder.com/300x200?text=Imagen+1',
      'Codigo': 'IMG-001'
    },
    {
      'Id': 2,
      'Id_Mensaje': 102,
      'Url_Imagen': 'https://via.placeholder.com/300x200?text=Imagen+2',
      'Codigo': 'IMG-002'
    },
    {
      'Id': 3,
      'Id_Mensaje': 103,
      'Url_Imagen': 'https://via.placeholder.com/300x200?text=Imagen+3',
      'Codigo': 'IMG-003'
    },
  ];

  // Controladores para el formulario
  final _formKey = GlobalKey<FormState>();
  final _idMensajeController = TextEditingController();
  final _urlImagenController = TextEditingController();

  @override
  void dispose() {
    _idMensajeController.dispose();
    _urlImagenController.dispose();
    super.dispose();
  }

  void _mostrarFormulario() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange[50],
        title: Text(
          'Agregar Imagen',
          style: TextStyle(color: Colors.orange[800]),
        ),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _idMensajeController,
                  decoration: InputDecoration(
                    labelText: 'ID Mensaje',
                    filled: true,
                    fillColor: Colors.amber[50],
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Requerido' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _urlImagenController,
                  decoration: InputDecoration(
                    labelText: 'URL Imagen',
                    filled: true,
                    fillColor: Colors.amber[50],
                  ),
                  validator: (value) => value!.isEmpty ? 'Requerido' : null,
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
            onPressed: _agregarImagen,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
            ),
            child: const Text('Guardar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _agregarImagen() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        imagenes.add({
          'Id': imagenes.isNotEmpty ? imagenes.last['Id'] + 1 : 1,
          'Id_Mensaje': int.parse(_idMensajeController.text),
          'Url_Imagen': _urlImagenController.text,
          'Codigo': 'IMG-${(imagenes.length + 1).toString().padLeft(3, '0')}',
        });
      });

      _idMensajeController.clear();
      _urlImagenController.clear();
      Navigator.pop(context);
    }
  }

  void _eliminarImagen(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange[50],
        title: Text(
          'Eliminar Imagen',
          style: TextStyle(color: Colors.orange[800]),
        ),
        content: const Text('¿Estás seguro de eliminar esta imagen?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                imagenes.removeWhere((img) => img['Id'] == id);
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
        title: const Text('Imágenes de Mensajes'),
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
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: imagenes.length,
        itemBuilder: (context, index) {
          final imagen = imagenes[index];
          return Card(
            color: Colors.amber[50],
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12)),
                    child: CachedNetworkImage(
                      imageUrl: imagen['Url_Imagen'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      placeholder: (context, url) => Container(
                        color: Colors.orange[100],
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
                        'Código: ${imagen['Codigo']}',
                        style: TextStyle(
                          color: Colors.orange[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('ID Mensaje: ${imagen['Id_Mensaje']}'),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _eliminarImagen(imagen['Id']),
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
}