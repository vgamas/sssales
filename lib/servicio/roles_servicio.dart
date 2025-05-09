import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/roles.dart';

class RolesServicio {
  final String _prefijo = "roles/";

  // Cargar la lista de roles

  Future<List<Rol>?> listarTodos() async {
    final String endPoint = "listar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return rolesFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay roles registrados");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Buscar un rol por su ID

  Future<Rol?> buscarPorId(int id) async {
    final String endPoint = "id/${id}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return rolFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay roles registrados con ese id: ${id}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Buscar un rol por su nombre

  Future<Rol?> buscarPorNombre(String nombre) async {
    final String endPoint = "nombre/${nombre}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return rolFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay roles registrados con ese nombre: ${nombre}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Agregar un nuevo rol

  Future<Rol?> agregar(Rol rol) async {
    final String endPoint = "agregar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: rolToJson(rol));

    if (response.statusCode == HttpStatus.created) {
      return rolFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        print("Ya hay un rol registrado con ese nombre: ${rol.getNombre}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Agregar un nuevo rol

  Future<Rol?> actualizar(Rol rol) async {
    final String endPoint = "actualizar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: rolToJson(rol));

    if (response.statusCode == HttpStatus.ok) {
      return rolFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        print("Ya hay un rol registrado con ese nombre: ${rol.getNombre}");
      } else {
        if (response.statusCode == HttpStatus.notFound) {
          print("No se encuentra un rol con ese id: ${rol.getId}");
        } else {
          print("Error desconocido, codigo ${response.statusCode}");
        }
      }
    }

    return null;
  }
}
