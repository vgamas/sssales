import 'dart:convert';

import '../modelo/ventas.dart';
import '../modelo/productos.dart';

class DetalleVenta {
  int id = 0;
  Venta idVenta;
  Producto idProducto;
  int cantidad;
  double precioUnitario;
  double ivaUnitario;

  DetalleVenta(
      {required this.id,
      required this.idVenta,
      required this.idProducto,
      required this.cantidad,
      required this.precioUnitario,
      required this.ivaUnitario});

  // Getters

  int get getId => this.id;
  Venta get getIdVenta => this.idVenta;
  Producto get getIdProducto => this.idProducto;
  int get getCantidad => this.cantidad;
  double get getPrecioUnitario => this.precioUnitario;
  double get getIvaUnitario => this.ivaUnitario;

  // Setters

  void setId(int id) => this.id = id;
  void setIdVenta(Venta idVenta) => this.idVenta = idVenta;
  void setIdProducto(Producto idProducto) => this.idProducto = idProducto;
  void setCantidad(int cantidad) => this.cantidad = cantidad;
  void setPrecioUnitario(double precioUnitario) =>
      this.precioUnitario = precioUnitario;
  void setIvaUnitario(double iva) => this.ivaUnitario = iva;

  factory DetalleVenta.fromJson(Map<String, dynamic> json) => DetalleVenta(
        id: json["id"],
        idVenta: Venta.fromJson(json["idVenta"]),
        idProducto: Producto.fromJson(json["idProducto"]),
        cantidad: json["cantidad"],
        precioUnitario: json["precioUnitario"],
        ivaUnitario: json["ivaUnitario"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idVenta": idVenta.toJson(),
        "idProducto": idProducto.toJson(),
        "cantidad": cantidad,
        "precioUnitario": precioUnitario,
        "ivaUnitario": ivaUnitario,
      };
}

// Metodos para convertir un elemento de estructura DetalleVenta <-> json

DetalleVenta detalleVentaFromJson(String str) =>
    DetalleVenta.fromJson(json.decode(str));

String detalleVentaToJson(DetalleVenta data) => json.encode(data.toJson());

// Metodos para convertir una lista de elementos de estructura DetalleVenta <-> json

List<DetalleVenta> detallesVentaFromJson(String str) => List<DetalleVenta>.from(
    json.decode(str).map((x) => DetalleVenta.fromJson(x)));

String detallesVentaToJson(List<DetalleVenta> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
