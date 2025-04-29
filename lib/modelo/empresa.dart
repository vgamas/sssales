import 'dart:convert';
import 'ciudades.dart';

class Empresa {
  String _nombre = "";
  String _direccion = "";
  int _telefonoFijo = 0;
  int _telefonoCelular = 0;
  Ciudad? _idCiudad = null;
  String _urlLogo = "";
  String _nombreTienda = "";
  bool _estado = true;

  Empresa(
      {String nombre = "",
      String direccion = "",
      int telefonoFijo = 0,
      int telefonoCelular = 0,
      Ciudad? idCiudad = null,
      String url = "",
      String nombreTienda = "",
      bool estado = true}) {
    this._nombre = nombre;
    this._direccion = direccion;
    this._telefonoFijo = telefonoFijo;
    this._telefonoCelular = telefonoCelular;
    this._idCiudad = idCiudad;
    this._urlLogo = url;
    this._nombreTienda = nombreTienda;
    this._estado = estado;
  }

// Getters

  String get getNombre => this._nombre;
  String get getDireccion => this._direccion;
  int get getTelefonoFijo => this._telefonoFijo;
  int get getTelefonoCelular => this._telefonoCelular;
  Ciudad? get getCiudad => this._idCiudad;
  String get getUrlLogo => this._urlLogo;
  String get getNombreTienda => this._nombreTienda;
  bool get getEstado => this._estado;

  // Setters

  void setNombre(String nombre) => this._nombre = nombre;
  void setDireccion(String direccion) => this._direccion = direccion;
  void setTelefonoFijo(int telefono) => this._telefonoFijo = telefono;
  void setTelefonoCelular(int telefono) => this._telefonoCelular = telefono;
  void setCiudad(Ciudad idCiudad) => this._idCiudad = idCiudad;
  void setUrlLogo(String url) => this._urlLogo = url;
  void setNombreTienda(String nombre) => this._nombreTienda = nombre;
  void setEstado(bool estado) => this._estado = estado;

factory Empresa.fromJson(Map<String, dynamic> json) => Empresa(
        nombre: json["nombre"],
        direccion: json["direccion"],
        telefonoFijo: json["telefonoFijo"],
        telefonoCelular: json["telefonoCelular"],
        idCiudad: Ciudad.fromJson(json["idCiudad"]),
        url: json["urlLogo"],
        nombreTienda: json["nombreTienda"],
        estado: json["estado"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": _nombre,
        "direccion": _direccion,
        "telefonoFijo": _telefonoFijo,
        "telefonoCelular": _telefonoCelular,
        "idCiudad": _idCiudad?.toJson(),
        "urlLogo": _urlLogo,
        "nombreTienda": _nombreTienda,
        "estado": _estado,
    };
}

Empresa empresaFromJson(String str) => Empresa.fromJson(json.decode(str));

String empresaToJson(Empresa data) => json.encode(data.toJson());