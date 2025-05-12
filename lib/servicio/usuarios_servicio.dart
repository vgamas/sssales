import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/usuarios.dart';

class UsuarioServicio {
  final String _prefijo = "usuario/";

  // Valida si el usuario existe y si corresponde al usuario y la contraseña

  Future<Usuario?> validar(String usuario, String contrasena) async {
    final String endPoint =
        "validar/?usuario=${usuario}&contrasena=${contrasena}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return usuarioFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.unauthorized) {
        print("Ingreso no permitido, el usuario y contraseña no corresponden");
      } else {
        if (response.statusCode == HttpStatus.notFound) {
          print("Usuario no encontrado");
        } else {
          print("Error desconocido, codigo ${response.statusCode}");
        }
      }
    }

    return null;
  }

  // Agregar un usuario

  Future<Usuario?> agregar(Usuario nuevoUsuario) async {
    final endPoint = "agregar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: usuarioToJson(nuevoUsuario));

    if (response.statusCode == HttpStatus.created) {
      return usuarioFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        print(
            "Un usuario con la misma informacion (usuario, telefono o correo) ya esta registrado");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }

  // Actualizar un usuario

  Future<Usuario?> actualizar(Usuario usuario) async {
    final endPoint = "actualizar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: usuarioToJson(usuario));

    if (response.statusCode == HttpStatus.ok) {
      return usuarioFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No se encuentra un usuario con ese id: ${usuario.getId}");
      } else {
        if (response.statusCode == HttpStatus.alreadyReported) {
          print(
              "Ya se encuentra el nombre de usuario, correo o celular en otro usuario");
        } else {
          print("Error desconocido, codigo ${response.statusCode}");
        }
      }
    }

    return null;
  }

  // Buscar un usuario por su id
  Future<Usuario?> buscarPorId(int idUsuario) async {
    final String endPoint = "id=${idUsuario}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      return usuarioFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        print("No hay usuario con ese id: ${idUsuario}");
      } else {
        print("Error desconocido, codigo ${response.statusCode}");
      }
    }

    return null;
  }
}
