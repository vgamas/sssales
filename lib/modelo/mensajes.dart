class Mensaje {
  int _id = 0;
  int _usrOrigen = 0;
  int _usrDestino = 0;
  DateTime _fechaHora = DateTime.now();
  bool _esPromocional =
      false; // true es un mensaje de promocion enviado por el administrados, si es mensaje de un chat es false
  String _asunto = "";
  String _mensaje = "";
  String _tipo = "N"; // nueva conversacion (N) / respuesta (R)
  bool _estado = false; // leido o no

  Mensaje(
      {int id = 0,
      int usuarioOrigen = 0,
      int usuarioDestino = 0,
      DateTime? fechaHora,
      bool promocional = false,
      String asunto = "",
      String mensaje = "",
      String tipo = "N",
      bool estado = false}) {
    this._id = id;
    this._usrOrigen = usuarioOrigen;
    this._usrDestino = usuarioDestino;
    this._fechaHora = fechaHora ?? DateTime.now();
    this._esPromocional = promocional;
    this._asunto = asunto;
    this._mensaje = mensaje;
    this._tipo = tipo;
    this._estado = estado;
  }

  // Getters

  int get getId => this._id;
  int get getUsuarioOrigen => this._usrOrigen;
  int get getUsuarioDestino => this._usrDestino;
  DateTime get getFecha => this._fechaHora;
  bool get getPromocional => this._esPromocional;
  String get getAsunto => this._asunto;
  String get getMensaje => this._mensaje;
  String get getTipo => this._tipo;
  bool get getEstado => this._estado;

  // Setters

  set setId(int id) => this._id = id;
  set setUsuarioOrigen(int usuario) => this._usrOrigen = usuario;
  set setUsuarioDestino(int usuario) => this._usrDestino = usuario;
  set setFecha(DateTime fecha) => this._fechaHora = fecha;
  set setPromocional(bool promocional) => this._esPromocional = promocional;
  set setAsunto(String asunto) => this._asunto = asunto;
  set setMensaje(String mensaje) => this._mensaje = mensaje;
  set setTipo(String tipo) => this._tipo = tipo;
  set setEstado(bool estado) => this._estado = estado;
}

// Metodos del CRUD

List<Mensaje>? buscarMensajePorUsuario(int usuario) {
  List<Mensaje>? mensaje = null;

  // busca los mensajes de ese usuario en una fecha determinada

  return mensaje;
}

List<Mensaje>? buscarMensajePorFecha(int usuario, DateTime fecha) {
  List<Mensaje>? mensaje = null;

  // busca los mensajes de ese usuario en una fecha determinada

  return mensaje;
}

List<Mensaje>? buscarMensajesEntreFechas(
    int usuario, DateTime fechaInicial, DateTime fechaFinal) {
  List<Mensaje>? mensaje = null;

  // busca los mensajes de ese usuario en una fecha determinada

  return mensaje;
}

List<Mensaje>? buscarMensajePorAsunto(int usuario, String asunto) {
  List<Mensaje>? mensaje = null;

  // busca los mensajes de ese usuario en una fecha determinada

  return mensaje;
}

int agregarMensaje(Mensaje mensaje) {
  int estado = 0;

  // agregar el mensaje a la lista de mensajes del usuario

  return estado;
}

// los mensajes no se pueden eliminar

int marcarMensajeLeido(int idMensaje) {
  int estado = 0;

  // busca el mensaje y le actualiza el estado

  return estado;
}
