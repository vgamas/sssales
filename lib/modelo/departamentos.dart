class Departamento {
  int _id = 0;
  String _nombre = "";
  int _codigo = 0;

  Departamento({int id = 0, String nombre = "", int codigo = 0}) {
    this._id = id;
    this._nombre = nombre;
    this._codigo = codigo;
  }

// Getters

  int get getId => this._id;
  String get getNombre => this._nombre;
  int getCodigo() => this._codigo;

// Setters

  set setId(int id) => this._id = id;
  set setNombre(String nombre) => this._nombre = nombre;
  set setCodigo(int codigo) => this._codigo = codigo;
}

// Metodos para el CRUD

// Busca un departamento por su id

Departamento? buscarDepartamentoPorId(int id) {
  Departamento? departamento = null;

  // busca en la base de datos para encontrar el departamento

  return departamento;
}

// Busca un departamento por su codigo

Departamento? buscarDepartamentoPorCodigo(int id) {
  Departamento? departamento = null;

  // busca en la base de datos para encontrar el departamento

  return departamento;
}

// Trae la lista de todos los departamentos que se encuentran en la base

List<Departamento>? listaDepartamentos() {
  // buscar en la base de datos la lista de departamentos y crear la lista
  // Consumir la api...

  return null;
}

// Actualiza o crea un departamento

int actualizarDepartamento(Departamento nuevoDpto) {
  int estado = 0;
  Departamento? departamento = buscarDepartamentoPorId(nuevoDpto.getId);

  if (departamento != null) {
    // actualiza el departamento
    // Si actualiza deja estado en 0
    // Sino, coloca algun codigo de error
  } else {
    // Crea la empresa
    // Si se crea la empresa correcto deja estado en 0
    // Sino, coloca algun codigo de error
  }

  return estado;
}

// Eliminar departamento
