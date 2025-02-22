import 'dart:ffi';

class Departamento {
  Uint16 _id;
  String _nombre;
  Uint16 _codigo;

  Departamento(this._id, this._nombre, this._codigo);

// Getters

  Uint16 getId() {
    return this._id;
  }

  String getNombre() {
    return this._nombre;
  }

  Uint16 getCodigo() {
    return this._codigo;
  }

// Setters

  void setId(Uint16 id) {
    this._id = id;
  }

  void setNombre(String nombre) {
    this._nombre = nombre;
  }

  void setCodigo(Uint16 codigo) {
    this._codigo = codigo;
  }
}

// Metodos para el CRUD

// Busca un departamento por su id

Departamento? buscarDepartamentoPorId(Uint16 id) {
  Departamento? departamento = null;

  // busca en la base de datos para encontrar el departamento

  return departamento;
}

// Busca un departamento por su codigo

Departamento? buscarDepartamentoPorCodigo(Uint16 id) {
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
  Departamento? departamento = buscarDepartamentoPorId(nuevoDpto.getId());

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
