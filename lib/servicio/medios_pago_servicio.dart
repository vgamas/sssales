import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/medios_pago.dart';

class MediosPagoServicio {
  final String _prefijo = "medios/";

  // Listar todos los medios de pago

  Future<List<MedioPago>?> listarTodos() async {
    final String endPoint = "listar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return mediosPagoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay medios de pago creados");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Busca un medio de pago por su id

  Future<MedioPago?> buscarPorId(int id) async {
    final String endPoint = "id/${id}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return medioPagoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay medios de pago creados con ese id ${id}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Busca un medio de pago por su nombre

  Future<MedioPago?> buscarPorNombre(String nombre) async {
    final String endPoint = "nombre/${nombre}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return medioPagoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay medios de pago creados con ese nombre ${nombre}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Agregar un nuevo medio de pago

  Future<MedioPago?> agregar(MedioPago nuevoMedio) async {
    final String endPoint = "agregar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: medioPagoToJson(nuevoMedio));

    if (response.statusCode == HttpStatus.created) {
      return medioPagoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        print(
            "Ya hay un medio de pago creado con ese nombre ${nuevoMedio.getNombre}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Actualizar un medio de pago

  Future<MedioPago?> actualizar(MedioPago nuevoMedio) async {
    final String endPoint = "actualizar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: medioPagoToJson(nuevoMedio));

    if (response.statusCode == HttpStatus.ok) {
      return medioPagoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        print(
            "Ya hay un medio de pago creado con ese nombre ${nuevoMedio.getNombre}");
      } else {
        if (response.statusCode == HttpStatus.notFound) {
          print("No hay un medio de pago con ese id: ${nuevoMedio.getId}");
        } else {
          print("Error desconocido, codigo ${response.statusCode}");
        }
      }
    }

    return null;
  }
}
