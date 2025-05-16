import 'package:flutter/material.dart';

class EditProductPage extends StatefulWidget {
  final Map<String, dynamic> productData;
  
  const EditProductPage({super.key, required this.productData});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late final _formKey = GlobalKey<FormState>();
  late TextEditingController _idController;
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _codeController;
  late TextEditingController _stockMinController;
  late TextEditingController _existenceController;
  late TextEditingController _reservedQuantityController;
  late TextEditingController _purchasePriceController;
  late TextEditingController _salePriceController;
  late TextEditingController _ivaController;
  late TextEditingController _popularityController;
  late String? _selectedCategory;
  late String? _selectedProvider;
  late String? _selectedImagePath;
  late DateTime? _creationDate;
  late bool _featured;
  late bool _status;
  
  final List<String> _availableImages = [
    'assets/images/product1.png',
    'assets/images/product2.png',
    'assets/images/product3.png',
    'assets/images/product4.png',
  ];

  @override
  void initState() {
    super.initState();
    // Inicialización de controladores (igual que en tu código original)
    // ...
  }

  @override
  void dispose() {
    // Dispose de controladores (igual que en tu código original)
    // ...
    super.dispose();
  }

  void _selectImage(String imagePath) {
    setState(() {
      _selectedImagePath = imagePath;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _creationDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _creationDate) {
      setState(() {
        _creationDate = picked;
      });
    }
  }

  Widget _buildImageSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Cambiar imagen:'),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: _availableImages.map((path) {
            return GestureDetector(
              onTap: () => _selectImage(path),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _selectedImagePath == path 
                        ? Colors.orange 
                        : Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(path, fit: BoxFit.cover),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Future<void> _showDeleteDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Eliminar Producto'),
          content: const Text('¿Está seguro que desea eliminar este producto?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Producto eliminado'),
                    backgroundColor: Colors.red,
                  ),
                );
                Navigator.of(context).pop();
              },
              child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Producto'),
        backgroundColor: Colors.orange.shade800,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: () => _showDeleteDialog(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Campos del formulario (igual que en tu código original)
              // ...
              
              const SizedBox(height: 24),
              // Botón de guardar
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Producto actualizado exitosamente'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade800,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Guardar Cambios', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.orange.shade50,
        child: Center(
          child: Text(
            'Sistema de Administración de Productos',
            style: TextStyle(
              color: Colors.orange.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}