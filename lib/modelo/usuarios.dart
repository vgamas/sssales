import 'dart:ffi';
import 'roles.dart';

class Usuario {
  Uint32 _id;
  String _usuario;
  String _nombre;
  String _contrasena;
  Rol? _rol;
  bool _estado = true;

  Usuario(
      this._id, this._usuario, this._nombre, this._contrasena, Uint16 idRol) {
    this._rol = buscarRolPorId(idRol);
  }

  // Geters

  Uint32 getId() {
    return this._id;
  }

  String getUsuario() {
    return this._usuario;
  }

  String getNombre() {
    return this._nombre;
  }

  String getContrasena() {
    return this._contrasena;
  }

  Rol? getRol() {
    return this._rol;
  }

  bool getEstado() {
    return this._estado;
  }

  // Setters

  void setId(Uint32 id) {
    this._id = id;
  }

  void setUsuario(String usuario) {
    this._usuario = usuario;
  }

  void setNombre(String nombre) {
    this._nombre = nombre;
  }

  void setContrasena(String contrasena) {
    this._contrasena = contrasena;
  }

  void setRol(Rol? rol) {
    this._rol = rol;
  }

  void setEstado(bool estado) {
    this._estado = estado;
  }
}

// Metodos para el crud

Usuario? buscarUsuarioPorId(Uint32 id) {
  Usuario? usuario = null;

  // buscar el usuario en la tabla

  return usuario;
}

Usuario? buscarUsuarioPorUsuario(String usuario) {
  Usuario? usuario = null;

  // buscar el usuario en la tabla

  return usuario;
}

int actualizarUsuario(Usuario usuario) {
  int estado = 0;

  if (buscarUsuarioPorId(usuario.getId()) != null) {
    // actualizar el usuario en la base de datos
    // si hay error cambiar el valor de estado
  } else {
    // es un usuario nuevo, hay que crearlo
    // si hay error cambiar el valor de estado
  }

  return estado;
}
