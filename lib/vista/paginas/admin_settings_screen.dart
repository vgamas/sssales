import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de Administrador'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Administrar Usuarios'),
            onTap: () {
              // Navegar a gestión de usuarios
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración del Sistema'),
            onTap: () {
              // Navegar a configuración del sistema
            },
          ),
        ],
      ),
    );
  }
}