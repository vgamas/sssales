class Venta {
  int _id = 0;
  int _idCliente = 0;
  DateTime _fecha = DateTime.now();
  double _valorProductos = 0;
  double _ivaProductos = 0;
  int _medioPago = 0;
  String _referenciaPago = "";
  int _factura = 0;
  bool _estado =
      false; // si esta confirmado el pago de la venta = true, de lo contrario false

  Venta(
      {int id = 0,
      int cliente = 0,
      DateTime? fecha,
      double valorProductos = 0,
      double ivaProductos = 0,
      int medioPago = 0,
      String referencia = "",
      int factura = 0,
      bool estado = false}) {
    this._id = id;
    this._idCliente = cliente;
    this._fecha = fecha ?? DateTime.now();
    this._valorProductos = valorProductos;
    this._ivaProductos = ivaProductos;
    this._medioPago = medioPago;
    this._referenciaPago = referencia;
    this._factura = factura;
    this._estado = estado;
  }

  // Getters

  int get getId => this._id;
  int get getCliente => this._idCliente;
  DateTime get getFecha => this._fecha;
  double get getValorProductos => this._valorProductos;
  double get getIvaProductos => this._ivaProductos;
  int get getMedioPago => this._medioPago;
  String get getRefereciaPago => this._referenciaPago;
  int get getFactura => this._factura;
  bool get getEstado => this._estado;

  // Setters

  set setId(int id) => this._id = id;
  set setCliente(int idCliente) => this._idCliente = idCliente;
  set setFecha(DateTime fecha) => this._fecha = fecha;
  set setValorProductos(double valorProductos) =>
      this._valorProductos = valorProductos;
  set setIvaProductos(double ivaProductos) => this._ivaProductos = ivaProductos;
  set setMedioPago(int medioPago) => this._medioPago = medioPago;
  set setReferenciaPago(String ReferenciaPago) =>
      this._referenciaPago = ReferenciaPago;
  set setFactura(int factura) => this._factura = factura;
  set setEstado(bool estado) => this._estado = estado;
}

// Metodos del CRUD

List<Venta>? listarVentasPorCliente(int cliente) {
  List<Venta>? listaVentas = null;

  return listaVentas;
}

List<Venta>? listarVentasPorFecha(DateTime fechaInicial, DateTimefechaFinal) {
  List<Venta>? listaVentas = null;

  return listaVentas;
}

Venta buscarVentaPorId(int id) {
  Venta venta = Venta();

  return venta;
}

int agregarVenta(Venta venta) {
  int estado = 0;

  return estado;
}

int confirmarPagoVenta(int idVenta) {
  int estado = 0;

  return estado;
}
