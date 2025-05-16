class ImagenMensaje {
  int _id = 0;
  int _idMensaje = 0;
  String _urlImagen = "";

  ImagenMensaje({int id = 0, int idMensaje = 0, String urlImagen = ""}) {
    this._id = id;
    this._idMensaje = 0;
    this._urlImagen = "";
  }

  // Getters

  int get getId => this._id;
  int get getIdMensaje => this._idMensaje;
  String get getUrlImagen => this._urlImagen;

  // Setters

  set setId(int id) => this._id = id;
  set setIdMensaje(int idMensaje) => this._idMensaje = idMensaje;
  set setUrlImagen(String url) => this._urlImagen = url;
}

// Metodos del CRUD

List<ImagenMensaje>? listaImagenesDeMensaje(int idMensaje) {
  List<ImagenMensaje>? listaImagenes = null;

  // busca la lista de las imagenes

  return listaImagenes;
}

int agregarImagenMensaje(ImagenMensaje imagen) {
  int estado = 0;

  return estado;
}
