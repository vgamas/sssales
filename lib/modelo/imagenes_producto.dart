class ImagenProducto {
  int _id = 0;
  int _idProducto = 0;
  String _imagen = "";
  bool _estado = true;

  ImagenProducto(
      {int id = 0,
      int producto = 0,
      String urlImagen = "",
      bool estado = true}) {
    this._id = id;
    this._idProducto = producto;
    this._imagen = urlImagen;
    this._estado = estado;
  }

  // Getters

  int get getId => this._id;
  int get getProducto => this._idProducto;
  String get getImagen => this._imagen;
  bool get getEstado => this._estado;

  // Setters

  set setId(int id) => this._id = id;
  set setProducto(int idProducto) => this._idProducto = idProducto;
  set setImagen(String url) => this._imagen = url;
  set setEstado(bool estado) => this._estado = estado;
}

List<ImagenProducto>? listarImagenesPorProduto(int idProducto) {
  List<ImagenProducto>? listaImagenes = null;

  // buscar las imagenes

  return listaImagenes;
}

int agregarImagen(ImagenProducto imagen) {
  int estado = 0;

  return estado;
}

int eliminarImagen(int idImagen) {
  int estado = 0;

  // cambiar estado de la imagen

  return estado;
}
