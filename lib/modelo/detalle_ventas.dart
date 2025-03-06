class DetalleVenta {
  int _id = 0;
  int _idVenta = 0;
  int _idProducto = 0;
  int _cantidad = 0;
  double _precioUnitario = 0;
  double _ivaUnitario = 0;

  DetalleVenta(
      {int id = 0,
      int idVenta = 0,
      int idProducto = 0,
      int cantidad = 0,
      double precioUnitario = 0,
      double ivaUnitario = 0}) {
    this._id = id;
    this._idVenta = _idVenta;
    this._idProducto = idProducto;
    this._cantidad = cantidad;
    this._precioUnitario = precioUnitario;
    this._ivaUnitario = ivaUnitario;
  }

  // Getters

  int get getId => this._id;
  int get getIdVenta => this._idVenta;
  int get getIdProducto => this._idProducto;
  int get getCantidad => this._cantidad;
  double get getPrecioUnitario => this._precioUnitario;
  double get getIvaUnitario => this._ivaUnitario;

  // Setters

  set setId(int id) => this._id = id;
  set setIdVenta(int idVenta) => this._idVenta = idVenta;
  set setIdProducto(int idProducto) => this._idProducto = idProducto;
  set setCantidad(int cantidad) => this._cantidad = cantidad;
  set setPrecioUnitario(double precioUnitario) =>
      this._precioUnitario = precioUnitario;
  set setIvaUnitario(double iva) => this._ivaUnitario = iva;
}

// Metodos del CRUD

List<DetalleVenta>? detalleVentaPorVenta(int venta) {
  List<DetalleVenta>? detalleVenta = null;

  return detalleVenta;
}

int agregarDetalleVenta(DetalleVenta detalle) {
  int estado = 0;

  return estado;
}

void borrarDetalleVenta(int idVenta) {}
