class Producto {
  int _id = 0;
  String _nombre = "";
  String _descripcion = "";
  String _codigo = "";
  int _idCategoria = 0;
  int _idProveedor = 0;
  DateTime _fechaCreacion = DateTime.now();
  int _stock = 0;
  int _cantidadMinima = 0;
  int _cantidadReservada = 0;
  String _imagenPrincipal = "";
  double _precioCompra = 0.0;
  double _precioVenta = 0.0;
  double _ivaVenta = 0.0;
  int _popularidad = 0;
  bool _destacado = false; // producto normal = false, producto destacado = true
  bool _estado = true; // activo = true, inactivo = false

  Producto(
      {int id = 0,
      String nombre = "",
      String descripcion = "",
      String codigo = "",
      int categoria = 0,
      int proveedor = 0,
      DateTime? fechaCreacion,
      int stock = 0,
      int cantidadMinima = 0,
      int cantidadReservada = 0,
      String imagenPrincipal = "",
      double precioCompra = 0.0,
      double precioVenta = 0.0,
      double ivaVenta = 0.0,
      int popularidad = 0,
      bool destacado = false,
      bool estado = true}) {
    this._id = id;
    this._nombre = nombre;
    this._descripcion = descripcion;
    this._codigo = codigo;
    this._idCategoria = categoria;
    this._idProveedor = proveedor;
    this._fechaCreacion = fechaCreacion ?? DateTime.now();
    this._stock = stock;
    this._cantidadMinima = cantidadMinima;
    this._cantidadReservada = cantidadReservada;
    this._imagenPrincipal = imagenPrincipal;
    this._precioCompra = precioCompra;
    this._precioVenta = precioVenta;
    this._ivaVenta = ivaVenta;
    this._popularidad = popularidad;
    this._destacado = destacado;
    this._estado = estado;
  }

  // Getters

  int get getId => this._id;
  String get getNombre => this._nombre;
  String get getDescripcion => this._descripcion;
  String get getCodigo => this._codigo;
  int get getCategoria => this._idCategoria;
  int get getProveedor => this._idProveedor;
  DateTime get getFechaCreacion => this._fechaCreacion;
  int get getStock => this._stock;
  int get getCantidadMinima => this._cantidadMinima;
  int get getCantidadReservada => this._cantidadReservada;
  String get getImagenPrincipal => this._imagenPrincipal;
  double get getPrecioCompra => this._precioCompra;
  double get getPrecioVenta => this._precioVenta;
  double get getIvaVenta => this._ivaVenta;
  int get getPopularidad => this._popularidad;
  bool get getDestacado => this._destacado;
  bool get getEstado => this._estado;

  // Setters

  set setId(int id) => this._id = id;
  set setNombre(String nombre) => this._nombre = nombre;
  set setDescripcion(String descripcion) => this._descripcion = descripcion;
  set setCodigo(String codigo) => this._codigo = codigo;
  set setCategoria(int categoria) => this._idCategoria = categoria;
  set setProveedor(int proveedor) => this._idProveedor = proveedor;
  set setFechaCreacion(DateTime fechaCreacion) =>
      this._fechaCreacion = fechaCreacion;
  set setStock(int stock) => this._stock = stock;
  set setCantidadMinima(int cantidadMinima) =>
      this._cantidadMinima = cantidadMinima;
  set setCantidadReservada(int cantidadReservada) =>
      this._cantidadReservada = cantidadReservada;
  set setImagenPrincipal(String url) => this._imagenPrincipal = url;
  set setPrecioCompra(double precioCompra) => this._precioCompra = precioCompra;
  set setPrecioVenta(double precioVenta) => this._precioVenta = precioVenta;
  set setIvaVenta(double ivaVenta) => this._ivaVenta = ivaVenta;
  set setPopularidad(int popularidad) => this._popularidad = popularidad;
  set setDestacado(bool destacado) => this._destacado = destacado;
  set setEstado(bool estado) => this._estado = estado;
}

// Metodos del CRUD

List<Producto>? buscarProductosPorCategoria(int idCategoria) {
  // pensar la posibilidad de crear una estructura con las caracteristicas basicas de cada producto y no con la informacion completa

  List<Producto>? listaProductos = null;

  return listaProductos;
}

Producto buscarProductoporId(int idProducto) {
  Producto producto = Producto();

  return producto;
}

Producto buscarProductoporCodigo(String codigo) {
  Producto producto = Producto();

  // buscar el producto

  return producto;
}

List<Producto>? buscarProductoporNombre(String nombre) {
  List<Producto>? listaProductos = null;

  // buscar el producto

  return listaProductos;
}

int modificarProducto(Producto producto) {
  int estado = 0;

  return estado;
}

int eliminarProducto(Producto producto) {
  int estado = 0;

  // cambia el estado del producto solamente

  return estado;
}

int activaProducto(Producto producto) {
  int estado = 0;

  // cambia el estado del producto solamente

  return estado;
}

int destacaProducto(Producto producto) {
  int estado = 0;

  // cambia el estado de destacado del producto

  return estado;
}

// falta definir los metodos para el manejo del inventario de cada producto y sus respectivos reportes
