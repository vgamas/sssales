import 'dart:convert';

class Categoria {
  int _id = 0;
  String _nombre = "";
  String _descripcion = "";
  String _color = "";
  String _urlImagen = "";
  bool _estado = true; // true = activa - falte = inactiva

  Categoria(
      {int id = 0,
      String nombre = "",
      String descripcion = "",
      String color = "",
      String url = "",
      bool estado = true}) {
    this._id = id;
    this._nombre = nombre;
    this._descripcion = descripcion;
    this._color = color;
    this._urlImagen = url;
    this._estado = estado;
  }

  // Getters

  int get getId => this._id;
  String get getNombre => this._nombre;
  String get getDescripcion => this._descripcion;
  String get getColor => this._color;
  String get getUrlImagen => this._urlImagen;
  bool get getEstado => this._estado;

  // Setters

  void setId(int id) => this._id = id;
  void setNombre(String nombre) => this._nombre = nombre;
  void setDescripcion(String descripcion) => this._descripcion = descripcion;
  void setColor(String color) => this._color = color;
  void setUrlImagen(String url) => this._urlImagen = url;
  void setEstado(bool estado) => this._estado = estado;

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
      id: json["id"],
      nombre: json["nombre"],
      descripcion: json["descripcion"],
      color: json["color"],
      url: json["urlImagen"],
      estado: json["estado"],
  );

  Map<String, dynamic> toJson() => {
      "id": _id,
      "nombre": _nombre,
      "descripcion": _descripcion,
      "color": _color,
      "urlImagen": _urlImagen,
      "estado": _estado,
  };
}

// Manipulacion de listas de categoria <-> json

List<Categoria> categoriasFromJson(String str) => List<Categoria>.from(json.decode(str).map((x) => Categoria.fromJson(x)));

String categoriasToJson(List<Categoria> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Manipulacion de elementos de categoria <-> json

Categoria categoriaFromJson(String str) => Categoria.fromJson(json.decode(str));

String categoriaToJson(Categoria data) => json.encode(data.toJson());
