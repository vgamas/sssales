class TipoCliente {
  int _id = 0;
  String _nombre = "";
  String _descripcion = "";

  TipoCliente({int id = 0, String nombre = "", String descripcion = ""}) {
    this._id = id;
    this._nombre = nombre;
    this._descripcion = descripcion;
  }

  // Getters

  int get getId => this._id;
  String get getNombre => this._nombre;
  String get getDescripcion => this._descripcion;

  // Setters

  set setId(int id) => this._id = id;
  set setNombre(String nombre) => this._nombre = nombre;
  set setDescripcion(String descripcion) => this._descripcion = descripcion;
}

// metodos del CRUD

TipoCliente buscarTipoClientePorId(int id) {
  TipoCliente tipoCliente = TipoCliente();

  // busca el tipo de cliente

  return tipoCliente;
}

TipoCliente buscarTipoClientePorNombre(String nombre) {
  TipoCliente tipoCliente = TipoCliente();

  // buscar en la base por el nombre del cliente

  return tipoCliente;
}

List<TipoCliente>? listarTipoCliente() {
  List<TipoCliente>? listaTipoCliente = [];

  return listaTipoCliente;
}

// agrega o actualiza un tipo de cliente

int agregarTipoCliente(TipoCliente tipoCliente) {
  int estado = 0;

  // agregar a la base, si hay no hay error retorna el estado en 0

  return estado;
}

// los tipos de cliente no se eliminan
