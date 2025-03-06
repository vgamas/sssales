class Cliente {
  int _id = 0;
  String _nombreCompleto = "";
  String _correoElectronico = "";
  int _celular = 0;
  String _direccion = "";
  int _idCiudad = 0;
  bool _estado = true; // true = usuario activo - false = inactivo
  String _observaciones = "";
  int _tipoCliente = 0;
  String _facebook = "";
  String _instagram = "";
  String _whatsapp = "";
  String _tiktok = "";
  DateTime _fechaNacimiento = DateTime.now();
  int _idUsuario = 0;
  String _urlImagen = "";

  Cliente(
      {int id = 0,
      String nombre = "",
      String email = "",
      int celular = 0,
      String direccion = "",
      int idCiudad = 0,
      bool estado = true,
      String observaciones = "",
      int tipoCliente = 0,
      String facebook = "",
      String instagram = "",
      String whatsapp = "",
      String tiktok = "",
      DateTime? fechaNacimiento,
      int idUsuario = 0,
      String urlImagen = ""}) {
    this._id = id;
    this._nombreCompleto = nombre;
    this._correoElectronico = email;
    this._celular = celular;
    this._direccion = direccion;
    this._idCiudad = idCiudad;
    this._observaciones = observaciones;
    this._tipoCliente = tipoCliente;
    this._facebook = facebook;
    this._instagram = instagram;
    this._whatsapp = whatsapp;
    this._tiktok = tiktok;
    this._fechaNacimiento = fechaNacimiento ?? DateTime.now();
    this._idUsuario = idUsuario;
    this._urlImagen = urlImagen;
  }

  // Getters
  int get getId => this._id;
  String get getNombre => this._nombreCompleto;
  String get getCorreoElectronico => this._correoElectronico;
  int get getCelular => this._celular;
  String get getDireccion => this._direccion;
  int get getCiudad => this._idCiudad;
  bool get getEstado => this._estado;
  String get getObservaciones => this._observaciones;
  int get getTipoCliente => this._tipoCliente;
  String get getFacebook => this._facebook;
  String get getInstagram => this._instagram;
  String get getWhatsapp => this._whatsapp;
  String get getTiktok => this._tiktok;
  DateTime get getFechaNacimiento => this._fechaNacimiento;
  int get getUsuario => this._idUsuario;
  String get getImagen => this._urlImagen;

  // Setters
  set setId(int id) => this._id = id;
  set setNombre(String nombre) => this._nombreCompleto = nombre;
  set setCorreoElectronico(String correo) => this._correoElectronico = correo;
  set setCelular(int celular) => this._celular = celular;
  set setDireccion(String direccion) => this._direccion = direccion;
  set setCiudad(int ciudad) => this._idCiudad = ciudad;
  set setEstado(bool estado) => this._estado = estado;
  set setObservaciones(String observaciones) =>
      this._observaciones = observaciones;
  set setTipoCliente(int tipoCliente) => this._tipoCliente = tipoCliente;
  set setFacebook(String facebook) => this._facebook = facebook;
  set setInstagram(String instagram) => this._instagram = instagram;
  set setWhatsapp(String whatsapp) => this._whatsapp = whatsapp;
  set setTiktok(String tiktok) => this._tiktok = tiktok;
  set setFechaNacimiento(DateTime fechaNacimiento) =>
      this._fechaNacimiento = fechaNacimiento;
  set setUsuario(int usuario) => this._idUsuario = usuario;
  set setUrlImagen(String url) => this._urlImagen = url;
}

// Metodos del CRUD

Cliente buscarClientePorId(int id) {
  Cliente cliente = Cliente();

  return cliente;
}

Cliente? buscarClientePorUsuario(int usuario) {
  Cliente? cliente = null;

  return cliente;
}

List<Cliente>? listarClientes() {
  List<Cliente>? listaClientes = null;

  return listaClientes;
}

List<Cliente>? listarClientesPorCiudad(int ciudad) {
  List<Cliente>? listaClientes = null;

  return listaClientes;
}

int actualizarCliente(Cliente cliente) {
  int estado = 0;

  return estado;
}

int eliminarCliente(Cliente cliente) {
  cliente.setEstado = false;

  return actualizarCliente(cliente);
}
