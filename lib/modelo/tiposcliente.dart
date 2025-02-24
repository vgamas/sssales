import 'dart:ffi';

class TipoCliente {
  Char _id;
  String _nombre;
  String _descripcion;

  TipoCliente(this._id, this._nombre, this._descripcion);

  // Getters

  Char getId() {
    return this._id;
  }

  String getNombre() {
    return this._nombre;
  }

  String getDescripcion() {
    return this._descripcion;
  }

  // Setters

  void setId(Char id) {
    this._id = id;
  }

  void setNombre(String nombre) {
    this._nombre = nombre;
  }

  void setDescripcion(String descripcion) {
    this._descripcion = descripcion;
  }
}

// metodos del CRUD

TipoCliente? buscarTipoClientePorId(Char id) {
  TipoCliente? tipoCliente = null;

  // busca el tipo de cliente

  return tipoCliente;
}

TipoCliente? buscarTipoClientePorNombre(String nombre) {
  TipoCliente? tipoCliente = null;

  // buscar en la base por el nombre del cliente

  return tipoCliente;
}

// agrega o actualiza un tipo de cliente

int agregarTipoCliente(TipoCliente tipoCliente) {
  int estado = 0;

  // agregar a la base, si hay no hay error retorna el estado en 0

  return estado;
}

// los tipos de cliente no se eliminan
