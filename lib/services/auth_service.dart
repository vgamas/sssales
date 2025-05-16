import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> registerWithRole({
    required String email,
    required String password,
    required String role,
    bool sendVerificationEmail = true,
  }) async {
    try {
      // Validación básica de campos antes de proceder
      if (email.isEmpty || password.isEmpty) {
        throw 'Por favor complete todos los campos requeridos';
      }

      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user == null) {
        throw FirebaseAuthException(
        code: 'user-creation-failed', 
        message: 'No se pudo crear el usuario'
      );
      }

      await _firestore.collection('users').doc(user.uid).set({
        'email': email,
        'role': role,
        'emailVerified': user.emailVerified,
        'createdAt': FieldValue.serverTimestamp(),
      });

      if (sendVerificationEmail && !user.emailVerified) {
        await user.sendEmailVerification();
      }

      return user;
    } on FirebaseAuthException catch (e) {
      debugPrint('Error en registro: ${e.code} - ${e.message}');
      throw _traducirErrorAuth(e);
    } on FirebaseException catch (e) {
      debugPrint('Error de Firestore: ${e.code} - ${e.message}');
      throw 'Error en la base de datos: ${e.message}';
    } catch (e) {
      debugPrint('Error inesperado: $e');
      throw 'Error inesperado. Por favor intente nuevamente';
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      debugPrint('Error al cerrar sesión: $e');
      throw 'No se pudo cerrar la sesión correctamente';
    }
  }

  Future<bool> isAdmin(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      return doc.exists && doc.data()?['role'] == 'admin';
    } catch (e) {
      debugPrint('Error verificando rol: $e');
      throw 'No se pudo verificar el rol de usuario';
    }
  }

  String _traducirErrorAuth(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'Este correo electrónico ya está registrado';
      case 'invalid-email':
        return 'Formato de correo electrónico inválido';
      case 'weak-password':
        return 'La contraseña debe tener al menos 6 caracteres';
      case 'user-disabled':
        return 'Cuenta deshabilitada. Contacte al soporte';
      case 'user-not-found':
        return 'No existe una cuenta con este correo';
      case 'wrong-password':
        return 'Credenciales incorrectas. Verifique su contraseña';
      case 'network-request-failed':
        return 'Error de conexión. Verifique su acceso a internet';
      case 'too-many-requests':
        return 'Demasiados intentos. Intente nuevamente más tarde';
      case 'operation-not-allowed':
        return 'Operación no permitida. Contacte al administrador';
      default:
        return 'Error de autenticación: ${e.message}';
    }
  }
}