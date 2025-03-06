class Ciudad {
  int _id = 0;
  String _nombre = "";
  int _idDepartamento = 0;
  int _codigo = 0;

  Ciudad(
      {int id = 0,
      String nombre = "",
      int idDepartamento = 0,
      int codigo = 0}) {
    this._id = id;
    this._nombre = nombre;
    this._idDepartamento = idDepartamento;
    this._codigo = codigo;
  }

// Getters

  int get getId => this._id;
  String get getNombre => this._nombre;
  int get getDepartamento => this._idDepartamento;
  int get getCodigo => this._codigo;

// Setters

  set setId(int id) => this._id = id;
  set setNombre(String nombre) => this._nombre = nombre;
  set setDepartamento(int dpto) => this._idDepartamento = dpto;
  set setCodigo(int codigo) => this._codigo = codigo;
}

// Metodos para el CRUD

Ciudad buscarCiudadPorID(int id) {
  Ciudad nuevaCiudad = Ciudad();

  // busca la ciudad en la tabla de cudades

  // busca el departamento

  return nuevaCiudad;
}

List<Ciudad>? listarCiudades() {
  List<Ciudad>? listaCiudades = null;
  // buscar las ciudades en la tabla por el id del departamento y crear la lista

  return listaCiudades;
}

// Lista todas las ciudades que pertenecen a un departamento

List<Ciudad>? buscarCiudadesPorDepartamento(int dpto) {
  List<Ciudad>? listaCiudades = null;
  // buscar las ciudades en la tabla por el id del departamento y crear la lista

  return listaCiudades;
}

// Actualiza o crea una ciudad

int actualizarCiudad(Ciudad nuevaCiudad) {
  int estado = 0;
  Ciudad ciudad = Ciudad();

  if (nuevaCiudad.getId != 0) {
    ciudad = buscarCiudadPorID(nuevaCiudad.getId);
  }

  if (ciudad.getId != 0) {
    // actualiza la ciudad
    // Si actualiza deja estado en 0
    // Sino, coloca algun codigo de error
  } else {
    // Crea la ciudad
    // Si se crea correcto deja estado en 0
    // Sino, coloca algun codigo de error
  }

  return estado;
}

// Eliminar Ciudad
