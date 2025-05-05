import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/clientes.dart';


class ClienteServicio {

  final String _prefijo = "clientes/";

  // Buscar el cliente que corresponde a un usuario

  Future <Cliente> buscarPorUsuario(int idUsuario) async {
    final String endPoint = "usuario/${idUsuario}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return clienteFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw("No hay un cliente asociado a ese id de usuario: ${idUsuario}");
      } else {
        throw("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

  // Buscar el cliente por su Id

  Future <Cliente> buscarPorId(int idCliente) async {
    final String endPoint = "id/${idCliente}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return clienteFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw("No hay un cliente asociado a ese id: ${idCliente}");
      } else {
        throw("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

  // Buscar Clientes por su nombre

  Future <List<Cliente>> buscarPorNombre(String nombre) async {
    final String endPoint = "nombre/${nombre}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return clientesFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw("No hay clientes con ese nombre: ${nombre}");
      } else {
        throw("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

}