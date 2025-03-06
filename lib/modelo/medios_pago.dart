class MedioPago {
  int _id = 0;
  String _nombre = "";
  String _conexion = "";
  bool _estado = true;
  String _instrucciones = "";

  MedioPago(
      {int id = 0,
      String nombre = "",
      String conexion = "",
      bool estado = true,
      String instrucciones = ""}) {
    this._id = id;
    this._nombre = nombre;
    this._conexion = conexion;
    this._estado = estado;
    this._instrucciones = instrucciones;
  }

  // Getters

  int get getId => this._id;
  String get getNombre => this._nombre;
  String get getConexion => this._conexion;
  bool get getEstado => this._estado;
  String get getInstrucciones => this._instrucciones;

  // Setters

  set setId(int id) => this._id = id;
  set setNombre(String nombre) => this._nombre = nombre;
  set setConexion(String conexion) => this._conexion = conexion;
  set setEstado(bool estado) => this._estado = estado;
  set setInstruciones(String instrucciones) =>
      this._instrucciones = instrucciones;
}

// Metodos del CRUD

MedioPago? buscarMedioPagoPorId(int id) {
  MedioPago? medioPago = null;

  // busca en la base el medio de pago

  return medioPago;
}

List<MedioPago>? listarMediosPago() {
  List<MedioPago>? listaMediosPago = [];

  // buscar la lista en la base y cargarla

  return listaMediosPago;
}

int modificarMedioPago(MedioPago nuevoMedioPago) {
  int estado = 0;

  return estado;
}
