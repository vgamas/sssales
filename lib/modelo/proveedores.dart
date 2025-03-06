class Proveedor {
  int _id = 0;
  String _nombre = "";
  String _contacto = "";
  int _telefono1 = 0;
  int _telefono2 = 0;

  Proveedor(
      {int id = 0,
      String nombre = "",
      String contacto = "",
      int telefono1 = 0,
      int telefono2 = 0}) {
    this._id = id;
    this._nombre = nombre;
    this._contacto = contacto;
    this._telefono1 = telefono1;
    this._telefono2 = telefono2;
  }

  // Getters

  int get getId => this._id;
  String get getNombre => this._nombre;
  String get getContacto => this._contacto;
  int get getTelefono1 => this._telefono1;
  int get getTelefono2 => this._telefono2;

  // Setters

  set setId(int id) => this._id = id;
  set setNombre(String nombre) => this._nombre = nombre;
  set setContacto(String contacto) => this._contacto = contacto;
  set setTelefono1(int telefono) => this._telefono1 = telefono;
  set setTelefono2(int telefono) => this._telefono2 = telefono;
}

// Metodos del CRUD

List<Proveedor>? listarProveedores() {
  List<Proveedor> listaProveedores = [];

  // busca el proveedor en la base de datos y retorna la lista

  return listaProveedores;
}

Proveedor buscarProveedorPorId(int id) {
  Proveedor proveedor = Proveedor();

  // busca en la base de datos por el id del proveedor

  return proveedor;
}

int actualizarProveedor(Proveedor proveedor) {
  int estado = 0;
  Proveedor nuevoProveedor = buscarProveedorPorId(proveedor.getId);

  if (nuevoProveedor.getId != 0) {
    // actualizar el proveedor
    // si hay error, cambiar el estado
  } else {
    // Crear el nuevo proveedor
    // si hay error, cambiar el estado
  }

  return estado;
}
