// Archivos que contiene las estructura y metodos basicos de las tablas a utilizar

import '../modelo/detalle_ventas.dart';
import '../modelo/ventas.dart';
import '../modelo/productos.dart';

// Archivos con los servicios de acceso a la base de datos para cada tabla requerida

import '../servicio/detalle_ventas_servicio.dart';
import '../servicio/ventas_servicio.dart';
import '../servicio/productos_servicio.dart';

// Estas son las variables de las clases que permiten llamar a los sercicios de acceso a las tablas de la base de datos

DetalleVentasServicio detalleSvc = DetalleVentasServicio();

void main(List<String> args) async {
/*
  // Traer el detalle de una venta

  List<DetalleVenta>? listaDetalle = await detalleSvc.consultarFactura(1);

  if (listaDetalle == null) {
    // no hay registros para mostrar
  } else {
    for (DetalleVenta elemento in listaDetalle) {
      print(elemento.toJson());
    }
  }
*/
/*
  // Consultar todas las facturas que tienen un producto

  List<int>? listaFacturas = await detalleSvc.consultarProducto(1);

  if (listaFacturas == null) {
    // no hay registros para mostrar
  } else {
    for (int elemento in listaFacturas) {
      print(elemento);
    }
  }
*/
/*
  // Agregar un nuevo item al detalle de la factura
  //buscar la factura
  VentaServicio ventaSvc = VentaServicio();

  Venta? factura = await ventaSvc.buscarFactura(1);

  // Cargar el producto
  ProductoServicio productoSvc = ProductoServicio();

  Producto? item = await productoSvc.buscarPorCodigo("ESF002");

  DetalleVenta articulo = DetalleVenta(
      id: 0,
      idVenta: factura!,
      idProducto: item!,
      cantidad: 1,
      precioUnitario: 2000,
      ivaUnitario: 1000);

  DetalleVenta? nuevoArticulo = await detalleSvc.agregar(articulo);

  if (nuevoArticulo == null) {
    print("Error al agregar el articulo");
  } else {
    print(nuevoArticulo.toJson());
  }
  */
}
