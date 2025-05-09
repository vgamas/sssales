import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/productos.dart';

class ProductoServicio {
  final String _prefijo = "productos/";

  // Buscar los productos de una categoria

  Future<List<Producto>?> buscarPorCategoria(int idCategoria) async {
    final String endPoint = "categoria/${idCategoria}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return productosFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay productos para la categoria id: ${idCategoria}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Buscar los productos por su nombre en todas las categorias

  Future<List<Producto>?> buscarPorNombre(String nombre) async {
    final String endPoint = "nombre/${nombre}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return productosFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay productos con ese nombre: ${nombre}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Buscar todos los productos de un proveedor

  Future<List<Producto>?> buscarPorProveedor(int idProveedor) async {
    final String endPoint = "proveedor/${idProveedor}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return productosFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay productos de ese proveedor codigo: ${idProveedor}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Buscar todos los productos que aparecen como destacados

  Future<List<Producto>?> buscarDestacados() async {
    final String endPoint = "destacados";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return productosFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay productos destacados actualmente");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Buscar un producto por su codigo

  Future<Producto?> buscarPorCodigo(String codigo) async {
    final String endPoint = "codigo/${codigo}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return productoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay productos creados con ese codigo: {$codigo}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Agragar un producto nuevo

  Future<Producto?> agregar(Producto nuevoProducto) async {
    final String endPoint = "agregar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: productoToJson(nuevoProducto));

    if (response.statusCode == HttpStatus.created) {
      return productoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        print(
            "Ya existe un producto creado con ese codigo: ${nuevoProducto.getCodigo}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Actualizar un producto

  Future<Producto?> actualizar(Producto producto) async {
    final String endPoint = "actualizar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: productoToJson(producto));

    if (response.statusCode == HttpStatus.ok) {
      return productoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("Ya existe un producto creado con ese id: ${producto.getId}");
      } else {
        if (response.statusCode == HttpStatus.alreadyReported) {
          print("Ya existe otro producto con ese codigo ${producto.getCodigo}");
        } else {
          print("Error desconocido, codigo ${response.statusCode}");
        }
      }
    }

    return null;
  }

  // Eliminar un producto

  Future<Producto?> eliminar(int idProducto) async {
    final String endPoint = "eliminar/${idProducto}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.delete(uri);

    if (response.statusCode == HttpStatus.ok) {
      return productoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No existe un producto creado con ese id: ${idProducto}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }
}
