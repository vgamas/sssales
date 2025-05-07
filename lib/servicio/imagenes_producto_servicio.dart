import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/imagenes_producto.dart';

class ImagenProductoServicio {
  final String _prefijo = "imagenproducto/";

  // Listar todas las imagenes de un producto

  Future<List<ImagenProducto>> listar(int idProducto) async {
    final endPoint = "listar/${idProducto}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return imagenesProductoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw ("No hay imagenes para el producto id: ${idProducto}");
      } else {
        throw ("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

  // Agregar una imagen al producto

  Future<ImagenProducto> agregar(ImagenProducto nuevaImagen) async {
    final endPoint = "agregar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: imagenProductoToJson(nuevaImagen));

    if (response.statusCode == HttpStatus.created) {
      return imagenProductoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw ("No hay creado un producto con ese id: ${nuevaImagen.getProducto.getId}");
      } else {
        throw ("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

  // Eliminar una imagen buscandola por su id

  Future<ImagenProducto> eliminar(int idImagen) async {
    final endPoint = "eliminar/${idImagen}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.delete(uri);

    if (response.statusCode == HttpStatus.ok) {
      return imagenProductoFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw ("No hay imagen de un producto con ese id: ${idImagen}");
      } else {
        throw ("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }
}
