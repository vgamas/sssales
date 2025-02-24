import 'dart:ffi';

class ImagenesMensaje {
  Uint32 _id;
  Uint32 _idMensaje;
  String _urlImagen;

  ImagenesMensaje(this._id, this._idMensaje, this._urlImagen);

  // Getters

  Uint32 getId() {
    return this._id;
  }

  Uint32 getIdMensaje() {
    return this._idMensaje;
  }

  String getUrlImagen() {
    return this._urlImagen;
  }

  // Setters

  void setId(Uint32 id) {
    this._id = id;
  }

  void setIdMensaje(Uint32 idMensaje) {
    this._idMensaje = idMensaje;
  }

  void setUrlImagen(String url) {
    this._urlImagen = url;
  }
}

// Metodos del CRUD

List<ImagenesMensaje>? listaImagenesDeMensaje(Uint32 idMensaje) {
  List<ImagenesMensaje>? listaImagenes = null;

  // busca la lista de las imagenes

  return listaImagenes;
}

int agregarImagenMensaje(ImagenesMensaje imagen) {
  int estado = 0;

  return estado;
}
