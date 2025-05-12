// Archivos que contiene las estructura y metodos basicos de las tablas a utilizar

import '../modelo/tipos_cliente.dart';

// Archivos con los servicios de acceso a la base de datos para cada tabla requerida

import '../servicio/tipos_cliente_servicio.dart';

// Se usa al utilizar una lista de tipos de cliente, se usa la ? por si la funcion de consulta retorna null (no hay nada para retornar)

List<TipoCliente>? listaTipos = [];

// Estas son las variables de las clases que permiten llamar a los sercicios de acceso a las tablas de la base de datos

TiposClienteServicio tiposClienteSvc = TiposClienteServicio();

void main(List<String> args) async {
/*
  // Lista todos los tipos de cliente registrados en la base

  listaTipos = await tiposClienteSvc.listarTodos();

  if (listaTipos == null) {
    // no se pueden mostrar los tipos, ya se mostro el mensaje
  } else {
    // Se puede usar la lista de tipos de cliente. se usa ! para quitar la opcion de null
    for (TipoCliente elemento in listaTipos!) {
      print(elemento.toJson());
    }
  }
*/

/*
  // Busca un tipo de cliente por la letra de su Id

  TipoCliente? tipo = await tiposClienteSvc.buscarPorId("N");

  if (tipo == null) {
    // No se encontro el tipo de cliente, ya se mostro el error
  } else {
    // se puede usar el tipo de cliente
    print(tipo.toJson());
  }
*/

/*
  // Para agergar un nuevo tipo de cliente hay que pedir todos los datos al usuario

  TipoCliente tipo = TipoCliente(id: "J", nombre: "Persona Juridica", descripcion: "Empresa con capacidad legal para contratar")

  // Se usa otra variable para la llamada a agregar y obtener la respuesta, por el uso de null (?) en la respuesta
  TipoCliente? nuevoTipo = await tiposClienteSvc.agregar(tipo);

  if (nuevoTipo == null) {
    // Se presento un error al agregar el tipo, ya se mostro el mensaje de error
  } else {
    // Se muestra el mensaje de creacin correcta
    print(nuevoTipo.toJson());
  }
*/

/*
  // Para modificar el tipo de cliente existente

  TipoCliente? tipo = await tiposClienteSvc.buscarPorId("J");

  if (tipo == null) {
    // Ya se mostro el error pero no hay tipo cliente para modificar
  } else {
    // se modifica con los datos ingresados por el usuario, excepto el id
    tipo.setNombre("Persona Jurídica");
    tipo.setDescripcion(
        "Entidad con capacidad legal para contratar con terceros");

    // Se puede usar la misma variable ya que esta ya tiene la ? para el uso de null
    tipo = await tiposClienteSvc.actualizar(tipo);

    if (tipo == null) {
      // No se pudo actualizar el tipo de cliente, ya se mostro el error
    } else {
      // Actualizo correctamente, hay que mostrar el mensaje
      print(tipo.toJson());
    }
  }
*/
}
