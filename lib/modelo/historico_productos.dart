class HistoricoProducto {
  int _id = 0;
  int _idProducto = 0;
  DateTime _fecha = DateTime.now();
  int _cantidad = 0;
  double _precioCompra = 0;
  double _precioVenta = 0;
  double _ivaVenta = 0;

  HistoricoProducto(
      {int id = 0,
      int idProducto = 0,
      DateTime? fecha,
      int cantidad = 0,
      double precioCompra = 0,
      double precioVenta = 0,
      double ivaVenta = 0}) {
    this._id = id;
    this._idProducto = idProducto;
    this._fecha = fecha ?? DateTime.now();
    this._cantidad = cantidad;
    this._precioCompra = precioCompra;
    this._precioVenta = precioVenta;
    this._ivaVenta = ivaVenta;
  }

  // Getters

  int get getId => this._id;
  int get getProducto => this._idProducto;
  DateTime get getFecha => this._fecha;
  int get getCantidad => this._cantidad;
  double get getPrecioCompra => this._precioCompra;
  double get getPrecioVenta => this._precioVenta;
  double get getIvaVenta => this._ivaVenta;

  // Setters

  set setId(int id) => this._id = id;
  set setProducto(int producto) => this._idProducto;
  set setFecha(DateTime fecha) => this._fecha = fecha;
  set setCantidad(int cantidad) => this._cantidad = cantidad;
  set setPrecioCompra(double precio) => this._precioCompra = precio;
  set setPrecioVenta(double precio) => this._precioVenta = precio;
  set setIvaVenta(double precio) => this._ivaVenta = precio;
}

// Metodos del CRUD

List<HistoricoProducto>? buscarHistoriaProductoPorId(int idProducto) {
  List<HistoricoProducto>? listaHistorico = null;

  return listaHistorico;
}

int agregarHistorico(HistoricoProducto historico) {
  int estado = 0;

  return estado;
}
