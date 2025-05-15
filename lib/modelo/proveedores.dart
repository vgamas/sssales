import 'dart:convert';

class Proveedor {
  int id = 0;
  String nombre;
  String contacto;
  int telefono;
  int celular;

  Proveedor(
      {required this.id,
      required this.nombre,
      required this.contacto,
      required this.telefono,
      required this.celular});

  // Getters

  int get getId => this.id;
  String get getNombre => this.nombre;
  String get getContacto => this.contacto;
  int get getTelefono => this.telefono;
  int get getCelular => this.celular;

  // Setters

  void setId(int id) => this.id = id;
  void setNombre(String nombre) => this.nombre = nombre;
  void setContacto(String contacto) => this.contacto = contacto;
  void setTelefono(int telefono) => this.telefono = telefono;
  void setCelular(int telefono) => this.celular = telefono;

  factory Proveedor.fromJson(Map<String, dynamic> json) => Proveedor(
      id: json["id"],
      nombre: json["nombre"],
      contacto: json["contacto"],
      telefono: json["telefono"],
      celular: json["celular"],
  );

  Map<String, dynamic> toJson() => {
      "id": id,
      "nombre": nombre,
      "contacto": contacto,
      "telefono": telefono,
      "celular": celular,
  };
}

// Metodos para el manejo de listas de proveedores <-> json

List<Proveedor> proveedoresFromJson(String str) => List<Proveedor>.from(json.decode(str).map((x) => Proveedor.fromJson(x)));

String proveedoresToJson(List<Proveedor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Metodos para convertir estructura proveedor <-> json

Proveedor proveedorFromJson(String str) => Proveedor.fromJson(json.decode(str));

String proveedorToJson(Proveedor data) => json.encode(data.toJson());
