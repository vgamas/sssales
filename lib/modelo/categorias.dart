import 'dart:ffi';

class Categoria {
  Uint16 _id;
  String _nombre;
  String _descripcion;
  Uint32 _color;
  String _urlImagen;
  bool _estado = true; // true = activa - falte = inactiva

  Categoria(
      this._id, this._nombre, this._descripcion, this._color, this._urlImagen);

  // Getters

  Uint16 getId() {
    return this._id;
  }

  String getNombre() {
    return this._nombre;
  }

  String getDescripcion() {
    return this._descripcion;
  }

  Uint32 getColor() {
    return this._color;
  }

  String getUrlImagen() {
    return this._urlImagen;
  }

  bool getEstado() {
    return this._estado;
  }

  // Setters

  void setId(Uint16 id) {
    this._id = id;
  }

  void setNombre(String nombre) {
    this._nombre = nombre;
  }

  void setDescripcion(String descripcion) {
    this._descripcion = descripcion;
  }

  void setColor(Uint32 color) {
    this._color = color;
  }

  void setUrlImagen(String url) {
    this._urlImagen = url;
  }

  void setEstado(bool estado) {
    this._estado = estado;
  }
}

// Metodos plara el CRUD

Categoria? buscarCategoriaPorId(Uint16 id) {
  Categoria? categoria = null;

  return categoria;
}

int agregarCategoria(Categoria categoria) {
  int estado = 0;

  return estado;
}
