import 'dart:convert';
import 'usuarios.dart';

class Mensaje {
  int _id = 0;
  Usuario _usrOrigen = Usuario();
  Usuario _usrDestino = Usuario();
  DateTime _fechaHora = DateTime.now();
  bool _esPromocional =
      false; // true es un mensaje de promocion enviado por el administrados, si es mensaje de un chat es false
  String _asunto = "";
  String _mensaje = "";
  String _tipo = "N"; // nueva conversacion (N) / respuesta (R)
  bool _estado = false; // leido o no

  Mensaje(
      {int id = 0,
      Usuario? usuarioOrigen,
      Usuario? usuarioDestino,
      DateTime? fechaHora,
      bool promocional = false,
      String asunto = "",
      String mensaje = "",
      String tipo = "N",
      bool estado = false}) {
    this._id = id;
    this._usrOrigen = usuarioOrigen ?? Usuario();
    this._usrDestino = usuarioDestino ?? Usuario();
    this._fechaHora = fechaHora ?? DateTime.now();
    this._esPromocional = promocional;
    this._asunto = asunto;
    this._mensaje = mensaje;
    this._tipo = tipo;
    this._estado = estado;
  }

  // Getters

  int get getId => this._id;
  Usuario get getUsuarioOrigen => this._usrOrigen;
  Usuario get getUsuarioDestino => this._usrDestino;
  DateTime get getFecha => this._fechaHora;
  bool get getPromocional => this._esPromocional;
  String get getAsunto => this._asunto;
  String get getMensaje => this._mensaje;
  String get getTipo => this._tipo;
  bool get getEstado => this._estado;

  // Setters

  void setId(int id) => this._id = id;
  void setUsuarioOrigen(Usuario usuario) => this._usrOrigen = usuario;
  void setUsuarioDestino(Usuario usuario) => this._usrDestino = usuario;
  void setFecha(DateTime fecha) => this._fechaHora = fecha;
  void setPromocional(bool promocional) => this._esPromocional = promocional;
  void setAsunto(String asunto) => this._asunto = asunto;
  void setMensaje(String mensaje) => this._mensaje = mensaje;
  void setTipo(String tipo) => this._tipo = tipo;
  void setEstado(bool estado) => this._estado = estado;

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
      "id": _id,
      "usuarioOrigen": _usrOrigen.toJson(),
      "fecha": "${_fechaHora.year.toString().padLeft(4, '0')}-${_fechaHora.month.toString().padLeft(2, '0')}-${_fechaHora.day.toString().padLeft(2, '0')}",
      "hora": "${_fechaHora.hour.toString().padLeft(2, '0')}:${_fechaHora.minute.toString().padLeft(2, '0')}:${_fechaHora.second.toString().padLeft(2, '0')}",
      "promocional": _esPromocional,
      "asunto": _asunto,
      "mensaje": _mensaje,
      "tipo": _tipo,
      "estado": _estado,
      "usuarioDestino": _usrDestino.toJson()
  };
  
}

// Convierte un elemento del tipo mensaje <-> json

Mensaje mensajeFromJson(String str) => Mensaje.fromJson(json.decode(str));

String mensajeToJson(Mensaje data) => json.encode(data.toJson());

// Convierte una lista de elemento del tipo mensaje <-> json

List<Mensaje> mensajesFromJson(String str) => List<Mensaje>.from(json.decode(str).map((x) => Mensaje.fromJson(x)));

String mensajesToJson(List<Mensaje> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));