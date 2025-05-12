// Archivos que contiene las estructura y metodos basicos de las tablas a utilizar
import '../modelo/imagenes_producto.dart';
import '../modelo/productos.dart';
import '../modelo/categorias.dart';
import '../modelo/proveedores.dart';

// Archivos con los servicios de acceso a la base de datos para cada tabla requerida

import '../servicio/imagenes_producto_servicio.dart';
import '../servicio/productos_servicio.dart';

// Se usa al utilizar una lista de imagenes del producgto, se usa la ? por si la funcion de consulta retorna null (no hay nada para retornar)

List<ImagenProducto>? listaImagenes = [];

// Estas son las variables de las clases que permiten llamar a los sercicios de acceso a las tablas de la base de datos

ImagenProductoServicio imgProductoSvc = ImagenProductoServicio();
ProductoServicio productoSvc = ProductoServicio();

void main(List<String> args) async {
/*
  // Lista todas las imagenes de un producto, se pasa el id del producto

  listaImagenes = await imgProductoSvc.listar(1);

  if(listaImagenes == null ) {
    // hubo un error al recuperar la lista de imagenes y se mostro el error.
  } else {
    // Muestra la lista de imagenes se utiliza ! para quitar la posibilidad del null
    for (ImagenProducto elemento in listaImagenes!) {
      print(elemento.toJson());
    }
  }
*/

/*
  // Agrega una imagen a la lista, se debe tener el producto
  Producto? producto = await productoSvc.buscarPorCodigo("ESF001");

  if (producto == null) {
    // No se encuentra el producto, ya se mostro el mensaje no se puede continuar
  } else {

    // Se llenan los datos de la imagen ingresados por el usuario
    ImagenProducto nuevaImagen = ImagenProducto(
        id: 0, idProducto: producto, urlImagen: "primera imagen", estado: true);

    ImagenProducto? imagenAgregada = await imgProductoSvc.agregar(nuevaImagen);

    if (imagenAgregada == null) {
      // Hubo un error al agregar la imagen, se mostro el mensaje, no se puede continuar
    } else {
      // Mostrar el mensaje correspondiente y continuaar
    }
  }
  */

/*
  // Para elimiar una imagen, se necesita su id

  if ((await imgProductoSvc.eliminar(1)) == null) {
    // Hubo un error al eliminar la imagen, ya se mostro el mensaje no se puede continuar
  } else {
    // se muestra el mensaje de eliminacion correcto
  }
  */
}
