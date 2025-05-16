import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/empresa.dart';


class EmpresaServicio {
  final String _prefijo = "empresa/";

  // Traer la informacion de la empresa

  Future<Empresa> traer() async {
    final String endPoint = "traer";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return empresaFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw ("No hay Tipos de documento registrados");
      } else {
        throw ("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

  // Agregar una empresa cuando no hay una ya creada

  Future<Empresa> agregar(Empresa nEmpresa) async {
    final String endPoint = "agregar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.post(uri,
              headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: empresaToJson(nEmpresa)
    );

    if (response.statusCode == HttpStatus.created) {
      return empresaFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        throw ("Ya existe una empresa creada");
      } else {
        throw ("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

  // Actualiza la informacion de la empresa cuando ya hay una creada

  Future<Empresa> actualizar(Empresa nEmpresa) async {
    final String endPoint = "actualizar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.put(uri,
              headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: empresaToJson(nEmpresa)
    );

    if (response.statusCode == HttpStatus.ok) {
      return empresaFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw ("No hay una empresa creada");
      } else {
        throw ("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

  // Actualiza solamente el estado de la empresa

  Future<Empresa> actualizarEstado(bool nEstado) async {
    final String endPoint = "estado/${nEstado}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.put(uri);

    if (response.statusCode == HttpStatus.ok) {
      return empresaFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw ("No hay una empresa creada");
      } else {
        throw ("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

}