import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/ventas.dart';

class VentaServicio {
  final String _prefijo = "ventas/";

// Consultar una factura

  Future<Venta> buscarFactura(int factura) async {
    final String endPoint = "factura/${factura}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return ventaFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw ("No hay factura con ese numero ${factura}");
      } else {
        throw ("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }
}
