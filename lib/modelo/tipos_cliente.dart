import 'dart:convert';

class TipoCliente {
  String id;
  String nombre;
  String descripcion;

  TipoCliente({required this.id,required this.nombre,required this.descripcion});

  // Getters

  String get getId => this.id;
  String get getNombre => this.nombre;
  String get getDescripcion => this.descripcion;

  // Setters

  void setId(String id) => this.id = id;
  void setNombre(String nombre) => this.nombre = nombre;
  void setDescripcion(String descripcion) => this.descripcion = descripcion;

  factory TipoCliente.fromJson(Map<String, dynamic> json) => TipoCliente(
    id: json["id"],
    nombre: json["nombre"],
    descripcion: json["descripcion"],
  );

  Map<String, dynamic> toJson() => {
      "id": id,
      "nombre": nombre,
      "descripcion": descripcion,
  };
}

// Conversion de elemenentos TipoCliente <-> json

TipoCliente tipoClienteFromJson(String str) => TipoCliente.fromJson(json.decode(str));

String tipoClienteToJson(TipoCliente data) => json.encode(data.toJson());

// Conversion de listas de elemenentos TipoCliente <-> json

List<TipoCliente> tiposClienteFromJson(String str) => List<TipoCliente>.from(json.decode(str).map((x) => TipoCliente.fromJson(x)));

String tiposClienteToJson(List<TipoCliente> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));