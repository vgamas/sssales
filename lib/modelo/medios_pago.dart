import 'dart:convert';

class MedioPago {
  int _id = 0;
  String _nombre = "";
  String _conexion = "";
  bool _estado = true;
  String _instrucciones = "";

  MedioPago(
      {int id = 0,
      String nombre = "",
      String conexion = "",
      bool estado = true,
      String instrucciones = ""}) {
    this._id = id;
    this._nombre = nombre;
    this._conexion = conexion;
    this._estado = estado;
    this._instrucciones = instrucciones;
  }

  // Getters

  int get getId => this._id;
  String get getNombre => this._nombre;
  String get getConexion => this._conexion;
  bool get getEstado => this._estado;
  String get getInstrucciones => this._instrucciones;

  // Setters

  void setId(int id) => this._id = id;
  void setNombre(String nombre) => this._nombre = nombre;
  void setConexion(String conexion) => this._conexion = conexion;
  void setEstado(bool estado) => this._estado = estado;
  void setInstruciones(String instrucciones) =>
      this._instrucciones = instrucciones;

  factory MedioPago.fromJson(Map<String, dynamic> json) => MedioPago(
        id: json["id"],
        nombre: json["nombre"],
        conexion: json["conexion"],
        estado: json["estado"],
        instrucciones: json["instrucciones"],
    );

    Map<String, dynamic> toJson() => {
        "id": _id,
        "nombre": _nombre,
        "conexion": _conexion,
        "estado": _estado,
        "instrucciones": _instrucciones,
    };
}

// Maneja las listas de medios de pago para convertirlas <-> json

List<MedioPago> mediosPagoFromJson(String str) => List<MedioPago>.from(json.decode(str).map((x) => MedioPago.fromJson(x)));

String mediosPagoToJson(List<MedioPago> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Maneja los elementos de mendios de pago para convertir <-> json

MedioPago medioPagoFromJson(String str) => MedioPago.fromJson(json.decode(str));

String medioPagoToJson(MedioPago data) => json.encode(data.toJson());