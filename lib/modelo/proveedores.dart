import 'dart:convert';

class Proveedor {
  int _id = 0;
  String _nombre = "";
  String _contacto = "";
  int _telefono = 0;
  int _celular = 0;

  Proveedor(
      {int id = 0,
      String nombre = "",
      String contacto = "",
      int telefono = 0,
      int celular = 0}) {
    this._id = id;
    this._nombre = nombre;
    this._contacto = contacto;
    this._telefono = telefono;
    this._celular = celular;
  }

  // Getters

  int get getId => this._id;
  String get getNombre => this._nombre;
  String get getContacto => this._contacto;
  int get getTelefono => this._telefono;
  int get getCelular => this._celular;

  // Setters

  void setId(int id) => this._id = id;
  void setNombre(String nombre) => this._nombre = nombre;
  void setContacto(String contacto) => this._contacto = contacto;
  void setTelefono(int telefono) => this._telefono = telefono;
  void setCelular(int telefono) => this._celular = telefono;

  factory Proveedor.fromJson(Map<String, dynamic> json) => Proveedor(
      id: json["id"],
      nombre: json["nombre"],
      contacto: json["contacto"],
      telefono: json["telefono"],
      celular: json["celular"],
  );

  Map<String, dynamic> toJson() => {
      "id": _id,
      "nombre": _nombre,
      "contacto": _contacto,
      "telefono": _telefono,
      "celular": _celular,
  };
}

// Metodos para el manejo de listas de proveedores <-> json

List<Proveedor> proveedoresFromJson(String str) => List<Proveedor>.from(json.decode(str).map((x) => Proveedor.fromJson(x)));

String proveedoresToJson(List<Proveedor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Metodos para convertir estructura proveedor <-> json

Proveedor proveedorFromJson(String str) => Proveedor.fromJson(json.decode(str));

String proveedorToJson(Proveedor data) => json.encode(data.toJson());
