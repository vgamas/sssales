import 'dart:convert';

class Categoria {
  int id = 0;
  String nombre;
  String descripcion;
  String color;
  String urlImagen;
  bool estado; // true = activa - falte = inactiva

  Categoria(
      {required this.id,
      required this.nombre,
      required this.descripcion,
      required this.color,
      required this.urlImagen,
      required this.estado});

  // Getters

  int get getId => this.id;
  String get getNombre => this.nombre;
  String get getDescripcion => this.descripcion;
  String get getColor => this.color;
  String get getUrlImagen => this.urlImagen;
  bool get getEstado => this.estado;

  // Setters

  void setId(int id) => this.id = id;
  void setNombre(String nombre) => this.nombre = nombre;
  void setDescripcion(String descripcion) => this.descripcion = descripcion;
  void setColor(String color) => this.color = color;
  void setUrlImagen(String url) => this.urlImagen = url;
  void setEstado(bool estado) => this.estado = estado;

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
      id: json["id"],
      nombre: json["nombre"],
      descripcion: json["descripcion"],
      color: json["color"],
      urlImagen: json["urlImagen"],
      estado: json["estado"],
  );

  Map<String, dynamic> toJson() => {
      "id": id,
      "nombre": nombre,
      "descripcion": descripcion,
      "color": color,
      "urlImagen": urlImagen,
      "estado": estado,
  };
}

// Manipulacion de listas de categoria <-> json

List<Categoria> categoriasFromJson(String str) => List<Categoria>.from(json.decode(str).map((x) => Categoria.fromJson(x)));

String categoriasToJson(List<Categoria> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Manipulacion de elementos de categoria <-> json

Categoria categoriaFromJson(String str) => Categoria.fromJson(json.decode(str));

String categoriaToJson(Categoria data) => json.encode(data.toJson());
