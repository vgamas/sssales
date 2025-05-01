import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/usuarios.dart';

class UsuarioServicio {

  final String _prefijo = "usuario/";

  // Valida si el usuario existe y si corresponde al usuario y la contraseña

  Future<Usuario> validar(String usuario, String contrasena) async {
    final String endPoint = "validar/?usuario=${usuario}&contrasena=${contrasena}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    if(response.statusCode == HttpStatus.ok) {
      return usuarioFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.unauthorized) {
        throw("Ingreso no permitido, el usuario y contraseña no corresponden");
      } else {
        if (response.statusCode == HttpStatus.notFound) {
          throw("Usuario no encontrado");
        } else {
          throw("Error desconocido, codigo ${response.statusCode}");
        }
      }
    }
  }

  // Agregar un usuario

  Future<Usuario> agregar(Usuario nuevoUsuario) async {
    final endPoint = "agregar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.post(uri,
      headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: usuarioToJson(nuevoUsuario)
    );

    if (response.statusCode == HttpStatus.created) {
      return usuarioFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.alreadyReported) {
        throw("Un usuario con la misma informacion (usuario, telefono o correo) ya esta registrado");
      } else {
          throw("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

  // Actualizar un usuario

  Future<Usuario> actualizar(Usuario usuario) async {
    final endPoint = "agregar";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.put(uri,
      headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: usuarioToJson(usuario)
    );

    if (response.statusCode == HttpStatus.ok) {
      return usuarioFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw("No se encuentra un usuario con ese id: ${usuario.getId}");
      } else {
        if (response.statusCode == HttpStatus.alreadyReported) {
          throw("Ya se encuentra el usuario, correo o celular en otro usuario");
        } else {
          throw("Error desconocido, codigo ${response.statusCode}");
        }
      }
    }
  }

}