import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/carrito.dart';

class CarritoServicio {
  final String _prefijo = "carrito/";

  // Listar el carrito de un cliente

  Future<List<Carrito>> listarPorCliente(int idCliente) async {
    final String endPoint = "listar/${idCliente}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return carritosFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw ("No hay productos en el carrito del cliente con id: ${idCliente}");
      } else {
        throw ("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

  // Eliminar un articulo del carrito

  Future<Carrito> borrarPorId(int idArticulo) async {
    final String endPoint = "eliminar/${idArticulo}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.delete(uri);

    if (response.statusCode == HttpStatus.ok) {
      return carritoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw ("No se encuentra el articulo con id ${idArticulo} en el carrito");
      } else {
        throw ("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

  // Limpiar el carrito de un cliente

  Future<Carrito> borrarPorCliente(int idCliente) async {
    final String endPoint = "eliminarcliente/${idCliente}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.delete(uri);

    if (response.statusCode == HttpStatus.ok) {
      return carritoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw ("El cliente con id ${idCliente} no tiene articulos en el carrito");
      } else {
        throw ("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

  // Agregar un articulo al carrito

  Future<Carrito> agregar(Carrito nuevoArticulo) async {
    final String endPoint = "agregar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: carritoToJson(nuevoArticulo));

    if (response.statusCode == HttpStatus.created) {
      return carritoFromJson(response.body);
    } else {
      throw ("Error desconocido, codigo ${response.statusCode}");
    }
  }

  // Actualizar un articulo al carrito

  Future<Carrito> actualizar(Carrito articulo) async {
    final String endPoint = "actualizar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: carritoToJson(articulo));

    if (response.statusCode == HttpStatus.created) {
      return carritoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw ("No se ha encontrado un articulo con el id ${articulo.getId}");
      } else {
        throw ("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }
}
