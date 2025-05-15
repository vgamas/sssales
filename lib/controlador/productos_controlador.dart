// Archivos que contiene las estructura y metodos basicos de las tablas a utilizar

import '../modelo/productos.dart';
import '../modelo/categorias.dart';
import '../modelo/proveedores.dart';

// Archivos con los servicios de acceso a la base de datos para cada tabla requerida

import '../servicio/productos_servicio.dart';

// Se usa al utilizar una lista de productos, se usa la ? por si la funcion de consulta retorna null (no hay nada para retornar)

List<Producto>? listaProductos = [];

// Estas son las variables de las clases que permiten llamar a los sercicios de acceso a las tablas de la base de datos

ProductoServicio productoSvc = ProductoServicio();

void main(List<String> args) async {
/*
  // Lista todos los productos que pertenecen a una categoria, se pasa el id de la categoria

  listaProductos = await productoSvc.buscarPorCategoria(1);

  if (listaProductos == null) {
    // no se encontraton productos y la lista esta en null, y ya se mostro el error
  } else {
    // Si la lista tiene elementos, se muestran
    for (Producto elemento in listaProductos!) {
      print(elemento.toJson());
    }
  }
*/

/*
  // Lista los productos que cumplen con el patron del nombre, sin importar la categoria

  listaProductos = await productoSvc.buscarPorNombre("esfero");

  if (listaProductos == null) {
    // no se encontraton productos y la lista esta en null, y ya se mostro el error
  } else {
    // Si la lista tiene elementos, se muestran
    for (Producto elemento in listaProductos!) {
      print(elemento.toJson());
    }
  }
*/

/*
  // Lista todos los productos de un proveedor, se pasa el id del proveedor

  listaProductos = await productoSvc.buscarPorProveedor(1);

  if (listaProductos == null) {
    // no se encontraton productos y la lista esta en null, y ya se mostro el error
  } else {
    // Si la lista tiene elementos, se muestran
    for (Producto elemento in listaProductos!) {
      print(elemento.toJson());
    }
  }
  */

/*
  // Lista lo productos marcados como destacados

  listaProductos = await productoSvc.buscarDestacados();
    if (listaProductos == null) {
    // no se encontraton productos y la lista esta en null, y ya se mostro el error
  } else {
    // Si la lista tiene elementos, se muestran
    for (Producto elemento in listaProductos!) {
      print(elemento.toJson());
    }
  }
*/

/*
  // Busca un producto por su codigo

  Producto? producto = await productoSvc.buscarPorCodigo("esdy001");

  if (producto == null) {
    // No hay producto, se mostro el mensaje correspondiente y no se puede continuar
  } else {
    // Trae un producto con ese codigo
    print(producto.toJson());
  }
*/

/*
  // Para agregar un producto, hay que tener la categoria y el proveedor
  // En ambos casos solo es improtante tener el id, pero se debe tener la estructura completa

  // Se crea la estructura con el id de la categoria
  Categoria categoria = Categoria(
      id: 1,
      nombre: "",
      descripcion: "",
      color: "",
      urlImagen: "",
      estado: true);

  // Se crea la estrctura con el id del proveedor
  Proveedor proveedor =
      Proveedor(id: 1, nombre: "", contacto: "", telefono: 0, celular: 0);

  // Se crea el producto, con el id en 0 si es un producto nuevo

  Producto producto = Producto(
      id: 0,
      nombre: "Otro esfero de colores",
      descripcion: "Otro esfero sin marca de varios colores",
      codigo: "ESF003",
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

  Producto? nuevoProducto = await productoSvc.agregar(producto);

  if (nuevoProducto == null) {
    // Hubo un error al agregar el producto y se mostro el error
  } else {
    // producto agregado correctamente, el registro ya trae el id
    print(nuevoProducto.toJson());
  }
*/

/*
  // Para actualizar un producto, ya se debe tener y no cambiar el id

  Producto? producto = await productoSvc.buscarPorCodigo("ESF002");

  if (producto == null) {
    // No se encontro el producto, ya se mostro el mensaje de error, no se puede continuar
  } else {
    // Si se encontro el producto y se pueden actualizar
    // Se cambian los campos que introduzca el usuario
    producto.setCantidadMinima(3);
    // ....

    Producto? productoActualizado = await productoSvc.actualizar(producto);

    if (productoActualizado == null) {
      // hubo un error al actualizar el producto y ya se mostro el mensaje
    } else {
      // Mostrar el mensaje de producto actualizado
      print(productoActualizado.toJson());
    }
  }
*/

/*
  // Para eliminar un producto, ya se debe tener y se usa el id. Esto solo cambia el estado del producto a false

  Producto? productoEliminado = await productoSvc.eliminar(2);

  if (productoEliminado == null) {
    // Hubo un error al eliminar el producto
  } else {
    // Mostrar el mensaje de producto eliminado
    print(productoEliminado.toJson());
  }
*/
}
