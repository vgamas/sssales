import 'dart:convert';

class Rol {
  int id;
  String nombre;

  Rol({required this.id, required this.nombre});

  // Getters

  int get getId => this.id;
  String get getNombre => this.nombre;

  // Seters

  void setId(int id) => this.id = id;
  void setNombre(String nombre) => this.nombre = nombre;

  factory Rol.fromJson(Map<String, dynamic> json) => Rol(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
    };
}

// Metodos para cambiar de rol a json y viceversa

Rol rolFromJson(String str) => Rol.fromJson(json.decode(str));

String rolToJson(Rol data) => json.encode(data.toJson());

// Manejo de lista de roles <-> json

List<Rol> rolesFromJson(String str) => List<Rol>.from(json.decode(str).map((x) => Rol.fromJson(x)));

String rolesToJson(List<Rol> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));