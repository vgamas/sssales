import 'dart:convert';

import '../modelo/tipos_documento.dart';

import '../modelo/ciudades.dart';
import '../modelo/usuarios.dart';
import '../modelo/tipos_cliente.dart';

class Cliente {
  int _id = 0;
  String _nombreCompleto = "";
  TipoDocumento _tipoDocumento = TipoDocumento();
  String _numeroDocumento = "";
  String _correoElectronico = "";
  int _celular = 0;
  String _direccion = "";
  Ciudad _idCiudad = Ciudad();
  bool _estado = true; // true = usuario activo - false = inactivo
  String _observaciones = "";
  TipoCliente _tipoCliente = TipoCliente();
  String _facebook = "";
  String _instagram = "";
  String _whatsapp = "";
  String _tiktok = "";
  DateTime _fechaNacimiento = DateTime.now();
  Usuario _idUsuario = Usuario();
  String _urlImagen = "";

  Cliente(
      {int id = 0,
      String nombre = "",
      TipoDocumento? tipoDocumento,
      String numeroDocumento = "",
      String correoElectronico = "",
      int celular = 0,
      String direccion = "",
      Ciudad? idCiudad,
      bool estado = true,
      String observaciones = "",
      TipoCliente? tipoCliente,
      String facebook = "",
      String instagram = "",
      String whatsapp = "",
      String tiktok = "",
      DateTime? fechaNacimiento,
      Usuario? idUsuario,
      String urlImagen = ""}) {
    this._id = id;
    this._nombreCompleto = nombre;
    this._tipoDocumento = tipoDocumento ?? TipoDocumento();
    this._numeroDocumento = numeroDocumento;
    this._correoElectronico = correoElectronico;
    this._celular = celular;
    this._direccion = direccion;
    this._idCiudad = idCiudad ?? Ciudad();
    this._observaciones = observaciones;
    this._tipoCliente = tipoCliente ?? TipoCliente();
    this._facebook = facebook;
    this._instagram = instagram;
    this._whatsapp = whatsapp;
    this._tiktok = tiktok;
    this._fechaNacimiento = fechaNacimiento ?? DateTime.now();
    this._idUsuario = idUsuario ?? Usuario();
    this._urlImagen = urlImagen;
  }

  // Getters
  int get getId => this._id;
  String get getNombre => this._nombreCompleto;
  TipoDocumento get getTipoDocumento => this._tipoDocumento;
  String get getNumeroDocumento => this._numeroDocumento;
  String get getCorreoElectronico => this._correoElectronico;
  int get getCelular => this._celular;
  String get getDireccion => this._direccion;
  Ciudad get getCiudad => this._idCiudad;
  bool get getEstado => this._estado;
  String get getObservaciones => this._observaciones;
  TipoCliente get getTipoCliente => this._tipoCliente;
  String get getFacebook => this._facebook;
  String get getInstagram => this._instagram;
  String get getWhatsapp => this._whatsapp;
  String get getTiktok => this._tiktok;
  DateTime get getFechaNacimiento => this._fechaNacimiento;
  Usuario get getUsuario => this._idUsuario;
  String get getImagen => this._urlImagen;

  // Setters
  void setId(int id) => this._id = id;
  void setNombre(String nombre) => this._nombreCompleto = nombre;
  void setTipoDocumento(TipoDocumento tipoDocumento) => this._tipoDocumento = tipoDocumento;
  void setNumeroDocumento(String numeroDocumento) => this._numeroDocumento = numeroDocumento;
  void setCorreoElectronico(String correo) => this._correoElectronico = correo;
  void setCelular(int celular) => this._celular = celular;
  void setDireccion(String direccion) => this._direccion = direccion;
  void setCiudad(Ciudad ciudad) => this._idCiudad = ciudad;
  void setEstado(bool estado) => this._estado = estado;
  void setObservaciones(String observaciones) =>
      this._observaciones = observaciones;
  void setTipoCliente(TipoCliente tipoCliente) => this._tipoCliente = tipoCliente;
  void setFacebook(String facebook) => this._facebook = facebook;
  void setInstagram(String instagram) => this._instagram = instagram;
  void setWhatsapp(String whatsapp) => this._whatsapp = whatsapp;
  void setTiktok(String tiktok) => this._tiktok = tiktok;
  void setFechaNacimiento(DateTime fechaNacimiento) =>
      this._fechaNacimiento = fechaNacimiento;
  void setUsuario(Usuario usuario) => this._idUsuario = usuario;
  void setUrlImagen(String url) => this._urlImagen = url;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
    id: json["id"],
    nombre: json["nombreCompleto"],
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
      "id": _id,
      "nombreCompleto": _nombreCompleto,
      "tipoDocumento": _tipoDocumento.toJson(),
      "numeroDocumento": _numeroDocumento,
      "correo": _correoElectronico,
      "celular": _celular,
      "direccion": _direccion,
      "idCiudad": _idCiudad.toJson(),
      "estado": _estado,
      "observaciones": _observaciones,
      "tipoCliente": _tipoCliente.toJson(),
      "facebook": _facebook,
      "instagram": _instagram,
      "whatsapp": _whatsapp,
      "tiktok": _tiktok,
      "fechaNacimiento": "${_fechaNacimiento.year.toString().padLeft(4, '0')}-${_fechaNacimiento.month.toString().padLeft(2, '0')}-${_fechaNacimiento.day.toString().padLeft(2, '0')}",
      "usuario": _idUsuario.toJson(),
      "urlImagen": _urlImagen,
  };

}

// Metodos que convierten un elemento de tipo Cliente <-> json

Cliente clienteFromJson(String str) => Cliente.fromJson(json.decode(str));

String clienteToJson(Cliente data) => json.encode(data.toJson());

// Metodos que convierten una lista de elementos de tipo Cliente <-> json

List<Cliente> clientesFromJson(String str) => List<Cliente>.from(json.decode(str).map((x) => Cliente.fromJson(x)));

String clientesToJson(List<Cliente> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
