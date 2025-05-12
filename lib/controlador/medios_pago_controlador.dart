// Archivos que contiene las estructura y metodos basicos de las tablas a utilizar

import '../modelo/medios_pago.dart';

// Archivos con los servicios de acceso a la base de datos para cada tabla requerida

import '../servicio/medios_pago_servicio.dart';

// Se usa cuando se requiere una lista de medos de pago, se usa la ? por si la funcion de consulta retorna null (no hay nada para retornar)

List<MedioPago>? listaMedios = [];

// Estas son las variables de las clases que permiten llamar a los sercicios de acceso a las tablas de la base de datos

MediosPagoServicio medioSvc = MediosPagoServicio();

void main(List<String> args) async {
/*
  // Lista todos los medios de pago

  listaMedios = await medioSvc.listarTodos();

  if (listaMedios == null) {
    // Se presento un error al realizar la consulta y se mostro el mensaje.
  } else {
    // Se presenta la lista de medios de pago, se utiliza ! para quitar la posibilidad de null
    for (MedioPago elemento in listaMedios!) {
      print(elemento.toJson());
    }
  }
*/

/*
  // Busca un medio de pago por su id

  // Se define la variable para almacenar el medio. Se utiliza ? debido a que puede almacenar null
  MedioPago? medio = await medioSvc.buscarPorId(1);

  if (medio == null) {
    // si el valor es null, se mostro el error y no se puede continuar
  } else {
    // Se muestra el medio de pago
    print(medio.toJson());
  }
*/

/*
  // Busca un medio de pago por su id

  // Se define la variable para almacenar el medio. Se utiliza ? debido a que puede almacenar null
  MedioPago? medio = await medioSvc.buscarPorNombre("DAVIPLATA");

  if (medio == null) {
    // si el valor es null, se mostro el error y no se puede continuar
  } else {
    // Se muestra el medio de pago
    print(medio.toJson());
  }
*/

/*
  // Agregar un nuevo medio de pago

  //Se crea la variable con los datos ingresados por el cliente, el id se deha en 0
  MedioPago medio = MedioPago(id: 0, nombre: "Cheque", conexion: "", instrucciones: "Por favor girar el cheque a nombre de Valentin Gamas Maldonado y no cruzarlo", estado: true);

  MedioPago? nuevoMedio = await medioSvc.agregar(medio);

  if (nuevoMedio == null) {
    // Si el retorno es null, se mostro un error y no se puede continuar
  } else {
    // Se muestra el mensaje correspondiente y se continua
    print(nuevoMedio.toJson());
  }
 */

/*
  // Actualizar un medio de pago. Para eso ya se debe haber cargado
  MedioPago? medio = await medioSvc.buscarPorId(1);

  // Se actualizan los campos que ingresa el usuario, se usa ! ya que antes se valido que no fuera null
  // Para actualizar, no se debe cambiar el id
  medio!.setNombre("nequi");
  medio
      .setConexion("Esta es la cadena de conexion si es que se puede utilizar");
  medio.setInstruciones(
      "Por favor realizar la transferencia el numero 777333777 o 55777466y enviar un correo a pagos@sssales.com, una vez confirmado se procedera con la facturacion y envio");
  medio.setEstado(true);

  MedioPago? nuevoMedio = await medioSvc.actualizar(medio);

  if (nuevoMedio == null) {
    // Hubo un error al actualizar, se mostro el error y no se puede continuar
  } else {
    // se muestra un mensaje informando y continua
    print(nuevoMedio.toJson());
  }
*/
}
