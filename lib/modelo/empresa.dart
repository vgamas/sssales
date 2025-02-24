import 'dart:ffi';
import 'ciudades.dart';

class Empresa {
  String _nombre;
  String _direccion;
  Uint16 _telefonoFijo;
  Uint16 _telefonoCelular;
  Uint16 _idCiudad;
  String _urlLogo;
  String _nombreTienda;
  bool _estado = true;

  Empresa(this._nombre, this._direccion, this._telefonoFijo,
      this._telefonoCelular, this._idCiudad, this._urlLogo, this._nombreTienda);

  String getNombre() {
    return this._nombre;
  }

  String getDireccion() {
    return this._direccion;
  }

  Uint16 getTelefonoFijo() {
    return this._telefonoFijo;
  }

  Uint16 getTelefonoCelular() {
    return this._telefonoCelular;
  }

  Uint16 getCiudad() {
    return this._idCiudad;
  }

  String getUrlLogo() {
    return this._urlLogo;
  }

  String getNombreTienda() {
    return this._nombreTienda;
  }

  bool getEstado() {
    return this._estado;
  }

  void setNombre(String nombre) {
    this._nombre = nombre;
  }

  void setDireccion(String direccion) {
    this._direccion = direccion;
  }

  void setTelefonoFijo(Uint16 telefono) {
    this._telefonoFijo = telefono;
  }

  void setTelefonoCelular(Uint16 telefono) {
    this._telefonoCelular = telefono;
  }

  void setCiudad(Uint16 ciudad) {
    this._idCiudad = ciudad;
  }

  void setUrlLogo(String url) {
    this._urlLogo = url;
  }

  void setNombreTienda(String nombre) {
    this._nombreTienda = nombre;
  }

  void setEstado(bool estado) {
    this._estado = estado;
  }
}

Empresa? buscarEmpresa() {
  Empresa? empresa = null;
  // consume la api o busca en la bd.

  return empresa;
}

int actualizarEmpresa(Empresa nuevaEmpresa) {
  int estado = 0;
  Empresa? empresa = buscarEmpresa();

  if (empresa != null) {
    // actualiza la empresa
    // Si actualiza deja estado en 0
    // Sino, coloca algun codigo de error
  } else {
    // Crea la empresa
    // Si se crea la empresa correcto deja estado en 0
    // Sino, coloca algun codigo de error
  }

  return estado;
}
