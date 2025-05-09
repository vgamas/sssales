import 'dart:io';
import 'conexion.dart';

import 'package:http/http.dart' as http;
import '../modelo/departamentos.dart';

class DepartamentosServicio {
  final String _prefijo = "dptos/";

  // Buscar un departamento por su ID

  Future<Departamento?> buscarPorId(int id) async {
    final String endPoint = "id/${id}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return dptoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay departamentos para mostrar");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Trae la lista de todos los departamentos que se encuentran en la base

  Future<List<Departamento>?> listarDepartamentos() async {
    final String endPoint = "listar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return departamentoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay departamentos para mostrar");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Trae la lista de todos los departamentos que se cumplen con una porcion del nombre

  Future<List<Departamento>?> buscarPorNombre(String nombre) async {
    final String endPoint = "nombre/${nombre}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return departamentoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay departamentos para mostrar");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Agregar un nuevo departamento

  Future<Departamento?> agregar(Departamento nDpto) async {
    final String endPoint = "agregar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: dptoToJson(nDpto));

    if (response.statusCode == HttpStatus.created) {
      return dptoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        print(
            "un departamento con ese código: ${nDpto.getCodigo} o nombre: ${nDpto.getNombre} ya se encuentra en la base de datos");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Acturalizar un departamento

  Future<Departamento?> actualizar(Departamento nDpto) async {
    final String endPoint = "actualizar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: dptoToJson(nDpto));

    print(uri);
    print(dptoToJson(nDpto));
    print(response.body);

    if (response.statusCode == HttpStatus.ok) {
      return dptoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        print(
            "un departamento con ese código: ${nDpto.getCodigo} o nombre: ${nDpto.getNombre} ya se encuentra en la base de datos");
      } else {
        if (response.statusCode == HttpStatus.notFound) {
          print(
              "Ese codigo de departamento: ${nDpto.getCodigo} no se encuentra en la base de datos");
        } else {
          print("Error desconocido, codigo ${response.statusCode}");
        }
      }
    }

    return null;
  }
}
