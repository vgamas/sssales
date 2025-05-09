import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/mensajes.dart';

class MensajeServicio {
  final String _prefijo = "mensaje/";

  // Listar todos los mensajes enviados o recibidos por un usuario

  Future<List<Mensaje>?> listarPorUsuario(int idUsuario) async {
    final String endPoint = "remite/${idUsuario}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return mensajesFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print(
            "No hay mensajes enviados o recibidos de ese usuario id ${idUsuario}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Listar todos los mensajes entre dos usuarios

  Future<List<Mensaje>?> listarEntreUsuarios(
      int remitente, int destinatario) async {
    final String endPoint =
        "destino/?remite=${remitente}&destino=${destinatario}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return mensajesFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print(
            "No hay mensajes enviados entre el usuario id: ${remitente} y el usuario id ${destinatario}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Listar todos los mensajes entre dos usuarios

  Future<List<Mensaje>?> listarEntreFechas(
      int remitente, DateTime fechaInicial, DateTime fechaFinal) async {
    final String endPoint =
        "fechas/?remite=${remitente}&inicial=${fechaInicial.year.toString().padLeft(4, '0')}-${fechaInicial.month.toString().padLeft(2, '0')}-${fechaInicial.day.toString().padLeft(2, '0')}&final=${fechaFinal.year.toString().padLeft(4, '0')}-${fechaFinal.month.toString().padLeft(2, '0')}-${fechaFinal.day.toString().padLeft(2, '0')}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return mensajesFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print(
            "No hay mensajes del usuario id: ${remitente} entre ${fechaInicial} y  ${fechaFinal}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Listar todos los mensajes de un remitente con un asunto en particular

  Future<List<Mensaje>?> listarPorAsunto(int remitente, String asunto) async {
    final String endPoint = "asunto/?remite=${remitente}&asunto=${asunto}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return mensajesFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print(
            "No hay mensajes del usuario id: ${remitente} con ese asunto ${asunto}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Agregar un nuevo mensaje

  Future<Mensaje?> agregar(Mensaje nuevoMensaje) async {
    final String endPoint = "agregar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: mensajeToJson(nuevoMensaje));

    if (response.statusCode == HttpStatus.created) {
      return mensajeFromJson(response.body);
    } else {
      print("Error desconocido, codigo ${response.statusCode}");
    }

    return null;
  }
}
