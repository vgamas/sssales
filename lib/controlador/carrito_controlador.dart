// Archivos que contiene las estructura y metodos basicos de las tablas a utilizar para el carrito

import '../modelo/carrito.dart';
import '../modelo/clientes.dart';
import '../modelo/productos.dart';

// Archivos con los servicios de acceso a la base de datos para cada tabla requerida

import '../servicio/carrito_servicio.dart';
import '../servicio/clientes_servicio.dart';
import '../servicio/productos_servicio.dart';

// Se usa al consultar la lista de articulos, se usa la ? por si la funcion de consulta retorna null (no hay nada para retornar)

List<Carrito>? listaArticulos = [];

// Estas son las variables de las clases que permiten llamar a los sercicios de acceso a las tablas de la base de datos

CarritoServicio carritoSvc = new CarritoServicio();
ClienteServicio clienteSvc = new ClienteServicio();
ProductoServicio productoSvc = new ProductoServicio();

void main(List<String> args) async {
/*
  // Para listar los articulos del carrito de un cliente
  // Primero hay que tener el codigo del cliente o sea que debe estar autenticado en el sistema

  listaArticulos = await carritoSvc.listarPorCliente(1);

  if (listaArticulos == null) {
    // Si i no hay articulos para mostrar, Ya se mostro el mensaje de error, pero no se puede hacer nada
  } else { 
    
    // De lo contrario se hace lo que se requiere con la lista
    for (Carrito elemento in listaArticulos!) {
      print(elemento.toJson());
    }
  }
*/

//*
  // Trae el cliente
  Cliente? nuevoCliente = await clienteSvc.buscarPorId(1);

  // Trae el producto que selecciono el cliente
  Producto? producto = await productoSvc.buscarPorCodigo("ESF002");

  // Como el cliente y el prodcto ya estan validados se utiliza el ! para quitar el null
  // Hay que crear la estructura del articulo para despues realizar la actualizacion de la base de datos

  Carrito articulo = Carrito(
      id:
          3, // Cuando se va a crear un nuevo articulo este campo va en 0, para modificar y borrar si se necesita este id
      idCliente: nuevoCliente!,
      idProducto: producto!,
      cantidad:
          1, // La caltidad que selecciona el cliente teniendo en cuenta que no sea mayor que el stock - cantidad reservada a menos que se vayan a hacer mas compras al mismo precio
      precioUnitario: producto.getPrecioVenta,
      ivaUnitario: producto.getIvaVenta,
      fechaReserva: DateTime.now());
//*/

/* 
  // Para agregar un producto al carrito se usa lo anterior

  print(await carritoSvc.agregar(articulo));
*/

/* 
  // Para actualizar un producto del carrito se usa lo anterior

  print(await carritoSvc.actualizar(articulo));
*/

/*
  // Para borrar un producto del carrito solo hay que saber el id del que selecciono el cliente

  print(await carritoSvc.borrarPorId(3));
*/

/*
  // Para borrar todos los articulos del carrito del cliente solo se necesita el id del cliente

  print(await carritoSvc.borrarPorCliente(1));
*/
}
