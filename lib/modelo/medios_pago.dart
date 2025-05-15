import 'dart:convert';

class MedioPago {
  int id;
  String nombre;
  String conexion;
  bool estado;
  String instrucciones;

  MedioPago(
      {required this.id,
      required this.nombre,
      required this.conexion,
      required this.estado,
      required this.instrucciones});

  // Getters

  int get getId => this.id;
  String get getNombre => this.nombre;
  String get getConexion => this.conexion;
  bool get getEstado => this.estado;
  String get getInstrucciones => this.instrucciones;

  // Setters

  void setId(int id) => this.id = id;
  void setNombre(String nombre) => this.nombre = nombre;
  void setConexion(String conexion) => this.conexion = conexion;
  void setEstado(bool estado) => this.estado = estado;
  void setInstruciones(String instrucciones) =>
      this.instrucciones = instrucciones;

  factory MedioPago.fromJson(Map<String, dynamic> json) => MedioPago(
        id: json["id"],
        nombre: json["nombre"],
        conexion: json["conexion"],
        estado: json["estado"],
        instrucciones: json["instrucciones"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "conexion": conexion,
        "estado": estado,
        "instrucciones": instrucciones,
    };
}

// Maneja las listas de medios de pago para convertirlas <-> json

List<MedioPago> mediosPagoFromJson(String str) => List<MedioPago>.from(json.decode(str).map((x) => MedioPago.fromJson(x)));

String mediosPagoToJson(List<MedioPago> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Maneja los elementos de mendios de pago para convertir <-> json

MedioPago medioPagoFromJson(String str) => MedioPago.fromJson(json.decode(str));

String medioPagoToJson(MedioPago data) => json.encode(data.toJson());