import 'dart:ffi';

class Mensaje {
  Uint32 _id;
  Uint32 _usrOrigen;
  Uint32 _usrDestino;
  DateTime _fechaHora;
  bool _esPromocional;
  String _asunto;
  String _mensaje;
  Char _tipo; // emision / respuesta
  bool _estado = false; // leido o no

  Mensaje(this._id, this._usrOrigen, this._usrDestino, this._fechaHora,
      this._esPromocional, this._asunto, this._mensaje, this._tipo);

  // Getters

  Uint32 getId() {
    return this._id;
  }

  Uint32 getUsuarioOrigen() {
    return this._usrOrigen;
  }

  Uint32 getUsuarioDestino() {
    return this._usrDestino;
  }

  DateTime getFecha() {
    return this._fechaHora;
  }

  bool getPromocional() {
    return this._esPromocional;
  }

  String getAsunto() {
    return this._asunto;
  }

  String getMensaje() {
    return this._mensaje;
  }

  Char getTipo() {
    return this._tipo;
  }

  bool getEstado() {
    return this._estado;
  }

  // Setters

  void setId(Uint32 id) {
    this._id = id;
  }

  void setUsuarioOrigen(Uint32 usuario) {
    this._usrOrigen = usuario;
  }

  void setUsuarioDestino(Uint32 usuario) {
    this._usrDestino = usuario;
  }

  void setFecha(DateTime fecha) {
    this._fechaHora = fecha;
  }

  void setPromocional(bool promocional) {
    this._esPromocional = promocional;
  }

  void setAsunto(String asunto) {
    this._asunto = asunto;
  }

  void setMensaje(String mensaje) {
    this._mensaje = mensaje;
  }

  void setTipo(Char tipo) {
    this._tipo = tipo;
  }

  void setEstado(bool estado) {
    this._estado = estado;
  }
}

// Metodos del CRUD

List<Mensaje>? buscarMensajePorUsuario(Uint32 usuario) {
  List<Mensaje>? mensaje = null;

  // busca los mensajes de ese usuario en una fecha determinada

  return mensaje;
}

List<Mensaje>? buscarMensajePorFecha(Uint32 usuario, DateTime fecha) {
  List<Mensaje>? mensaje = null;

  // busca los mensajes de ese usuario en una fecha determinada

  return mensaje;
}

List<Mensaje>? buscarMensajePorAsunto(Uint32 usuario, String asunto) {
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

int marcarMensajeLeido(Uint32 idMensaje) {
  int estado = 0;

  // busca el mensaje y le actualiza el estado

  return estado;
}
