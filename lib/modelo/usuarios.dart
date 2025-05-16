import 'dart:convert';
import 'roles.dart';

class Usuario {
  int _id = 0;
  String _usuario = "";
  int _celular = 0;
  String _correo = "";
  String _contrasena = "";
  Rol _idRol = Rol();
  bool _estado = true; // true = usuario activo, false = inactivo

  Usuario(
      {int id = 0,
      String usuario = "",
      int celular = 0,
      String correo = "",
      String contrasena = "",
      Rol? rol,
      bool estado = true}) {
    this._id = id;
    this._usuario = usuario;
    this._celular = celular;
    this._correo = correo;
    this._contrasena = contrasena;
    this._idRol = rol ?? Rol();
    this._estado = estado;
  }

  // Geters

  int get getId => this._id;
  String get getUsuario => this._usuario;
  int get getCelular => this._celular;
  String get getCorreo => this._correo;
  String get getContrasena => this._contrasena;
  Rol? get getRol => this._idRol;
  bool get getEstado => this._estado;

  // Setters

  void setId(int id) => this._id = id;
  void setUsuario(String usuario) => this._usuario = usuario;
  void setCelular(int celular) => this._celular = celular;
  void setCorreo(String correo) => this._correo = correo;
  void setContrasena(String contrasena) => this._contrasena = contrasena;
  void setRol(Rol idRol) => this._idRol = idRol;
  void setEstado(bool estado) => this._estado = estado;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
      id: json["id"],
      usuario: json["usuario"],
      celular: json["celular"],
      correo: json["correo"],
      contrasena: json["contrasena"],
      rol: json["idRol"] == null ? null : Rol.fromJson(json["idRol"]),
      estado: json["estado"],
  );

  Map<String, dynamic> toJson() => {
      "id": _id,
      "usuario": _usuario,
      "celular": _celular,
      "correo": _correo,
      "contrasena": _contrasena,
      "idRol": _idRol?.toJson(),
      "estado": _estado,
  };
}

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());
