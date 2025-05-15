import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/ventas.dart';

class VentaServicio {
  final String _prefijo = "ventas/";

// Consultar una factura

  Future<Venta?> buscarFactura(int factura) async {
    final String endPoint = "factura/${factura}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return ventaFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay factura con ese numero: ${factura}");
      } else {
        print("Error desconocido, codigo: ${response.statusCode}");
      }
    }

    return null;
  }

  // Consulta todas las ventas de un cliente

  Future<List<Venta>?> facturasDeCliente(int idCliente) async {
    final String endPoint = "cliente/${idCliente}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return ventasFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay facturas para ese cliente: ${idCliente}");
      } else {
        print("Error desconocido, codigo: ${response.statusCode}");
      }
    }

    return null;
  }

  // Consulta todas las ventas de un cliente entre un par de fechas

  Future<List<Venta>?> facturasDeClienteEntreFechas(
      int idCliente, DateTime fechaInicial, DateTime fechaFinal) async {
    final String endPoint =
        "cliente_fechas/?cliente=${idCliente}&fechaInicial=${fechaInicial.year.toString().padLeft(4, '0')}-${fechaInicial.month.toString().padLeft(2, '0')}-${fechaInicial.day.toString().padLeft(2, '0')}&fechaFinal=${fechaFinal.year.toString().padLeft(4, '0')}-${fechaFinal.month.toString().padLeft(2, '0')}-${fechaFinal.day.toString().padLeft(2, '0')}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return ventasFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print(
            "No hay facturas para ese cliente: ${idCliente} entre el ${fechaInicial} y el ${fechaFinal}");
      } else {
        print("Error desconocido, codigo: ${response.statusCode}");
      }
    }

    return null;
  }

  // Consulta todas las ventas de un cliente, el estado true es pagada y false no pagada

  Future<List<Venta>?> facturasDeClientePorEstado(
      int idCliente, bool pagada) async {
    final String endPoint =
        "cliente_pagada/?cliente=${idCliente}&pagada=${pagada}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return ventasFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print(
            "No hay facturas para ese cliente: ${idCliente} ${pagada ? 'Pagadas' : 'Sin pagar'}");
      } else {
        print("Error desconocido, codigo: ${response.statusCode}");
      }
    }

    return null;
  }

  // Consulta para el administrador, donde se muestran todas las facturas pagadas y no despachadas de todos los clientes

  Future<List<Venta>?> facturasNoDespachadas() async {
    final String endPoint = "no_despachada";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return ventasFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay facturas sin despachar");
      } else {
        print("Error desconocido, codigo: ${response.statusCode}");
      }
    }

    return null;
  }

  // Marcar una factura como pagada y le coloca la referencia del pago

  Future<Venta?> facturaPagada(int factura, String referencia) async {
    final String endPoint =
        "pagada/?factura=${factura}&referencia=${referencia}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.put(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      return ventaFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No se encuentra la factura ${factura}");
      } else {
        print("Error desconocido, codigo: ${response.statusCode}");
      }
    }

    return null;
  }

  // Agregar los datos del envio de una factura

  Future<Venta?> facturaDespachada(int factura, DateTime fechaEnvio,
      String empresaTransporte, String guia) async {
    final String endPoint =
        "despachada/?factura=${factura}&fecha=${fechaEnvio.year.toString().padLeft(4, '0')}-${fechaEnvio.month.toString().padLeft(2, '0')}-${fechaEnvio.day.toString().padLeft(2, '0')}&empresa=${empresaTransporte}&guia=${guia}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.put(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      return ventaFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No se encuentra la factura ${factura}");
      } else {
        print("Error desconocido, codigo: ${response.statusCode}");
      }
    }

    return null;
  }

  // Agregar una nueva factura

  Future<Venta?> agregar(Venta nuevaVenta) async {
    final String endPoint = "agregar";
    var uri = Uri.parse(url + _prefijo + endPoint);

    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: ventaToJson(nuevaVenta));

    if (response.statusCode == HttpStatus.created) {
      return ventaFromJson(response.body);
    } else {
      print("Error desconocido, codigo: ${response.statusCode}");
    }

    return null;
  }
}
