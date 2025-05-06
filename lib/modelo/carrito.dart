import 'dart:convert';

import 'clientes.dart';
import 'productos.dart';

class Carrito {
  int id;
  Cliente idCliente;
  Producto idProducto;
  int cantidad;
  double precioUnitario;
  double ivaUnitario;
  DateTime
      fechaReserva; // Pilas para convertir en string la fecha en formato AAAA-MM-DD

  Carrito(
      {required this.id,
      required this.idCliente,
      required this.idProducto,
      required this.cantidad,
      required this.precioUnitario,
      required this.ivaUnitario,
      required this.fechaReserva});

  // Getters

  int get getId => this.id;
  Cliente get getCliente => this.idCliente;
  Producto get getProducto => this.idProducto;
  int get getCantidad => this.cantidad;
  double get getPrecioUnitario => this.precioUnitario;
  double get getIvaUnitario => this.ivaUnitario;
  DateTime get getFechaReserva => this.fechaReserva;

  // Setters

  void setId(int id) => this.id = id;
  void setCliente(Cliente cliente) => this.idCliente = cliente;
  void setProducto(Producto producto) => this.idProducto = producto;
  void setCantidad(int cantidad) => this.cantidad = cantidad;
  void setPrecioUnitario(double precio) => this.precioUnitario = precio;
  void setIvaUnitario(double iva) => this.ivaUnitario = iva;
  void setFechaReserva(DateTime fecha) => this.fechaReserva = fecha;

  factory Carrito.fromJson(Map<String, dynamic> json) => Carrito(
        id: json["id"],
        cantidad: json["cantidad"],
        precioUnitario: json["precioUnitario"],
        ivaUnitario: json["ivaUnitario"],
        fechaReserva: DateTime.parse(json["fechaReserva"]),
        idProducto: Producto.fromJson(json["idProducto"]),
        idCliente: Cliente.fromJson(json["idCliente"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cantidad": cantidad,
        "precioUnitario": precioUnitario,
        "ivaUnitario": ivaUnitario,
        "fechaReserva":
            "${fechaReserva.year.toString().padLeft(4, '0')}-${fechaReserva.month.toString().padLeft(2, '0')}-${fechaReserva.day.toString().padLeft(2, '0')}",
        "idProducto": idProducto.toJson(),
        "idCliente": idCliente.toJson(),
      };
}

// Metodos para convertir de la estructura de Carrito <-> json

Carrito carritoFromJson(String str) => Carrito.fromJson(json.decode(str));

String carritoToJson(Carrito data) => json.encode(data.toJson());

// Metodos para convertir de una lista de la estructura de Carrito <-> json

List<Carrito> carritosFromJson(String str) =>
    List<Carrito>.from(json.decode(str).map((x) => Carrito.fromJson(x)));

String carritosToJson(List<Carrito> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
