class Categoria {
  int _id = 0;
  String _nombre = "";
  String _descripcion = "";
  int _color = 0;
  String _urlImagen = "";
  bool _estado = true; // true = activa - falte = inactiva

  Categoria(
      {int id = 0,
      String nombre = "",
      String descripcion = "",
      int color = 0,
      String url = "",
      bool estado = true}) {
    this._id = id;
    this._nombre = nombre;
    this._descripcion = descripcion;
    this._color = color;
    this._urlImagen = url;
    this._estado = estado;
  }

  // Getters

  int get getId => this._id;
  String get getNombre => this._nombre;
  String get getDescripcion => this._descripcion;
  int get getColor => this._color;
  String get getUrlImagen => this._urlImagen;
  bool get getEstado => this._estado;

  // Setters

  set setId(int id) => this._id = id;
  set setNombre(String nombre) => this._nombre = nombre;
  set setDescripcion(String descripcion) => this._descripcion = descripcion;
  set setColor(int color) => this._color = color;
  set setUrlImagen(String url) => this._urlImagen = url;
  set setEstado(bool estado) => this._estado = estado;
}

// Metodos plara el CRUD

List<Categoria>? listarCategorias() {
  List<Categoria>? listaCategorias = null;

  // buscar categorias en la base de datos

  return listaCategorias;
}

Categoria? buscarCategoriaPorId(int id) {
  Categoria? categoria = null;

  return categoria;
}

int agregarCategoria(Categoria categoria) {
  int estado = 0;

  return estado;
}

// Las categorias no se eliminan
