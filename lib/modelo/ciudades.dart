import 'dart:convert';
import 'departamentos.dart';

class Ciudad {
  int _id = 0;
  String _nombre = "";
  Departamento? _idDepartamento = null;
  int _codigo = 0;

  Ciudad(
      {int id = 0,
      String nombre = "",
      Departamento? idDepartamento = null,
      int codigo = 0}) {
    this._id = id;
    this._nombre = nombre;
    this._idDepartamento = idDepartamento;
    this._codigo = codigo;
  }

// Getters

  int get getId => this._id;
  String get getNombre => this._nombre;
  Departamento? get getDepartamento => this._idDepartamento;
  int get getCodigo => this._codigo;

// Setters

  void setId(int id) => this._id = id;
  void setNombre(String nombre) => this._nombre = nombre;
  void setDepartamento(Departamento dpto) => this._idDepartamento = dpto;
  void setCodigo(int codigo) => this._codigo = codigo;

  factory Ciudad.fromJson(Map<String, dynamic> json) => Ciudad(
      id: json["id"],
      nombre: json["nombre"],
      idDepartamento: json["idDepartamento"] == null
          ? null
          : Departamento.fromJson(json["idDepartamento"]),
      codigo: json["codigo"]);

  Map<String, dynamic> toJson() => {
        "id": _id,
        "nombre": _nombre,
        "idDepartamento": _idDepartamento?.toJson(),
        "codigo": _codigo
      };
}

// Manejo de listas de departamentos <-> json

List<Ciudad> ciudadesFromJson(String str) =>
    List<Ciudad>.from(json.decode(str).map((x) => Ciudad.fromJson(x)));

String ciudadesToJson(List<Ciudad> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Manejo de un solo elemento de roles -> json

Ciudad ciudadFromJson(String str) => Ciudad.fromJson(json.decode(str));

String ciudadToJson(Ciudad data) => json.encode(data.toJson());
