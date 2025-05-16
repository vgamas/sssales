import 'package:flutter/material.dart';
import 'package:sssales/vista/paginas/parametros.dart';

void main() {
  runApp(
    MaterialApp(
      title: Parametros.nombreTienda,
      theme: ThemeData(
        primaryColor: Colors.orange,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber,
        ),
      ),
      home: EmpresaInfoScreen(),
    ),
  );
}

class EmpresaInfoScreen extends StatelessWidget {
  final Map<String, dynamic> empresaData = {
    'Nombre': 'SSSales',
    'Direccion': 'Calle Principal #123, Ciudad',
    'Telefono_Fijo': '(601) 234-5678',
    'Telefono': '3213549851',
    'Id_Ciudad': '1 - Bogota',
    'Logo': 'assets/images/sssales_logo.png',
    'Estado': 'Activo'
  };

  EmpresaInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Text('Información de la Empresa'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildLogoSection(),
            const SizedBox(height: 20),
            _buildInfoCard(),
            const SizedBox(height: 30),
            _buildActionButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            empresaData['Logo'],
            height: 120,
            errorBuilder: (context, error, stackTrace) => 
              const Icon(Icons.business, size: 80, color: Colors.orange),
          ),
          const SizedBox(height: 10),
          Text(
            empresaData['Nombre'],
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      color: Colors.amber[50],
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow(Icons.location_on, 'Dirección:', empresaData['Direccion']),
            const Divider(color: Colors.orange),
            _buildInfoRow(Icons.phone, 'Teléfono Fijo:', empresaData['Telefono_Fijo']),
            const Divider(color: Colors.orange),
            _buildInfoRow(Icons.phone_android, 'Teléfono Móvil:', empresaData['Telefono']),
            const Divider(color: Colors.orange),
            _buildInfoRow(Icons.location_city, 'Ciudad:', empresaData['Id_Ciudad']),
            const Divider(color: Colors.orange),
            _buildInfoRow(Icons.star, 'Estado:', empresaData['Estado']),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.orange, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.orange[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    return ElevatedButton(
      onPressed: () {
        // Acción para editar información
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber[700],
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 3,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.edit, size: 20),
          SizedBox(width: 10),
          Text(
            'Editar Información',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}