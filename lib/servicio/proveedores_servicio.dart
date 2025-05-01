import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/proveedores.dart';

class ProveedorServicio {

  final String _prefijo = "proveedor/";

  // Listar todos los proveedores

  Future<List<Proveedor>> listarTodos() async {
    final String endPoint = "todos";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if(response.statusCode == HttpStatus.ok) {
      return proveedoresFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw("No hay proveedores creados");
      } else {
        throw("Error desconocido, codigo ${response.statusCode}");
      }
    } 
  }

  // Buscare un proveedor por su ID

  Future<Proveedor> buscarPorId(int id) async {
    final String endPoint = "id/${id}";
    var uri = Uri.parse(url +_prefijo + endPoint);
    var response = await http.get(uri);

    if(response.statusCode == HttpStatus.ok) {
      return proveedorFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw("No hay proveedores creados con ese codigo ${id}");
      } else {
        throw("Error desconocido, codigo ${response.statusCode}");
      }
    } 
  }

  // Buscar proveedores por su Nombre

  Future<List<Proveedor>> buscarPorNombre(String nombre) async {
    final String endPoint = "partenombre/${nombre}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if(response.statusCode == HttpStatus.ok) {
      return proveedoresFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw("No hay proveedores creados que tengan ese nombre ${nombre}");
      } else {
        throw("Error desconocido, codigo ${response.statusCode}");
      }
    } 
  }

  // Agregar un nuevo proveedor

  Future<Proveedor> agregar(Proveedor nProveedor) async {
    final String endPoint = "agregar";
    var uri = Uri.parse(url +_prefijo + endPoint);
    var response = await http.post(uri,
          headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      body: proveedorToJson(nProveedor)
    );

    if(response.statusCode == HttpStatus.created) {
      return proveedorFromJson(response.body);
    } else {
        throw("Error desconocido, codigo ${response.statusCode}");
    } 
  }

  // Actualiza los datos de un proveedor

  Future<Proveedor> actualizar(Proveedor nProveedor) async {
    final String endPoint = "actualizar";
    var uri = Uri.parse(url +_prefijo + endPoint);
    var response = await http.put(uri,
          headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      body: proveedorToJson(nProveedor)
    );

    if(response.statusCode == HttpStatus.ok) {
      return proveedorFromJson(response.body);
    } else {
      if(response.statusCode == HttpStatus.notFound) {
        throw("No existe un proveedor con ese id: ${nProveedor.getId}");
      } else {
        throw("Error desconocido, codigo ${response.statusCode}");
      }
    } 
  }
}