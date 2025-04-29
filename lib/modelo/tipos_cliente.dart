import 'dart:convert';

class TipoCliente {
  String _id = "";
  String _nombre = "";
  String _descripcion = "";

  TipoCliente({String id = "", String nombre = "", String descripcion = ""}) {
    this._id = id;
    this._nombre = nombre;
    this._descripcion = descripcion;
  }

  // Getters

  String get getId => this._id;
  String get getNombre => this._nombre;
  String get getDescripcion => this._descripcion;

  // Setters

  void setId(String id) => this._id = id;
  void setNombre(String nombre) => this._nombre = nombre;
  void setDescripcion(String descripcion) => this._descripcion = descripcion;

  factory TipoCliente.fromJson(Map<String, dynamic> json) => TipoCliente(
    id: json["id"],
    nombre: json["nombre"],
    descripcion: json["descripcion"],
  );

  Map<String, dynamic> toJson() => {
      "id": _id,
      "nombre": _nombre,
      "descripcion": _descripcion,
  };
}

// Conversion de elemenentos TipoCliente <-> json

TipoCliente tipoClienteFromJson(String str) => TipoCliente.fromJson(json.decode(str));

String tipoClienteToJson(TipoCliente data) => json.encode(data.toJson());

// Conversion de listas de elemenentos TipoCliente <-> json

List<TipoCliente> tiposClienteFromJson(String str) => List<TipoCliente>.from(json.decode(str).map((x) => TipoCliente.fromJson(x)));

String tiposClienteToJson(List<TipoCliente> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));