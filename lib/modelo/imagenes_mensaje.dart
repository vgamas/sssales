import 'dart:convert';
import 'mensajes.dart';

class ImagenMensaje {
  int _id = 0;
  Mensaje _idMensaje = Mensaje();
  String _urlImagen = "";

  ImagenMensaje({int id = 0, Mensaje? mensaje, String urlImagen = ""}) {
    this._id = id;
    this._idMensaje = mensaje ?? Mensaje();
    this._urlImagen = urlImagen;
  }

  // Getters

  int get getId => this._id;
  Mensaje get getIdMensaje => this._idMensaje;
  String get getUrlImagen => this._urlImagen;

  // Setters

  void setId(int id) => this._id = id;
  void setIdMensaje(Mensaje idMensaje) => this._idMensaje = idMensaje;
  void setUrlImagen(String url) => this._urlImagen = url;

  factory ImagenMensaje.fromJson(Map<String, dynamic> json) => ImagenMensaje(
      id: json["id"],
      mensaje: Mensaje.fromJson(json["idMensaje"]),
      urlImagen: json["urlImagen"],
  );

  Map<String, dynamic> toJson() => {
      "id": _id,
      "idMensaje": _idMensaje.toJson(),
      "urlImagen": _urlImagen,
  };  
}

// Convierte una lista de elementos ImagenMensaje <-> json

List<ImagenMensaje> imagenesMensajeFromJson(String str) => List<ImagenMensaje>.from(json.decode(str).map((x) => ImagenMensaje.fromJson(x)));

String imagenesMensajeToJson(List<ImagenMensaje> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Convierte un elemento ImagenMensaje <-> json

ImagenMensaje imagenMensajeFromJson(String str) => ImagenMensaje.fromJson(json.decode(str));

String imagenMensajeToJson(ImagenMensaje data) => json.encode(data.toJson());