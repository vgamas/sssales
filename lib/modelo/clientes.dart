import 'dart:convert';

import '../modelo/tipos_documento.dart';

import '../modelo/ciudades.dart';
import '../modelo/usuarios.dart';
import '../modelo/tipos_cliente.dart';

class Cliente {
  int id;
  String nombreCompleto;
  TipoDocumento tipoDocumento;
  String numeroDocumento;
  String correoElectronico;
  int celular;
  String direccion;
  Ciudad idCiudad;
  bool estado; // true = usuario activo - false = inactivo
  String observaciones;
  TipoCliente tipoCliente;
  String facebook;
  String instagram = "";
  String whatsapp = "";
  String tiktok = "";
  DateTime fechaNacimiento;
  Usuario idUsuario;
  String urlImagen;

  Cliente(
      {required this.id,
      required this.nombreCompleto,
      required this.tipoDocumento,
      required this.numeroDocumento,
      required this.correoElectronico,
      required this.celular,
      required this.direccion,
      required this.idCiudad,
      required this.estado,
      required this.observaciones,
      required this.tipoCliente,
      required this.facebook,
      required this.instagram,
      required this.whatsapp,
      required this.tiktok,
      required this.fechaNacimiento,
      required this.idUsuario,
      required this.urlImagen});

  // Getters
  int get getId => this.id;
  String get getNombre => this.nombreCompleto;
  TipoDocumento get getTipoDocumento => this.tipoDocumento;
  String get getNumeroDocumento => this.numeroDocumento;
  String get getCorreoElectronico => this.correoElectronico;
  int get getCelular => this.celular;
  String get getDireccion => this.direccion;
  Ciudad get getCiudad => this.idCiudad;
  bool get getEstado => this.estado;
  String get getObservaciones => this.observaciones;
  TipoCliente get getTipoCliente => this.tipoCliente;
  String get getFacebook => this.facebook;
  String get getInstagram => this.instagram;
  String get getWhatsapp => this.whatsapp;
  String get getTiktok => this.tiktok;
  DateTime get getFechaNacimiento => this.fechaNacimiento;
  Usuario get getUsuario => this.idUsuario;
  String get getImagen => this.urlImagen;

  // Setters
  void setId(int id) => this.id = id;
  void setNombre(String nombre) => this.nombreCompleto = nombre;
  void setTipoDocumento(TipoDocumento tipoDocumento) => this.tipoDocumento = tipoDocumento;
  void setNumeroDocumento(String numeroDocumento) => this.numeroDocumento = numeroDocumento;
  void setCorreoElectronico(String correo) => this.correoElectronico = correo;
  void setCelular(int celular) => this.celular = celular;
  void setDireccion(String direccion) => this.direccion = direccion;
  void setCiudad(Ciudad ciudad) => this.idCiudad = ciudad;
  void setEstado(bool estado) => this.estado = estado;
  void setObservaciones(String observaciones) =>
      this.observaciones = observaciones;
  void setTipoCliente(TipoCliente tipoCliente) => this.tipoCliente = tipoCliente;
  void setFacebook(String facebook) => this.facebook = facebook;
  void setInstagram(String instagram) => this.instagram = instagram;
  void setWhatsapp(String whatsapp) => this.whatsapp = whatsapp;
  void setTiktok(String tiktok) => this.tiktok = tiktok;
  void setFechaNacimiento(DateTime fechaNacimiento) =>
      this.fechaNacimiento = fechaNacimiento;
  void setUsuario(Usuario usuario) => this.idUsuario = usuario;
  void setUrlImagen(String url) => this.urlImagen = url;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
    id: json["id"],
    nombreCompleto: json["nombreCompleto"],
    tipoDocumento: TipoDocumento.fromJson(json["tipoDocumento"]),
    numeroDocumento: json["numeroDocumento"],
    correoElectronico: json["correo"],
    celular: json["celular"],
    direccion: json["direccion"],
    idCiudad: Ciudad.fromJson(json["idCiudad"]),
    estado: json["estado"],
    observaciones: json["observaciones"],
    tipoCliente: TipoCliente.fromJson(json["tipoCliente"]),
    facebook: json["facebook"],
    instagram: json["instagram"],
    whatsapp: json["whatsapp"],
    tiktok: json["tiktok"],
    fechaNacimiento: DateTime.parse(json["fechaNacimiento"]),
    idUsuario: Usuario.fromJson(json["usuario"]),
    urlImagen: json["urlImagen"],
  );

  Map<String, dynamic> toJson() => {
      "id": id,
      "nombreCompleto": nombreCompleto,
      "tipoDocumento": tipoDocumento.toJson(),
      "numeroDocumento": numeroDocumento,
      "correo": correoElectronico,
      "celular": celular,
      "direccion": direccion,
      "idCiudad": idCiudad.toJson(),
      "estado": estado,
      "observaciones": observaciones,
      "tipoCliente": tipoCliente.toJson(),
      "facebook": facebook,
      "instagram": instagram,
      "whatsapp": whatsapp,
      "tiktok": tiktok,
      "fechaNacimiento": "${fechaNacimiento.year.toString().padLeft(4, '0')}-${fechaNacimiento.month.toString().padLeft(2, '0')}-${fechaNacimiento.day.toString().padLeft(2, '0')}",
      "usuario": idUsuario.toJson(),
      "urlImagen": urlImagen,
  };

}

// Metodos que convierten un elemento de tipo Cliente <-> json

Cliente clienteFromJson(String str) => Cliente.fromJson(json.decode(str));

String clienteToJson(Cliente data) => json.encode(data.toJson());

// Metodos que convierten una lista de elementos de tipo Cliente <-> json

List<Cliente> clientesFromJson(String str) => List<Cliente>.from(json.decode(str).map((x) => Cliente.fromJson(x)));

String clientesToJson(List<Cliente> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
