import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CategoryInfoScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class CategoryInfoScreen extends StatefulWidget {
  const CategoryInfoScreen({Key? key}) : super(key: key);

  @override
  State<CategoryInfoScreen> createState() => _CategoryInfoScreenState();
}

class _CategoryInfoScreenState extends State<CategoryInfoScreen> {
  // Datos de ejemplo para la categoría
  Map<String, dynamic> categoria = {
    'Id': 'CAT-001',
    'Nombre': 'Materiales para Dibujo',
    'Descripcion': 'Productos para dibujo artístico: lápices, carboncillos, papeles especiales, etc.',
    'Color': '#FFA726', // Código de color naranja
    'Url_Imagen': 'https://via.placeholder.com/400x200?text=Materiales+Dibujo',
    'Estado': 'Activo',
    'Codigo': 'DIB-001',
  };

  // Controladores para los campos editables
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _codigoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicializar los controladores con los valores actuales
    _nombreController.text = categoria['Nombre'];
    _descripcionController.text = categoria['Descripcion'];
    _colorController.text = categoria['Color'];
    _codigoController.text = categoria['Codigo'];
  }

  @override
  void dispose() {
    // Limpiar los controladores
    _nombreController.dispose();
    _descripcionController.dispose();
    _colorController.dispose();
    _codigoController.dispose();
    super.dispose();
  }

  Color _hexToColor(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor"; // Agregar opacidad 100%
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  void _editarCategoria() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Editar Categoría',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _nombreController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _descripcionController,
                  decoration: const InputDecoration(
                    labelText: 'Descripción',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _colorController,
                  decoration: const InputDecoration(
                    labelText: 'Color (Hex, ej: #FFA726)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _codigoController,
                  decoration: const InputDecoration(
                    labelText: 'Código',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          categoria['Nombre'] = _nombreController.text;
                          categoria['Descripcion'] = _descripcionController.text;
                          categoria['Color'] = _colorController.text;
                          categoria['Codigo'] = _codigoController.text;
                        });
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Categoría actualizada correctamente'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      child: const Text('Guardar Cambios'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _toggleEstado() {
    setState(() {
      categoria['Estado'] = categoria['Estado'] == 'Activo' ? 'Inactivo' : 'Activo';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Categoría ${categoria['Estado'] == 'Activo' ? 'activada' : 'desactivada'}',
        ),
        backgroundColor: categoria['Estado'] == 'Activo' ? Colors.green : Colors.orange,
      ),
    );
  }

  void _verProductos() {
    // Navegar a una pantalla de productos de esta categoría
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Productos de ${categoria['Nombre']}'),
            backgroundColor: Colors.orange[800],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.assignment, size: 50, color: Colors.orange),
                const SizedBox(height: 20),
                Text(
                  'Listado de productos de\n${categoria['Nombre']}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Volver'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color categoryColor = _hexToColor(categoria['Color']);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Información de Categoría'),
        backgroundColor: Colors.orange[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _editarCategoria,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tarjeta principal con imagen y nombre
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  // Imagen de fondo con overlay
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.amber[100],
                      image: DecorationImage(
                        image: NetworkImage(categoria['Url_Imagen']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.orange.withOpacity(0.7),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Contenido sobre la imagen
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          categoria['Nombre'],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 6,
                                color: Colors.black45,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Chip(
                          backgroundColor: categoryColor.withOpacity(0.9),
                          label: Text(
                            categoria['Codigo'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Sección de descripción
            Card(
              color: Colors.amber[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.description,
                          color: Colors.orange[800],
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Descripción',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[800],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      categoria['Descripcion'],
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Sección de detalles
            const Text(
              'Detalles de la Categoría',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Tarjeta con detalles
            Card(
              color: Colors.orange[50],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildDetailRow('ID', categoria['Id']),
                    const Divider(height: 20, thickness: 0.5),
                    _buildDetailRow(
                      'Color', 
                      '',
                      trailing: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: categoryColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey),
                        ),
                      ),
                    ),
                    const Divider(height: 20, thickness: 0.5),
                    _buildDetailRow(
                      'Estado', 
                      categoria['Estado'],
                      trailing: Chip(
                        backgroundColor: categoria['Estado'] == 'Activo'
                            ? Colors.green[100]
                            : Colors.red[100],
                        label: Text(
                          categoria['Estado'],
                          style: TextStyle(
                            color: categoria['Estado'] == 'Activo'
                                ? Colors.green[800]
                                : Colors.red[800],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Botones de acción
            Center(
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Volver'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[200],
                      foregroundColor: Colors.orange[800],
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.delete_outline),
                    label: Text(categoria['Estado'] == 'Activo' ? 'Desactivar' : 'Activar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: categoria['Estado'] == 'Activo' 
                          ? Colors.red[100] 
                          : Colors.green[100],
                      foregroundColor: categoria['Estado'] == 'Activo' 
                          ? Colors.red[800] 
                          : Colors.green[800],
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    onPressed: _toggleEstado,
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.visibility),
                    label: const Text('Ver Productos'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[700],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    onPressed: _verProductos,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Widget? trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orange[800],
            ),
          ),
          trailing ?? Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}