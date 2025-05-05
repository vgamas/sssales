import 'dart:convert';
import 'mensajes.dart';

class ImagenMensaje {
  int id;
  Mensaje idMensaje;
  String urlImagen;

  ImagenMensaje({required this.id, required this.idMensaje, required this.urlImagen});

  // Getters

  int get getId => this.id;
  Mensaje get getIdMensaje => this.idMensaje;
  String get getUrlImagen => this.urlImagen;

  // Setters

  void setId(int id) => this.id = id;
  void setIdMensaje(Mensaje idMensaje) => this.idMensaje = idMensaje;
  void setUrlImagen(String url) => this.urlImagen = url;

  factory ImagenMensaje.fromJson(Map<String, dynamic> json) => ImagenMensaje(
      id: json["id"],
      idMensaje: Mensaje.fromJson(json["idMensaje"]),
      urlImagen: json["urlImagen"],
  );

  Map<String, dynamic> toJson() => {
      "id": id,
      "idMensaje": idMensaje.toJson(),
      "urlImagen": urlImagen,
  };  
}

// Convierte una lista de elementos ImagenMensaje <-> json

List<ImagenMensaje> imagenesMensajeFromJson(String str) => List<ImagenMensaje>.from(json.decode(str).map((x) => ImagenMensaje.fromJson(x)));

String imagenesMensajeToJson(List<ImagenMensaje> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Convierte un elemento ImagenMensaje <-> json

ImagenMensaje imagenMensajeFromJson(String str) => ImagenMensaje.fromJson(json.decode(str));

String imagenMensajeToJson(ImagenMensaje data) => json.encode(data.toJson());