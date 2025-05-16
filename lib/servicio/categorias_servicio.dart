import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/categorias.dart';

class CategoriaServicio {

  final String _prefijo = "categorias/";

  // Listar todas las categorias

  Future<List<Categoria>> listar() async {
    final String endPoint = "todas";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return categoriasFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw("No hay categorias creadas");
      } else {
        throw("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

  // Buscar una categoria por su ID

  Future<Categoria> buscarPorId(int id) async {
    final String endPoint = "id/${id}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri,
          headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
    );

    if (response.statusCode == HttpStatus.ok) {
      return categoriaFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw("No se encuentra una categoria con ese id: ${id}");
      } else {
        throw("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

  // Buscar una categoria por su Nombre

  Future<List<Categoria>> buscarPorNombre(String nombre) async {
    final String endPoint = "partenombre/${nombre}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri,
          headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
    );

    if (response.statusCode == HttpStatus.ok) {
      return categoriasFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw("No se encuentra una categoria con ese id: ${nombre}");
      } else {
        throw("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

  // Agregar una categoria

  Future<Categoria> agregar(Categoria nuevaCategoria) async {
    final String endPoint = "agregar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.post(uri,
          headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      body: categoriaToJson(nuevaCategoria)
    );

    if (response.statusCode == HttpStatus.created) {
      return categoriaFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        throw("Ya existe una categoria con ese nombre: ${nuevaCategoria.getNombre}");
      } else {
        if (response.statusCode == HttpStatus.noContent) {
          throw("La url de la imagen no puede estar vacia");
        } else {
          throw("Error desconocido, codigo ${response.statusCode}");
        }
      }
    }
  }

  // actualizar una categoria

  Future<Categoria> actualizar(Categoria nuevaCategoria) async {
    final String endPoint = "actualizar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.put(uri,
          headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      body: categoriaToJson(nuevaCategoria)
    );

    if (response.statusCode == HttpStatus.ok) {
      return categoriaFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        throw("Ya existe una categoria con ese nombre: ${nuevaCategoria.getNombre}");
      } else {
        if (response.statusCode == HttpStatus.notFound) {
          throw("No existe una categoria con ese ID: ${nuevaCategoria.getId}");
        } else {
          if (response.statusCode == HttpStatus.noContent) {
            throw("La url de la imagen no puede estar vacia");
          } else {
            throw("Error desconocido, codigo ${response.statusCode}");
        }
       }
      }
    }
  }
}