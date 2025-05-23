import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/clientes.dart';

class ClienteServicio {
  final String _prefijo = "clientes/";

  // Buscar el cliente que corresponde a un usuario

  Future<Cliente?> buscarPorUsuario(int idUsuario) async {
    final String endPoint = "usuario/${idUsuario}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return clienteFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay un cliente asociado a ese id de usuario: ${idUsuario}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Buscar el cliente por su Id

  Future<Cliente?> buscarPorId(int idCliente) async {
    final String endPoint = "id/${idCliente}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return clienteFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay un cliente asociado a ese id: ${idCliente}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Buscar Clientes por su nombre

  Future<List<Cliente>?> buscarPorNombre(String nombre) async {
    final String endPoint = "nombre/${nombre}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return clientesFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay clientes con ese nombre: ${nombre}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Agregar un nuevo cliente

  Future<Cliente?> agregar(Cliente nuevoCliente) async {
    final String endPoint = "agregar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: clienteToJson(nuevoCliente));

    if (response.statusCode == HttpStatus.created) {
      return clienteFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        print(
            "Error al crear el cliente, documento, correo, celular o usuario ya creados anteriormente");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Actualizar un cliente

  Future<Cliente?> actualizar(Cliente nuevoCliente) async {
    final String endPoint = "actualizar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: clienteToJson(nuevoCliente));

    if (response.statusCode == HttpStatus.ok) {
      return clienteFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        print(
            "Error al actualizar el cliente, documento, correo, celular o usuario ya creados anteriormente");
      } else {
        if (response.statusCode == HttpStatus.notFound) {
          print("No existe un cliente con ese id: ${nuevoCliente.getId}");
        } else {
          print("Error desconocido, codigo ${response.statusCode}");
        }
      }
    }

    return null;
  }
}
