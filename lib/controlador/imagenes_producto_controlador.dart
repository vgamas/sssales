import 'package:flutter/foundation.dart';

import '../modelo/imagenes_producto.dart';
import '../modelo/productos.dart';
import '../modelo/categorias.dart';
import '../modelo/proveedores.dart';

import '../servicio/imagenes_producto_servicio.dart';

List<ImagenProducto> listaImagenes = [];

ImagenProductoServicio imgProductoSvc = ImagenProductoServicio();

void main(List<String> args) async {
  /*
  listaImagenes = await imgProductoSvc.listar(1);
  for (ImagenProducto elemento in listaImagenes) {
    print(elemento.toJson());
  }
  */

/*
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
      nombre: "",
      descripcion: "",
      codigo: "`",
      idCategoria: categoria,
      idProveedor: proveedor,
      fechaCreacion: DateTime.now(),
      stockMinimo: 0,
      existencia: 0,
      cantidadReservada: 0,
      precioCompra: 0,
      precioVenta: 0,
      ivaVenta: 0,
      popularidad: 0,
      destacado: true,
      estado: true);

  ImagenProducto nuevaImagen = ImagenProducto(
      id: 0, idProducto: producto, urlImagen: "primera imagen", estado: true);

  print(await imgProductoSvc.agregar(nuevaImagen));
  */

  print(await imgProductoSvc.eliminar(1));
}
