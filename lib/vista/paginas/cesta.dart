import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CestaScreen(),
    );
  }
}

class CestaScreen extends StatefulWidget {
  const CestaScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CestaScreenState createState() => _CestaScreenState();
}

class _CestaScreenState extends State<CestaScreen> {
  // Lista de artículos en la cesta
  final List<Map<String, dynamic>> articulos = [
    {
      "nombre": "Nombre producto 1",
      "precio": 25325.12,
      "cantidad": 1,
      "envioGratis": true,
    },
    {
      "nombre": "Nombre producto 2",
      "precio": 25325.12,
      "cantidad": 1,
      "envioGratis": true,
    },
    {
      "nombre": "Nombre producto 3",
      "precio": 25325.12,
      "cantidad": 1,
      "envioGratis": true,
    },
    {
      "nombre": "Nombre producto 4",
      "precio": 25325.12,
      "cantidad": 1,
      "envioGratis": true,
    },
    {
      "nombre": "Nombre producto 5",
      "precio": 25325.12,
      "cantidad": 1,
      "envioGratis": true,
    },
  ];

  // Método para eliminar un artículo de la cesta
  void _eliminarArticulo(int index) {
    setState(() {
      articulos.removeAt(index);
    });
  }

  // Método para mostrar el diálogo de pago
  void _mostrarDialogoPago() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Método de Pago'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Seleccione su método de pago preferido:'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _mostrarMensajePago('Nequi');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Pagar con Nequi', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _mostrarMensajePago('Daviplata');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Pagar con Daviplata', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _contactarAdministrador();
                },
                child: const Text('Contactar al administrador'),
              ),
            ],
          ),
        );
      },
    );
  }

  // Método para mostrar mensaje de pago exitoso
  void _mostrarMensajePago(String metodo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pago Exitoso'),
          content: Text('Su pago con $metodo ha sido procesado correctamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  // Método para contactar al administrador
  void _contactarAdministrador() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Contactar Administrador'),
          content: const Text('Por favor comuníquese con el administrador al número: 300-1234567'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  // Método para calcular el total de la compra
  double _calcularTotal() {
    double total = 0;
    for (var articulo in articulos) {
      total += articulo["precio"] * articulo["cantidad"];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cesta (${articulos.length})"),
        backgroundColor: Colors.orange,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Lista de artículos
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: articulos.length,
              itemBuilder: (context, index) {
                final articulo = articulos[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(articulo["nombre"]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Cantidad: ${articulo["cantidad"]}"),
                        Text("COP ${articulo["precio"].toStringAsFixed(2)}"),
                        if (articulo["envioGratis"])
                          const Text("Envío gratis", style: TextStyle(color: Colors.green)),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _eliminarArticulo(index),
                    ),
                  ),
                );
              },
            ),
            // Resumen de la compra
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Divider(),
                  const Text("Todos", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("COP ${_calcularTotal().toStringAsFixed(2)}", style: const TextStyle(fontSize: 16)),
                  const Text("Ahorrado: COP 391.18", style: TextStyle(color: Colors.green)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _mostrarDialogoPago,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: Text("Pagar (${articulos.length})", style: const TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Comprar"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: "Cesta"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Mi Cuenta"),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}