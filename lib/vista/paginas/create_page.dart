import 'package:flutter/material.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _codeController = TextEditingController();
  final _stockMinController = TextEditingController();
  final _existenceController = TextEditingController();
  final _reservedQuantityController = TextEditingController();
  final _purchasePriceController = TextEditingController();
  final _salePriceController = TextEditingController();
  final _ivaController = TextEditingController();
  final _popularityController = TextEditingController();
  String? _selectedCategory;
  String? _selectedProvider;
  String? _selectedImagePath;
  DateTime? _creationDate;
  bool _featured = false;
  bool _status = true;
  
  final List<String> _availableImages = [
    'assets/images/product1.png',
    'assets/images/product2.png',
    'assets/images/product3.png',
    'assets/images/product4.png',
  ];

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _codeController.dispose();
    _stockMinController.dispose();
    _existenceController.dispose();
    _reservedQuantityController.dispose();
    _purchasePriceController.dispose();
    _salePriceController.dispose();
    _ivaController.dispose();
    _popularityController.dispose();
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
      initialDate: DateTime.now(),
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
        const Text('Seleccione una imagen:'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Producto'),
        backgroundColor: Colors.orange.shade800,
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
                        content: Text('Producto creado exitosamente'),
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
                child: const Text('Guardar Producto', style: TextStyle(color: Colors.white)),
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