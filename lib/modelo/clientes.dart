import 'dart:ffi';

class Cliente {
  Uint16 _id;
  String _nombreCompleto;
  String _correoElectronico;
  Uint16 _celular;
  String _direccion;
  Uint16 _idCiudad;
  bool _estado = true; // true = usuario activo - false = inactivo
  String _observaciones;
  Char _tipoCliente;
  String _facebook;
  String _instagram;
  String _whatsapp;
  String _tiktok;
  DateTime _fechaNacimiento;
  Uint32 _idUsuario;
  String _urlImagen;

  Cliente(
      this._id,
      this._nombreCompleto,
      this._correoElectronico,
      this._celular,
      this._direccion,
      this._idCiudad,
      this._observaciones,
      this._tipoCliente,
      this._facebook,
      this._instagram,
      this._whatsapp,
      this._tiktok,
      this._fechaNacimiento,
      this._idUsuario,
      this._urlImagen);

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

  Uint16 getCiudad() {
    return this._idCiudad;
  }

  bool getEstado() {
    return this._estado;
  }

  String getObservaciones() {
    return this._observaciones;
  }

  Char getTipoCliente() {
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

  Uint32 getUsuario() {
    return this._idUsuario;
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

  void setCiudad(Uint16 ciudad) {
    this._idCiudad = ciudad;
  }

  void setEstado(bool estado) {
    this._estado = estado;
  }

  void setObservaciones(String observaciones) {
    this._observaciones = observaciones;
  }

  void setTipoCliente(Char tipoCliente) {
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

  void setUsuario(Uint32 usuario) {
    this._idUsuario = usuario;
  }

  void setUrlImagen(String url) {
    this._urlImagen = url;
  }
}

// Metodos del CRUD

Cliente? buscarClientePorId(Uint16 id) {
  Cliente? cliente = null;

  return cliente;
}

Cliente? buscarClientePorUsuario(Uint32 usuario) {
  Cliente? cliente = null;

  return cliente;
}

List<Cliente>? listarClientes() {
  List<Cliente>? listaClientes = null;

  return listaClientes;
}

List<Cliente>? listarClientesPorCiudad(Uint16 ciudad) {
  List<Cliente>? listaClientes = null;

  return listaClientes;
}

int actualizarCliente(Cliente cliente) {
  int estado = 0;

  return estado;
}

int eliminarCliente(Cliente cliente) {
  cliente.setEstado(false);

  return actualizarCliente(cliente);
}
