import 'dart:convert';

class Departamento {
  int _id = 0;
  String _nombre = "";
  int _codigo = 0;

  Departamento({int id = 0, String nombre = "", int codigo = 0}) {
    this._id = id;
    this._nombre = nombre;
    this._codigo = codigo;
  }

// Getters

  int get getId => this._id;
  String get getNombre => this._nombre;
  int get getCodigo => this._codigo;

// Setters

  void setId(int id) => this._id = id;
  void setNombre(String nombre) => this._nombre = nombre;
  void setCodigo(int codigo) => this._codigo = codigo;

  factory Departamento.fromJson(Map<String, dynamic> json) => Departamento(
      id: json["id"], nombre: json["nombre"], codigo: json["codigo"]);

  Map<String, dynamic> toJson() =>
      {"id": _id, "nombre": _nombre, "codigo": _codigo};
}

// Manejo de listas de departamentos <-> json

List<Departamento> departamentoFromJson(String str) => List<Departamento>.from(
    json.decode(str).map((x) => Departamento.fromJson(x)));

String departamentoToJson(List<Departamento> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Manejo de un solo elemento de departamentos ,-> json

Departamento dptoFromJson(String str) =>
    Departamento.fromJson(json.decode(str));

String dptoToJson(Departamento data) => json.encode(data.toJson());
