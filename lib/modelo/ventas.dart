import 'dart:convert';

import 'clientes.dart';
import 'medios_pago.dart';

class Venta {
  int id;
  Cliente idCliente;
  DateTime fecha;
  double valorProductos;
  double ivaProductos;
  MedioPago idMedioPago;
  String? referenciaPago;
  bool
      pagada; // si esta confirmado el pago de la venta = true, de lo contrario false
  DateTime? fechaEnvio;
  String? empresaTransporte;
  String? guia;

  Venta(
      {required this.id,
      required this.idCliente,
      required this.fecha,
      required this.valorProductos,
      required this.ivaProductos,
      required this.idMedioPago,
      required this.referenciaPago,
      required this.pagada,
      required this.fechaEnvio,
      required this.empresaTransporte,
      required this.guia});

  // Getters

  int get getId => this.id;
  Cliente get getCliente => this.idCliente;
  DateTime get getFecha => this.fecha;
  double get getValorProductos => this.valorProductos;
  double get getIvaProductos => this.ivaProductos;
  MedioPago get getMedioPago => this.idMedioPago;
  String? get getRefereciaPago => this.referenciaPago;
  bool get getPagada => this.pagada;
  DateTime? get getFechaEnvio => this.fechaEnvio;
  String? get getEmpresaTransporte => this.empresaTransporte;
  String? get getGuia => this.guia;

  // Setters

  set setId(int id) => this.id = id;
  set setCliente(Cliente idCliente) => this.idCliente = idCliente;
  set setFecha(DateTime fecha) => this.fecha = fecha;
  set setValorProductos(double valorProductos) =>
      this.valorProductos = valorProductos;
  set setIvaProductos(double ivaProductos) => this.ivaProductos = ivaProductos;
  set setMedioPago(MedioPago medioPago) => this.idMedioPago = medioPago;
  set setReferenciaPago(String ReferenciaPago) =>
      this.referenciaPago = ReferenciaPago;
  set setPagada(bool estado) => this.pagada = estado;
  set setFechaEnvio(DateTime fecha) => this.fechaEnvio = fecha;
  set setEmpresaTransporte(String empresa) => this.empresaTransporte = empresa;
  set setGuia(String guia) => this.guia = guia;

  factory Venta.fromJson(Map<String, dynamic> json) => Venta(
        id: json["id"],
        idCliente: Cliente.fromJson(json["idCliente"]),
        fecha: DateTime.parse('${json["fecha"]} ${json["hora"]}'),
        valorProductos: json["valorProductos"],
        ivaProductos: json["ivaProductos"],
        idMedioPago: MedioPago.fromJson(json["idMedioPago"]),
        referenciaPago: json["referenciaPago"] ?? "",
        pagada: json["pagada"],
        fechaEnvio: json["fechaEnvio"] == null
            ? null
            : DateTime.parse(json["fechaEnvio"]),
        empresaTransporte: json["empresaTransporte"] ?? "",
        guia: json["guia"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idCliente": idCliente.toJson(),
        "fecha":
            "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "hora":
            "${fecha.hour.toString().padLeft(2, '0')}:${fecha.minute.toString().padLeft(2, '0')}:${fecha.second.toString().padLeft(2, '0')}",
        "valorProductos": valorProductos,
        "ivaProductos": ivaProductos,
        "idMedioPago": idMedioPago.toJson(),
        "referenciaPago": referenciaPago,
        "pagada": pagada,
        "fechaEnvio": fechaEnvio == null
            ? null
            : "${fechaEnvio?.year.toString().padLeft(4, '0')}-${fechaEnvio?.month.toString().padLeft(2, '0')}-${fechaEnvio?.day.toString().padLeft(2, '0')}",
        "empresaTransporte": empresaTransporte,
        "guia": guia,
      };
}

// Metodos para convertir un elemento venta <-> json

Venta ventaFromJson(String str) => Venta.fromJson(json.decode(str));

String ventaToJson(Venta data) => json.encode(data.toJson());

// Metodos para convertir una lista de elemento venta <-> json

List<Venta> ventasFromJson(String str) =>
    List<Venta>.from(json.decode(str).map((x) => Venta.fromJson(x)));

String ventasToJson(List<Venta> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
