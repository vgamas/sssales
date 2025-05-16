import 'dart:convert';

class Rol {
  int _id = 0;
  String _nombre = "";

  Rol({int id = 0, String nombre = ""}) {
    this._id = id;
    this._nombre = nombre;
  }

  // Getters

  int get getId => this._id;
  String get getNombre => this._nombre;

  // Seters

  void setId(int id) => this._id = id;
  void setNombre(String nombre) => this._nombre = nombre;

  factory Rol.fromJson(Map<String, dynamic> json) => Rol(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": _id,
        "nombre": _nombre,
    };
}

// Metodos para cambiar de rol a json y viceversa

Rol rolFromJson(String str) => Rol.fromJson(json.decode(str));

String rolToJson(Rol data) => json.encode(data.toJson());

// Manejo de lista de roles <-> json

List<Rol> rolesFromJson(String str) => List<Rol>.from(json.decode(str).map((x) => Rol.fromJson(x)));

String rolesToJson(List<Rol> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));