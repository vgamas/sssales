import 'dart:convert';
import 'usuarios.dart';

class Mensaje {
  int id = 0;
  Usuario usuarioOrigen;
  Usuario usuarioDestino;
  DateTime fechaHora;
  bool promocional; // true es un mensaje de promocion enviado por el administrados, si es mensaje de un chat es false
  String asunto;
  String mensaje;
  String tipo; // nueva conversacion (N) / respuesta (R)
  bool estado; // leido o no

  Mensaje(
      {required this.id,
      required this.usuarioOrigen,
      required this.usuarioDestino,
      required this.fechaHora,
      required this.promocional,
      required this.asunto,
      required this.mensaje,
      required this.tipo,
      required this.estado});

  // Getters

  int get getId => this.id;
  Usuario get getUsuarioOrigen => this.usuarioOrigen;
  Usuario get getUsuarioDestino => this.usuarioDestino;
  DateTime get getFecha => this.fechaHora;
  bool get getPromocional => this.promocional;
  String get getAsunto => this.asunto;
  String get getMensaje => this.mensaje;
  String get getTipo => this.tipo;
  bool get getEstado => this.estado;

  // Setters

  void setId(int id) => this.id = id;
  void setUsuarioOrigen(Usuario usuario) => this.usuarioOrigen = usuario;
  void setUsuarioDestino(Usuario usuario) => this.usuarioDestino = usuario;
  void setFecha(DateTime fecha) => this.fechaHora = fecha;
  void setPromocional(bool promocional) => this.promocional = promocional;
  void setAsunto(String asunto) => this.asunto = asunto;
  void setMensaje(String mensaje) => this.mensaje = mensaje;
  void setTipo(String tipo) => this.tipo = tipo;
  void setEstado(bool estado) => this.estado = estado;

  factory Mensaje.fromJson(Map<String, dynamic> json) => Mensaje(
      id: json["id"],
      usuarioOrigen: Usuario.fromJson(json["usuarioOrigen"]),
      fechaHora: DateTime.parse('${json["fecha"]} ${json["hora"]}'),
      promocional: json["promocional"],
      asunto: json["asunto"],
      mensaje: json["mensaje"],
      tipo: json["tipo"],
      estado: json["estado"],
      usuarioDestino: Usuario.fromJson(json["usuarioDestino"]),
  );

  Map<String, dynamic> toJson() => {
      "id": id,
      "usuarioOrigen": usuarioOrigen.toJson(),
      "fecha": "${fechaHora.year.toString().padLeft(4, '0')}-${fechaHora.month.toString().padLeft(2, '0')}-${fechaHora.day.toString().padLeft(2, '0')}",
      "hora": "${fechaHora.hour.toString().padLeft(2, '0')}:${fechaHora.minute.toString().padLeft(2, '0')}:${fechaHora.second.toString().padLeft(2, '0')}",
      "promocional": promocional,
      "asunto": asunto,
      "mensaje": mensaje,
      "tipo": tipo,
      "estado": estado,
      "usuarioDestino": usuarioDestino.toJson()
  };
  
}

// Convierte un elemento del tipo mensaje <-> json

Mensaje mensajeFromJson(String str) => Mensaje.fromJson(json.decode(str));

String mensajeToJson(Mensaje data) => json.encode(data.toJson());

// Convierte una lista de elemento del tipo mensaje <-> json

List<Mensaje> mensajesFromJson(String str) => List<Mensaje>.from(json.decode(str).map((x) => Mensaje.fromJson(x)));

String mensajesToJson(List<Mensaje> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));