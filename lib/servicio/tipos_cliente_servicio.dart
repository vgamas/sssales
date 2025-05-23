import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/tipos_cliente.dart';

class TiposClienteServicio {
  final String _prefijo = "tiposcli/";

  // Cargar la lista de roles

  Future<List<TipoCliente>?> listarTodos() async {
    final String endPoint = "listar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return tiposClienteFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay tipos de cliente registrados");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Buscar un tipo de cliente por su ID

  Future<TipoCliente?> buscarPorId(String id) async {
    final String endPoint = "id/${id}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return tipoClienteFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        print("Ese codigo ya se encuentra creado: ${id}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Agregar un nuevo Tipo de cliente

  Future<TipoCliente?> agregar(TipoCliente nTipo) async {
    final String endPoint = "agregar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: tipoClienteToJson(nTipo));

    if (response.statusCode == HttpStatus.created) {
      return tipoClienteFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        print(
            "Ya hay un tipo de documento registrado con ese codigo: ${nTipo.getId}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Actualizar un Tipo de cliente existente

  Future<TipoCliente?> actualizar(TipoCliente nTipo) async {
    final String endPoint = "actualizar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: tipoClienteToJson(nTipo));

    if (response.statusCode == HttpStatus.ok) {
      return tipoClienteFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print(
            "No hay un Tipo de Cliente almacenado con ese codigo: ${nTipo.getId}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }
}
