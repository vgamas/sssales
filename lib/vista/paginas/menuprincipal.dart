import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class MenuPrincipal extends StatelessWidget {
  final bool isAdmin;
  
  const MenuPrincipal({super.key, this.isAdmin = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('SSSales', style: TextStyle(color: Colors.white)),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar ...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    suffixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          if (isAdmin) IconButton(
            icon: const Icon(Icons.admin_panel_settings),
            onPressed: () => context.go('/admin'),
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: _buildBody(context),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    final menuItems = [
      _MenuItem('Explorar', Icons.explore, '/explore', Colors.blueAccent),
      _MenuItem('Productos', Icons.shopping_basket, '/products', Colors.brown),
      _MenuItem('Especiales', Icons.star, '/specials', Colors.orange),
      _MenuItem('Otros', Icons.more_horiz, '/others', Colors.black),
      _MenuItem('Puntos', Icons.push_pin_rounded, '/points', Colors.black),
      _MenuItem('Super ofertas', Icons.local_offer, '/deals', Colors.red),
      _MenuItem('Liquidacion', Icons.assignment, '/clearance', Colors.purple),
      _MenuItem('Categorias', Icons.category_sharp, '/categories', Colors.green),
      _MenuItem('Mi Cuenta', Icons.person, '/profile', Colors.blue),
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.orange),
            child: Text(
              'Menú SSales',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ...menuItems.map((item) => _buildDrawerItem(
            context, 
            item.title, 
            item.icon, 
            item.route,
            item.color,
          )),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(BuildContext context, String title, IconData icon, String route, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      onTap: () {
        context.go(route);
        Navigator.pop(context);
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    final menuItems = [
      _MenuItem('Explorar', Icons.explore, '/explore', Colors.blueAccent),
      _MenuItem('Productos', Icons.shopping_basket, '/products', Colors.brown),
      _MenuItem('Especiales', Icons.star, '/specials', Colors.orange),
      _MenuItem('Otros', Icons.more_horiz, '/others', Colors.black),
      _MenuItem('Puntos', Icons.push_pin_rounded, '/points', Colors.black),
      _MenuItem('Super Ofertas', Icons.local_offer, '/deals', Colors.red),
      _MenuItem('Liquidacion', Icons.assignment, '/clearance', Colors.purple),
      _MenuItem('Categorias', Icons.category_sharp, '/categories', Colors.green),
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: menuItems.sublist(0, 4).map((item) => 
              _buildIconSection(context, item)
            ).toList(),
          ),
          const SizedBox(height: 90),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: menuItems.sublist(4).map((item) => 
              _buildIconSection(context, item)
            ).toList(),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildIconSection(BuildContext context, _MenuItem item) {
    return GestureDetector(
      onTap: () => context.go(item.route),
      child: Column(
        children: [
          Icon(item.icon, size: 40, color: item.color),
          const SizedBox(height: 8),
          Text(item.title, style: TextStyle(color: item.color)),
        ],
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final IconData icon;
  final String route;
  final Color color;

  const _MenuItem(this.title, this.icon, this.route, this.color);
}