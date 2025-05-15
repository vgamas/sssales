import 'dart:convert';
import 'roles.dart';

class Usuario {
  int id;
  String usuario;
  int celular;
  String correo;
  String contrasena;
  Rol idRol;
  bool estado; // true = usuario activo, false = inactivo

  Usuario(
      {required this.id,
      required this.usuario,
      required this.celular,
      required this.correo,
      required this.contrasena,
      required this.idRol,
      required this.estado});

  // Geters

  int get getId => this.id;
  String get getUsuario => this.usuario;
  int get getCelular => this.celular;
  String get getCorreo => this.correo;
  String get getContrasena => this.contrasena;
  Rol get getRol => this.idRol;
  bool get getEstado => this.estado;

  // Setters

  void setId(int id) => this.id = id;
  void setUsuario(String usuario) => this.usuario = usuario;
  void setCelular(int celular) => this.celular = celular;
  void setCorreo(String correo) => this.correo = correo;
  void setContrasena(String contrasena) => this.contrasena = contrasena;
  void setRol(Rol idRol) => this.idRol = idRol;
  void setEstado(bool estado) => this.estado = estado;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
      id: json["id"],
      usuario: json["usuario"],
      celular: json["celular"],
      correo: json["correo"],
      contrasena: json["contrasena"],
      idRol: Rol.fromJson(json["idRol"]),
      estado: json["estado"],
  );

  Map<String, dynamic> toJson() => {
      "id": id,
      "usuario": usuario,
      "celular": celular,
      "correo": correo,
      "contrasena": contrasena,
      "idRol": idRol.toJson(),
      "estado": estado,
  };
}

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());
