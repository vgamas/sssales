import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/detalle_ventas.dart';

class DetalleVentasServicio {
  final String _prefijo = "detalle_ventas/";

  // Consultar el detalle de una factura

  Future<List<DetalleVenta>?> consultarFactura(int numeroFactura) async {
    final String endPoint = "factura/${numeroFactura}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return detallesVentaFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay detalle de productos en la factura: ${numeroFactura}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }
    return null;
  }

  // Retorna una lista de numeros de factura donde se encuentra el codigo producto a buscacar

  Future<List<int>?> consultarProducto(int numeroProducto) async {
    final String endPoint = "producto/${numeroProducto}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return _convertir(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay facturas con ese producto id: ${numeroProducto}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }
    return null;
  }

  // Agregar un registro al detalle de la factura

  Future<DetalleVenta?> agregar(DetalleVenta articulo) async {
    final String endPoint = "agregar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: detalleVentaToJson(articulo));

    if (response.statusCode == HttpStatus.created) {
      return detalleVentaFromJson(response.body);
    } else {
      print("Error desconocido, codigo ${response.statusCode}");
    }

    return null;
  }
}

// Convierte una cadena en una lista de enteros, se usa para convertir la lista de facturas

List<int> _convertir(String cadena) {
  String subcadena = cadena.substring(1, cadena.length - 1);

  List<int> listaEnteros = subcadena.split(',').map((e) {
    return int.parse(e);
  }).toList();

  return listaEnteros;
}
