import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sssales/screens/home_screen.dart';
import 'package:sssales/screens/login_screen.dart';
import 'package:sssales/screens/profile_screen.dart';
import 'package:sssales/screens/register_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/login', // Ruta inicial por defecto
  redirect: (context, state) async {
    final isAuthenticated = FirebaseAuth.instance.currentUser != null;
    final isAuthRoute = state.uri.path == '/login' || state.uri.path == '/register';

    // Usuario NO autenticado
    if (!isAuthenticated) {
      return isAuthRoute ? null : '/login';
    } 
    // Usuario SÍ autenticado
    else {
      // Si intenta acceder a login/register, redirigir a home
      if (isAuthRoute) return '/home';
      
      // Si intenta acceder a ruta no existente, redirigir a home
      if (state.uri.path.isEmpty || state.uri.path == '/') return '/home';
    }

    return null;
  },
  routes: [
    // Rutas públicas
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),

    // Rutas protegidas (Shell)
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => ScaffoldWithNavBar(child: child),
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),

    // Ruta de fallback para rutas no definidas
    GoRoute(
      path: '/:path(.*)',
      redirect: (context, state) => FirebaseAuth.instance.currentUser != null 
          ? '/home' 
          : '/login',
    ),
  ],
);

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;
  const ScaffoldWithNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateCurrentIndex(context),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/home');
              break;
            case 1:
              context.go('/profile');
              break;
          }
        },
      ),
    );
  }

  int _calculateCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/profile')) return 1;
    return 0;
  }
}