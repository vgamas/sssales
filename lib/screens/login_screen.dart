import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _adminCodeController = TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>(); // Añadido para validación de formulario

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return; // Validar campos primero

    try {
      setState(() => _isLoading = true);
      
      // Autenticar usuario
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      
      if (!mounted) return;
      
      // Verificar si es administrador
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      bool isAdmin = userDoc.exists ? (userDoc.data()?['isAdmin'] ?? false) : false;
      
      // Si ingresó código de admin, verificar
      if (_adminCodeController.text.isNotEmpty) {
        const adminCode = "123456"; // Cambia esto por tu código seguro
        if (_adminCodeController.text != adminCode) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Código de administrador incorrecto")),
          );
          return;
        }
        
        // Actualizar en Firestore que es admin
        await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({'isAdmin': true}, SetOptions(merge: true));
        context.go('/admin-home');
      } else {
        context.go(isAdmin ? '/admin-home' : '/home');
      }
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      String errorMessage = "Error de autenticación";
      if (e.code == 'user-not-found') {
        errorMessage = "Usuario no encontrado";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Contraseña incorrecta";
      } else if (e.code == 'invalid-email') {
        errorMessage = "Email inválido";
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su email';
                  }
                  if (!value.contains('@')) {
                    return 'Ingrese un email válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su contraseña';
                  }
                  if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _adminCodeController,
                decoration: const InputDecoration(
                  labelText: 'Código de Administrador (opcional)',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,
                      child: const Text('Iniciar Sesión'),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _adminCodeController.dispose();
    super.dispose();
  }
}