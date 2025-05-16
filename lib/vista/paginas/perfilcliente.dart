import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil de Cliente',
      theme: ThemeData(
        primarySwatch: Colors.orange, 
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String nombre = "Pepito";
  String apellido = "Perez";
  String celular = "321-354-9851";
  String ciudad = "Bogota";
  String email = "pepito@example.com";
  
  bool isEditing = false;
  
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _celularController = TextEditingController();
  final TextEditingController _ciudadController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nombreController.text = nombre;
    _apellidoController.text = apellido;
    _celularController.text = celular;
    _ciudadController.text = ciudad;
    _emailController.text = email;
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _celularController.dispose();
    _ciudadController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      isEditing = !isEditing;
      if (!isEditing) {
        // Guardar cambios
        if (_formKey.currentState!.validate()) {
          nombre = _nombreController.text;
          apellido = _apellidoController.text;
          celular = _celularController.text;
          ciudad = _ciudadController.text;
          email = _emailController.text;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Cuenta'),
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.save : Icons.edit),
            onPressed: _toggleEdit,
          ),
        ],
      ),
      drawer: DrawerNavegacion(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.orange,
                child: Text(
                  nombre[0] + apellido[0],
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                '$nombre $apellido',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            
            if (!isEditing) ...[
              _buildInfoItem(Icons.phone, 'Celular', celular),
              _buildInfoItem(Icons.location_city, 'Ciudad', ciudad),
              _buildInfoItem(Icons.email, 'Email', email),
            ],
            
            if (isEditing) ...[
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildEditField('Nombre', _nombreController),
                    _buildEditField('Apellido', _apellidoController),
                    _buildEditField('Celular', _celularController),
                    _buildEditField('Ciudad', _ciudadController),
                    _buildEditField('Email', _emailController),
                  ],
                ),
              ),
            ],
            
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Acción para cambiar contraseña
                },
                child: Text('Cambiar Contraseña'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEditField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor ingrese $label';
          }
          return null;
        },
      ),
    );
  }
}

class DrawerNavegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: Text(
              'Menú',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.orange),
            title: Text('Inicio'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag, color: Colors.orange),
            title: Text('Comprar'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart, color: Colors.orange),
            title: Text('Cesta'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.orange),
            title: Text('Mi Cuenta'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}