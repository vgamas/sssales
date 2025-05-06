import 'dart:convert';

import 'categorias.dart';
import 'proveedores.dart';

class Producto {
  int id;
  String nombre;
  String descripcion;
  String codigo;
  Categoria idCategoria;
  Proveedor idProveedor;
  DateTime fechaCreacion;
  int stockMinimo;
  int existencia;
  int cantidadReservada;
  double precioCompra;
  double precioVenta;
  double ivaVenta;
  int popularidad;
  bool destacado; // producto normal = false, producto destacado = true
  bool estado; // activo = true, inactivo = false

  Producto(
      {required this.id,
      required this.nombre,
      required this.descripcion,
      required this.codigo,
      required this.idCategoria,
      required this.idProveedor,
      required this.fechaCreacion,
      required this.stockMinimo,
      required this.existencia,
      required this.cantidadReservada,
      required this.precioCompra,
      required this.precioVenta,
      required this.ivaVenta,
      required this.popularidad,
      required this.destacado,
      required this.estado});

  // Getters

  int get getId => this.id;
  String get getNombre => this.nombre;
  String get getDescripcion => this.descripcion;
  String get getCodigo => this.codigo;
  Categoria get getCategoria => this.idCategoria;
  Proveedor get getProveedor => this.idProveedor;
  DateTime get getFechaCreacion => this.fechaCreacion;
  int get getStockMinimo => this.stockMinimo;
  int get getExistencia => this.existencia;
  int get getCantidadReservada => this.cantidadReservada;
  double get getPrecioCompra => this.precioCompra;
  double get getPrecioVenta => this.precioVenta;
  double get getIvaVenta => this.ivaVenta;
  int get getPopularidad => this.popularidad;
  bool get getDestacado => this.destacado;
  bool get getEstado => this.estado;

  // Setters

  void setId(int id) => this.id = id;
  void setNombre(String nombre) => this.nombre = nombre;
  void setDescripcion(String descripcion) => this.descripcion = descripcion;
  void setCodigo(String codigo) => this.codigo = codigo;
  void setCategoria(Categoria categoria) => this.idCategoria = categoria;
  void setProveedor(Proveedor proveedor) => this.idProveedor = proveedor;
  void setFechaCreacion(DateTime fechaCreacion) =>
      this.fechaCreacion = fechaCreacion;
  void setStock(int stock) => this.stockMinimo = stock;
  void setCantidadMinima(int cantidadMinima) =>
      this.existencia = cantidadMinima;
  void setCantidadReservada(int cantidadReservada) =>
      this.cantidadReservada = cantidadReservada;
  void setPrecioCompra(double precioCompra) => this.precioCompra = precioCompra;
  void setPrecioVenta(double precioVenta) => this.precioVenta = precioVenta;
  void setIvaVenta(double ivaVenta) => this.ivaVenta = ivaVenta;
  void setPopularidad(int popularidad) => this.popularidad = popularidad;
  void setDestacado(bool destacado) => this.destacado = destacado;
  void setEstado(bool estado) => this.estado = estado;

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        codigo: json["codigo"],
        idCategoria: Categoria.fromJson(json["categoria"]),
        idProveedor: Proveedor.fromJson(json["proveedor"]),
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        stockMinimo: json["stockMinimo"],
        existencia: json["existencia"],
        cantidadReservada: json["cantidadReservada"],
        precioCompra: json["precioCompra"],
        precioVenta: json["precioVenta"],
        ivaVenta: json["ivaVenta"],
        popularidad: json["popularidad"],
        destacado: json["destacado"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "codigo": codigo,
        "categoria": idCategoria.toJson(),
        "proveedor": idProveedor.toJson(),
        "fechaCreacion":
            "${fechaCreacion.year.toString().padLeft(4, '0')}-${fechaCreacion.month.toString().padLeft(2, '0')}-${fechaCreacion.day.toString().padLeft(2, '0')}",
        "stockMinimo": stockMinimo,
        "existencia": existencia,
        "cantidadReservada": cantidadReservada,
        "precioCompra": precioCompra,
        "precioVenta": precioVenta,
        "ivaVenta": ivaVenta,
        "popularidad": popularidad,
        "destacado": destacado,
        "estado": estado,
      };
}

// Metodos para convertir un elemento producto <-> json

Producto productoFromJson(String str) => Producto.fromJson(json.decode(str));

String productoToJson(Producto data) => json.encode(data.toJson());

// Metodos para convertir una lista de producto <-> json

List<Producto> productosFromJson(String str) =>
    List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));

String productosToJson(List<Producto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
