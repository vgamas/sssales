import 'dart:convert';
import 'ciudades.dart';

class Empresa {
  String nombre;
  String direccion;
  int telefonoFijo;
  int telefonoCelular;
  Ciudad idCiudad;
  String urlLogo;
  String nombreTienda;
  bool estado;

  Empresa(
      {required this.nombre,
      required this.direccion,
      required this.telefonoFijo,
      required this.telefonoCelular,
      required this.idCiudad,
      required this.urlLogo,
      required this.nombreTienda,
      required this.estado});
// Getters

  String get getNombre => this.nombre;
  String get getDireccion => this.direccion;
  int get getTelefonoFijo => this.telefonoFijo;
  int get getTelefonoCelular => this.telefonoCelular;
  Ciudad? get getCiudad => this.idCiudad;
  String get getUrlLogo => this.urlLogo;
  String get getNombreTienda => this.nombreTienda;
  bool get getEstado => this.estado;

  // Setters

  void setNombre(String nombre) => this.nombre = nombre;
  void setDireccion(String direccion) => this.direccion = direccion;
  void setTelefonoFijo(int telefono) => this.telefonoFijo = telefono;
  void setTelefonoCelular(int telefono) => this.telefonoCelular = telefono;
  void setCiudad(Ciudad idCiudad) => this.idCiudad = idCiudad;
  void setUrlLogo(String url) => this.urlLogo = url;
  void setNombreTienda(String nombre) => this.nombreTienda = nombre;
  void setEstado(bool estado) => this.estado = estado;

factory Empresa.fromJson(Map<String, dynamic> json) => Empresa(
        nombre: json["nombre"],
        direccion: json["direccion"],
        telefonoFijo: json["telefonoFijo"],
        telefonoCelular: json["telefonoCelular"],
        idCiudad: Ciudad.fromJson(json["idCiudad"]),
        urlLogo: json["urlLogo"],
        nombreTienda: json["nombreTienda"],
        estado: json["estado"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "direccion": direccion,
        "telefonoFijo": telefonoFijo,
        "telefonoCelular": telefonoCelular,
        "idCiudad": idCiudad.toJson(),
        "urlLogo": urlLogo,
        "nombreTienda": nombreTienda,
        "estado": estado,
    };
}

Empresa empresaFromJson(String str) => Empresa.fromJson(json.decode(str));

String empresaToJson(Empresa data) => json.encode(data.toJson());