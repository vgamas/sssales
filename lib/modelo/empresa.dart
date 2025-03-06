class Empresa {
  String _nombre = "";
  String _direccion = "";
  int _telefonoFijo = 0;
  int _telefonoCelular = 0;
  int _idCiudad = 0;
  String _urlLogo = "";
  String _nombreTienda = "";
  bool _estado = true;

  Empresa(
      {String nombre = "",
      String direccion = "",
      int telefonoFijo = 0,
      int telefonoCelular = 0,
      int idCiudad = 0,
      String url = "",
      String nombreTienda = "",
      bool estado = true}) {
    this._nombre = nombre;
    this._direccion = direccion;
    this._telefonoFijo = telefonoFijo;
    this._telefonoCelular = telefonoCelular;
    this._idCiudad = idCiudad;
    this._urlLogo = url;
    this._nombreTienda = nombreTienda;
    this._estado = estado;
  }

// Getters

  String get getNombre => this._nombre;
  String get getDireccion => this._direccion;
  int get getTelefonoFijo => this._telefonoFijo;
  int get getTelefonoCelular => this._telefonoCelular;
  int get getCiudad => this._idCiudad;
  String get getUrlLogo => this._urlLogo;
  String get getNombreTienda => this._nombreTienda;
  bool get getEstado => this._estado;

  // Setters

  set setNombre(String nombre) => this._nombre = nombre;
  set setDireccion(String direccion) => this._direccion = direccion;
  set setTelefonoFijo(int telefono) => this._telefonoFijo = telefono;
  set setTelefonoCelular(int telefono) => this._telefonoCelular = telefono;
  set setCiudad(int idCiudad) => this._idCiudad = idCiudad;
  set setUrlLogo(String url) => this._urlLogo = url;
  set setNombreTienda(String nombre) => this._nombreTienda = nombre;
  set setEstado(bool estado) => this._estado = estado;
}

// Metodos del CRUD

Empresa buscarEmpresa() {
  Empresa empresa = Empresa();
  // consume la api o busca en la bd.

  return empresa;
}

int actualizarEmpresa(Empresa nuevaEmpresa) {
  int estado = 0;
  Empresa? empresa = buscarEmpresa();

  if (empresa.getNombre.isNotEmpty) {
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
