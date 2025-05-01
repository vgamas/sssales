import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
//import '../modelo/mensajes.dart';
import '../modelo/imagenes_mensaje.dart';

class ImagenMensajeServicio {
  final String _prefijo = "imgmsj/";

  // Lista las imagenes de un mensaje

  Future<List<ImagenMensaje>> listar(int idMensaje) async {
    final String endPoint = "listar/${idMensaje}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return imagenesMensajeFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw("No hay imagenes para el mensaje con id  ${idMensaje}");
      } else {
        throw("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

    // Agregar una nueva imagen al mensaje

  Future<ImagenMensaje> agregar(ImagenMensaje nuevaImagen) async {
    final String endPoint = "agregar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: imagenMensajeToJson(nuevaImagen)
      );
    
    if (response.statusCode == HttpStatus.created) {
      return imagenMensajeFromJson(response.body);
    } else {
        throw("Error desconocido, codigo ${response.statusCode}");
    }
  }

}