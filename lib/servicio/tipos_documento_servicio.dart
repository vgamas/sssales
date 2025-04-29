import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/tipos_documento.dart';

class TiposDocumentoServicio {
  final String _prefijo = "tiposdoc/";

  // Cargar la lista de roles

  Future<List<TipoDocumento>> listarTodos() async {
    final String endPoint = "listar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return tiposDocumentoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw ("No hay Tipos de documento registrados");
      } else {
        throw ("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

  // Buscar un tipo de cliente por su ID

  Future<TipoDocumento> buscarPorId(String id) async {
    final String endPoint = "id/${id}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return tipoDocumentoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        throw ("Ese codigo ya se encuentra creado: ${id}");
      } else {
        throw ("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

  // Agregar un nuevo Tipo de cliente

  Future<TipoDocumento> agregar(TipoDocumento nTipo) async {
    final String endPoint = "agregar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.post(uri,
          headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: tipoDocumentoToJson(nTipo)
    );

    if (response.statusCode == HttpStatus.created) {
      return tipoDocumentoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        throw ("Ya hay un tipo de documento registrado con ese codigo: ${nTipo.getId}");
      } else {
        throw ("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

  // Actualizar un Tipo de cliente existente

  Future<TipoDocumento> actualizar(TipoDocumento nTipo) async {
    final String endPoint = "actualizar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.put(uri,
          headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: tipoDocumentoToJson(nTipo)
    );

    if (response.statusCode == HttpStatus.ok) {
      return tipoDocumentoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw ("No hay un Tipo de documento almacenado con ese codigo: ${nTipo.getId}");
      } else {
        throw ("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }
}