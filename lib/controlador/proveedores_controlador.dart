// Archivos que contiene las estructura y metodos basicos de las tablas a utilizar

import '../modelo/proveedores.dart';

// Archivos con los servicios de acceso a la base de datos para cada tabla requerida

import '../servicio/proveedores_servicio.dart';

// Se usa al utilizar una lista de proveedores, se usa la ? por si la funcion de consulta retorna null (no hay nada para retornar)

List<Proveedor>? listaProveedores = [];

// Estas son las variables de las clases que permiten llamar a los sercicios de acceso a las tablas de la base de datos

ProveedorServicio proveedorSvc = ProveedorServicio();

void main(List<String> args) async {
/*
  // Para listar todos los proveedores registrados

  listaProveedores = await proveedorSvc.listarTodos(); 

  if (listaProveedores == null) {
    // No hay proveedores para mostrar, ya se presento el mensaje de error
  }
  else {
    // Se muestra la lista de proveedores, se utiliza el ! para quitar la posibilidad de null
    for(Proveedor elemento in listaProveedores!){
      print(elemento.toJson());
    }
  }
*/

/*
  // Buscar un proveedor por su id, se utiliza ? por que puede retornar null

  Proveedor? proveedor = await proveedorSvc.buscarPorId(2);

  if (proveedor == null) {
    // No hay proveedor con ese id, ya se mostro el mensaje 
  } else {
    // Si hay proveedor
    print(proveedor.toJson());
  }
*/

/*
  // Buscar proveedores por una parte de su nombre

  listaProveedores = await proveedorSvc.buscarPorNombre("V");

  if (listaProveedores == null) {
    // No hay proveedores para mostrar, ya se presento el mensaje de error
  } else {
    // Se muestra la lista de proveedores, se utiliza el ! para quitar la posibilidad de null
    for (Proveedor elemento in listaProveedores!) {
      print(elemento.toJson());
    }
  }
*/

/*
  // Para agregar un proveedor solo es necesario usar los datos ingresados por el usuario y dejar el id en 0

  Proveedor proveedor = Proveedor(
      id: 0,
      nombre: "M&V Solutions SAS",
      contacto: "Monica Alexandra Jaime Burgos",
      celular: 3213549851,
      telefono: 0);

  // Se utiliza otra variable para almacenar la respuesta de la creacion del proveedor. No se puede la misma por el manejo de null (?) en la respuesta
  Proveedor? nuevoProveedor = await proveedorSvc.agregar(proveedor);

  if (nuevoProveedor == null) {
    // Hubo un problema al agregar el proveedor, ya se mostro el mensaje
  } else {
    // Presentar el mensaje con el nuevo id
    print(nuevoProveedor.getId);
  }
*/

/*
  // Para actualizar un proveedor ya se debe tener el id y se modifican los campos ingresados por el usuario

  Proveedor? proveedor = await proveedorSvc.buscarPorId(1);

  if (proveedor == null) {
    // no se encontro proveedor y ya se mostro el mensaje
  } else {
    // Se actualizan los campos ingresados por el usuario
    proveedor.setNombre("Monica Alexandra Jaime Burgos");
    proveedor.setContacto("Mónica Alexandra Jaime Burgos");
    proveedor.setTelefono(0);
    proveedor.setCelular(3213549851);

    // Se llama al servicio para actualizar. Se puede usar la misma variable en este caso ya que esta definida con ?
    proveedor = await proveedorSvc.actualizar(proveedor);

    if (proveedor == null) {
      // No se pudo actualizar y ya se mostro el mensaje de error
    } else {
      // Mostrar el mensaje y continuar
      print(proveedor.toJson());
    }
  }
*/
}
