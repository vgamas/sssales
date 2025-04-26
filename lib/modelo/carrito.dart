class Carrito {
  int _id = 0;
  int _idCliente = 0;
  int _idProducto = 0;
  int _cantidad = 0;
  double _precioUnitario = 0;
  double _ivaUnitario = 0;
  DateTime _fechaReserva = DateTime
      .now(); // Pilas para convertir en string la fecha en formato AAAA-MM-DD

  Carrito(
      {int cliente = 0,
      int producto = 0,
      int cantidad = 0,
      double precioUnitario = 0,
      double iva = 0,
      DateTime? fechaReserva}) {
    this._id = 0;
    this._idCliente = cliente;
    this._idProducto = producto;
    this._cantidad = cantidad;
    this._precioUnitario = precioUnitario;
    this._ivaUnitario = iva;
    this._fechaReserva = fechaReserva ?? DateTime.now();
  }

  // Getters

  int get getId => this._id;
  int get getCliente => this._idCliente;
  int get getProducto => this._idProducto;
  int get getCantidad => this._cantidad;
  double get getPrecioUnitario => this._precioUnitario;
  double get getIvaUnitario => this._ivaUnitario;
  DateTime get getFechaReserva => this._fechaReserva;

  // Setters

  set setId(int id) => this._id = id;
  set setCliente(int cliente) => this._idCliente = cliente;
  set setProducto(int producto) => this._idProducto = producto;
  set setCantidad(int cantidad) => this._cantidad = cantidad;
  set setPrecioUnitario(double precio) => this._precioUnitario = precio;
  set setIvaUnitario(double iva) => this._ivaUnitario = iva;
  set setFechaReserva(DateTime fecha) => this._fechaReserva = fecha;
}

// Metodos del CRUD

List<Carrito>? listaCarritoPorCliente(int cliente) {
  List<Carrito>? listaProductos = null;

  return listaProductos;
}

int borrarCarritoPorCliente(int cliente) {
  int estado = 0;

  return estado;
}

actualizarProducto(Carrito producto) {
  int estado = 0;

  List<Carrito>? listaCarrito = listaCarritoPorCliente(producto.getCliente);

  if (listaCarrito == null) {
    // agregar el producto
  } else {
    // buscar producto en la lista
    // actualizar el producto
  }

  return estado;
}
