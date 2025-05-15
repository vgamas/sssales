import 'dart:convert';

import 'productos.dart';

class ImagenProducto {
  int id;
  Producto idProducto;
  String urlImagen;
  bool estado; // true = visible, false = borrada

  ImagenProducto(
      {required this.id,
      required this.idProducto,
      required this.urlImagen,
      required this.estado});

  // Getters

  int get getId => this.id;
  Producto get getProducto => this.idProducto;
  String get getImagen => this.urlImagen;
  bool get getEstado => this.estado;

  // Setters

  void setId(int id) => this.id = id;
  void setProducto(Producto idProducto) => this.idProducto = idProducto;
  void setImagen(String url) => this.urlImagen = url;
  void setEstado(bool estado) => this.estado = estado;

  factory ImagenProducto.fromJson(Map<String, dynamic> json) => ImagenProducto(
        id: json["id"],
        idProducto: Producto.fromJson(json["producto"]),
        urlImagen: json["urlImagen"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "producto": idProducto.toJson(),
        "urlImagen": urlImagen,
        "estado": estado,
      };
}

// Metodos para convertir un elemento de imagenProducto <-> json

ImagenProducto imagenProductoFromJson(String str) =>
    ImagenProducto.fromJson(json.decode(str));

String imagenProductoToJson(ImagenProducto data) => json.encode(data.toJson());

// Metodos para convertir una lista de elementos de imagenProducto <-> json

List<ImagenProducto> imagenesProductoFromJson(String str) =>
    List<ImagenProducto>.from(
        json.decode(str).map((x) => ImagenProducto.fromJson(x)));

String imagenesProductoToJson(List<ImagenProducto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
