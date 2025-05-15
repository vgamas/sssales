import 'dart:convert';
import 'departamentos.dart';

class Ciudad {
  int id;
  String nombre;
  Departamento idDepartamento;
  int codigo;

  Ciudad(
      {required this.id,
      required this.nombre,
      required this.idDepartamento,
      required this.codigo});

// Getters

  int get getId => this.id;
  String get getNombre => this.nombre;
  Departamento get getDepartamento => this.idDepartamento;
  int get getCodigo => this.codigo;

// Setters

  void setId(int id) => this.id = id;
  void setNombre(String nombre) => this.nombre = nombre;
  void setDepartamento(Departamento dpto) => this.idDepartamento = dpto;
  void setCodigo(int codigo) => this.codigo = codigo;

  factory Ciudad.fromJson(Map<String, dynamic> json) => Ciudad(
      id: json["id"],
      nombre: json["nombre"],
      idDepartamento: Departamento.fromJson(json["idDepartamento"]),
      codigo: json["codigo"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "idDepartamento": idDepartamento.toJson(),
        "codigo": codigo
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
