class Rol {
  int _id = 0;
  String _nombre = "";

  Rol({int id = 0, String nombre = ""}) {
    this._id = id;
    this._nombre = nombre;
  }

  // Getters

  int get getId => this._id;
  String get getNombre => this._nombre;

  // Seters

  set setId(int id) => this._id = id;
  set setNombre(String nombre) => this._nombre = nombre;
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

Rol? buscarRolPorId(int id) {
  Rol? rol = null;

  // busca el rol y lo retorna si lo encuentra

  return rol;
}

List<Rol>? listarRoles() {
  List<Rol>? roles = [];

  // busca la lista de roles

  return roles;
}
