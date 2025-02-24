import 'dart:ffi';

import 'package:sssales/modelo/ciudades.dart';
import 'package:sssales/modelo/tiposcliente.dart';
import 'usuarios.dart';

class Clientes {
  Uint16 _id;
  String _nombreCompleto;
  String _correoElectronico;
  Uint16 _celular;
  String _direccion;
  Ciudad _Ciudad;
  late bool _estado;
  String _observaciones;
  TipoCliente _tipoCliente;
  String _facebook;
  String _instagram;
  String _whatsapp;
  String _tiktok;
  DateTime _fechaNacimiento;
  Usuario _usuario;
  String _urlImagen;

  Clientes(
      this._id,
      this._nombreCompleto,
      this._correoElectronico,
      this._celular,
      this._direccion,
      this._Ciudad,
      this._observaciones,
      this._tipoCliente,
      this._facebook,
      this._instagram,
      this._whatsapp,
      this._tiktok,
      this._fechaNacimiento,
      this._usuario,
      this._urlImagen) {
    this._estado = true;
  }

  // Getters
  Uint16 getId() {
    return this._id;
  }

  String getNombre() {
    return this._nombreCompleto;
  }

  String getCorreoElecgtronico() {
    return this._correoElectronico;
  }

  Uint16 getCelular() {
    return this._celular;
  }

  String getDireccion() {
    return this._direccion;
  }

  Ciudad getCiudad() {
    return this._Ciudad;
  }

  bool getEstado() {
    return this._estado;
  }

  String getObservaciones() {
    return this._observaciones;
  }

  TipoCliente getTipoCliente() {
    return this._tipoCliente;
  }

  String getFacebook() {
    return this._facebook;
  }

  String getInstagram() {
    return this._instagram;
  }

  String getWhatsapp() {
    return this._whatsapp;
  }

  String getTiktok() {
    return this._tiktok;
  }

  DateTime getFechaNacimiento() {
    return this._fechaNacimiento;
  }

  Usuario getUsuario() {
    return this._usuario;
  }

  String getImagen() {
    return this._urlImagen;
  }

  // Setters
  void setId(Uint16 id) {
    this._id = id;
  }

  void setNombre(String nombre) {
    this._nombreCompleto = nombre;
  }

  void setCorreoElectronico(String correo) {
    this._correoElectronico = correo;
  }

  void setCelular(Uint16 celular) {
    this._celular = celular;
  }

  void setDireccion(String direccion) {
    this._direccion = direccion;
  }

  void setCiudad(Ciudad ciudad) {
    this._Ciudad = ciudad;
  }

  void setEstado(bool estado) {
    this._estado = estado;
  }

  void setObservaciones(String observaciones) {
    this._observaciones = observaciones;
  }

  void setTipoCliente(TipoCliente tipoCliente) {
    this._tipoCliente = tipoCliente;
  }

  void setFacebook(String facebook) {
    this._facebook = facebook;
  }

  void setInstagram(String instagram) {
    this._instagram = instagram;
  }

  void setWhatsapp(String whatsapp) {
    this._whatsapp = whatsapp;
  }

  void setTiktok(String tiktok) {
    this._tiktok = tiktok;
  }

  void setFechaNacimiento(DateTime fechaNacimiento) {
    this._fechaNacimiento = fechaNacimiento;
  }

  void setUsuario(Usuario usuario) {
    this._usuario = usuario;
  }

  void setUrlImagen(String url) {
    this._urlImagen = url;
  }
}

// Metodos del CRUD