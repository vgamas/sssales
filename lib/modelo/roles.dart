import 'dart:ffi';

class Rol {
  Uint16 _id;
  String _nombre;

  Rol(this._id, this._nombre);

  // Getters

  Uint16 getId() {
    return this._id;
  }

  String getNombre() {
    return this._nombre;
  }

  // Seters

  void setId(Uint16 id) {
    this._id = id;
  }

  void setNombre(String nombre) {
    this._nombre = nombre;
  }
}
// Metodos para el CRUD

int actualizarRol(Rol nuevoRol) {
  int estado = 0;
  Rol? rol = buscarRolPorId(nuevoRol._id);

  if (rol != null) {
    // actualiza el rol
    // Si actualiza deja estado en 0
    // Sino, coloca algun codigo de error
  } else {
    // Crea el rol
    // Si se crea la empresa correcto deja estado en 0
    // Sino, coloca algun codigo de error
  }

  return estado;
}

Rol? buscarRolPorId(Uint16 id) {
  Rol? rol = null;

  // busca el rol y lo retorna si lo encuentra

  return rol;
}

List<Rol>? listarRoles() {
  // busca la lista de roles

  return null;
}
