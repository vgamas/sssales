import '../modelo/productos.dart';
import '../servicio/productos_servicio.dart';

import '../modelo/categorias.dart';
import '../modelo/proveedores.dart';

List<Producto> listaProductos = [];

ProductoServicio productoSvc = ProductoServicio();

void main(List<String> args) async {
/*
  listaProductos = await productoSvc.buscarPorCategoria(1);
  for (Producto elemento in listaProductos) {
    print(elemento.toJson());
  }
  */

/*
  listaProductos = await productoSvc.buscarPorNombre("esfero");
  for (Producto elemento in listaProductos) {
    print(elemento.toJson());
  }
  */

/*
  listaProductos = await productoSvc.buscarPorProveedor(1);
  for (Producto elemento in listaProductos) {
    print(elemento.toJson());
  }
  */

/*  listaProductos = await productoSvc.buscarDestacados();
  for (Producto elemento in listaProductos) {
    print(elemento.toJson());
  }
  */

//  Producto producto = await productoSvc.buscarPorCodigo("esdy001");
//  print(producto.toJson());

  Categoria categoria = Categoria(
      id: 1,
      nombre: "",
      descripcion: "",
      color: "",
      urlImagen: "",
      estado: true);
  Proveedor proveedor =
      Proveedor(id: 1, nombre: "", contacto: "", telefono: 0, celular: 0);

  Producto producto = Producto(
      id: 2,
      nombre: "Otro esfero de colores",
      descripcion: "Otro esfero sin marca de varios colores",
      codigo: "ESF002",
      idCategoria: categoria,
      idProveedor: proveedor,
      fechaCreacion: DateTime(2025, 5, 6),
      stockMinimo: 4,
      existencia: 5,
      cantidadReservada: 0,
      precioCompra: 10000,
      precioVenta: 12000,
      ivaVenta: 2000,
      popularidad: 1,
      destacado: true,
      estado: true);

//  print(await productoSvc.agregar(producto));

  //print(await productoSvc.actualizar(producto));

  //print(await productoSvc.eliminar(2));
}
