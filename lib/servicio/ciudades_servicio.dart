import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/ciudades.dart';

class CiudadesServicio {
  final String _prefijo = "ciudades/";

  // Buscar una ciudad por su id

  Future<Ciudad?> buscarCiudadPorId(int id) async {
    final String endPoint = "id/${id}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    print(response.body);

    if (response.statusCode == HttpStatus.ok) {
      return ciudadFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay ciudad con ese id ${id}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

// Lista todas las ciudades que pertenecen a un departamento

  Future<List<Ciudad>?> buscarCiudadesPorDepartamento(int dpto) async {
    final String endPoint = "dpto/${dpto}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return ciudadesFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay ciudades con ese codigo de departamento: ${dpto}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

// Lista todas las ciudades que pertenecen a un departamento y que cumplen con un nombre

  Future<List<Ciudad>?> buscarCiudadesPorNombre(int dpto, String nombre) async {
    final String endPoint = "nombre/?dpto=${dpto}&ciudad=${nombre}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return ciudadesFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay ciudades con ese codigo de departamento: ${dpto}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

// Agregar una ciudad a un departamento

  Future<Ciudad?> agregar(Ciudad nuevaCiudad) async {
    final String endPoint = "agregar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: ciudadToJson(nuevaCiudad));

    if (response.statusCode == HttpStatus.created) {
      return ciudadFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        print(
            "Ya hay una ciudad creada con ese codigo: ${nuevaCiudad.getCodigo}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

// Actualizar una ciudad

  Future<Ciudad?> actualizar(Ciudad nuevaCiudad) async {
    final String endPoint = "actualizar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: ciudadToJson(nuevaCiudad));

    if (response.statusCode == HttpStatus.ok) {
      return ciudadFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        print(
            "Ya hay una ciudad creada con ese codigo: ${nuevaCiudad.getCodigo}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }
}
