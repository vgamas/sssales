import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sssales/vista/paginas/parametros.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Controladores y estados
  Timer? _timer;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Estados de la aplicación
  bool _initializationComplete = false;
  bool _errorOccurred = false;
  bool _isCheckingAdmin = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _initializeApp() async {
    try {
      // Esperar el estado inicial de autenticación con timeout
      await _auth.authStateChanges().first.timeout(
            const Duration(seconds: 5),
            onTimeout: () => () {
        if (!mounted) return;
      
        setState(() => _errorOccurred = true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error de conexión. Intente nuevamente')),
        );
      
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) context.go('/login');
        });
      }(),
          );

      if (!mounted) return;

      // Configurar temporizador para la navegación
      _startNavigationTimer();
    } on TimeoutException {
      _handleTimeout();
    } catch (e) {
      _handleInitializationError(e);
    } finally {
      if (mounted) {
        setState(() => _initializationComplete = true);
      }
    }
  }

  void _handleTimeout() {
    if (!mounted) return;

    setState(() => _errorOccurred = true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Error de conexión. Intente nuevamente')),
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) context.go('/login');
    });
  }

  void _startNavigationTimer() {
    _timer = Timer(
      const Duration(seconds: 2),
      () => _navigateBasedOnAuth(),
    );
  }

  void _handleInitializationError(dynamic error) {
    debugPrint('Error en inicialización: $error');
    if (!mounted) return;

    setState(() => _errorOccurred = true);
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) context.go('/login');
    });
  }

  Future<bool> _checkIfUserIsAdmin(String userId) async {
    if (_isCheckingAdmin) return false;

    try {
      _isCheckingAdmin = true;
      final userDoc = await _firestore.collection('users').doc(userId).get();
      return userDoc.exists ? (userDoc.data()?['isAdmin'] ?? false) : false;
    } catch (e) {
      debugPrint('Error al verificar admin: $e');
      return false;
    } finally {
      _isCheckingAdmin = false;
    }
  }

  Future<void> _navigateBasedOnAuth() async {
    if (!mounted) return;

    try {
      final user = _auth.currentUser;
      if (user == null) {
        context.go('/login');
        return;
      }

      final isAdmin = await _checkIfUserIsAdmin(user.uid);
      if (mounted) {
        context.go(isAdmin ? '/admin-home' : '/home');
      }
    } catch (e) {
      debugPrint('Error en navegación: $e');
      if (mounted) {
        context.go('/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Parametros.colorFondo,
      body: Stack(
        fit: StackFit.expand,
        children: [
          _buildMainContent(),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Bienvenido a',
            style: TextStyle(
              fontSize: Parametros.tamanoTitulo,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildAppLogo(),
          const SizedBox(height: 20),
          _buildStoreName(),
          if (!_initializationComplete && !_errorOccurred)
            _buildLoadingIndicator(),
          if (_errorOccurred) _buildErrorWidget(),
        ],
      ),
    );
  }

  Widget _buildAppLogo() {
    return Image.asset(
      'lib/vista/imagenes/sssales_rojo_solo_logo_sin_fondo.png',
      height: 200,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) =>
          const Icon(Icons.error_outline, size: 50),
    );
  }

  Widget _buildStoreName() {
    return Text(
      Parametros.nombreTienda,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: 'YesevaOne',
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 40),
          const SizedBox(height: 10),
          Text(
            'Error al conectar',
            style: TextStyle(
              color: Colors.red,
              fontSize: Parametros.tamanoSubtitulo,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Column(
        children: [
          _buildPartnerLogo(),
          const SizedBox(height: 10),
          _buildCopyright(),
        ],
      ),
    );
  }

  Widget _buildPartnerLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Tu tienda de ',
          style: TextStyle(fontSize: 10),
        ),
        Image.asset(
          'lib/vista/imagenes/M_V_Solutions_SAS_logo_sin_fondo.png',
          height: 30,
          errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildCopyright() {
    return Text(
      Parametros.copyRight,
      style: const TextStyle(fontSize: 8),
    );
  }
}
