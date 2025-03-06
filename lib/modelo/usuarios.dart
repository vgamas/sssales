class Usuario {
  int _id = 0;
  String _usuario = "";
  int _celular = 0;
  String _correo = "";
  String _contrasena = "";
  int _idRol = 0;
  bool _estado = true; // true = usuario activo, false = inactivo

  Usuario(
      {int id = 0,
      String usuario = "",
      int celular = 0,
      String correo = "",
      String contrasena = "",
      int idRol = 0,
      bool estado = true}) {
    this._id = id;
    this._usuario = usuario;
    this._celular = celular;
    this._correo = correo;
    this._contrasena = contrasena;
    this._idRol = idRol;
    this._estado = estado;
  }

  // Geters

  int get getId => this._id;
  String get getUsuario => this._usuario;
  int get getCelular => this._celular;
  String get getCorreo => this._correo;
  String get getContrasena => this._contrasena;
  int get getRol => this._idRol;
  bool get getEstado => this._estado;

  // Setters

  set setId(int id) => this._id = id;
  set setUsuario(String usuario) => this._usuario = usuario;
  set setCelular(int celular) => this._celular = celular;
  set setCorreo(String correo) => this._correo = correo;
  set setContrasena(String contrasena) => this._contrasena = contrasena;
  set setRol(int idRol) => this._idRol = idRol;
  set setEstado(bool estado) => this._estado = estado;
}

// Metodos para el crud

Usuario buscarUsuarioPorId(int id) {
  Usuario usuario = Usuario();

  // buscar el usuario en la tabla

  return usuario;
}

Usuario buscarUsuarioPorUsuario(String usuario) {
  Usuario usuario = Usuario();

  // buscar el usuario en la tabla

  return usuario;
}

Usuario buscarUsuarioPorCelular(String usuario) {
  Usuario usuario = Usuario();

  // buscar el usuario en la tabla

  return usuario;
}

Usuario buscarUsuarioPorCorreo(String usuario) {
  Usuario usuario = Usuario();

  // buscar el usuario en la tabla

  return usuario;
}

bool validarUsuario(int usuario, String contrasena) {
  bool result = true;
  // consultar la base de datos

  return result;
}

int actualizarUsuario(Usuario usuario) {
  int estado = 0;

  Usuario nuevoUsuario = buscarUsuarioPorId(usuario.getId);

  if (nuevoUsuario.getId != 0) {
    // actualizar el usuario en la base de datos
    // si hay error cambiar el valor de estado
  } else {
    // es un usuario nuevo, hay que crearlo
    // si hay error cambiar el valor de estado
  }

  return estado;
}
