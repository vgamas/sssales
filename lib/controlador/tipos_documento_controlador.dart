// Archivos que contiene las estructura y metodos basicos de las tablas a utilizar

import '../modelo/tipos_documento.dart';

// Archivos con los servicios de acceso a la base de datos para cada tabla requerida

import '../servicio/tipos_documento_servicio.dart';

// Se usa al utilizar una lista de tipos de documento, se usa la ? por si la funcion de consulta retorna null (no hay nada para retornar)

List<TipoDocumento>? listaTipos = [];

// Estas son las variables de las clases que permiten llamar a los sercicios de acceso a las tablas de la base de datos

TiposDocumentoServicio tiposDocumentoSvc = TiposDocumentoServicio();

void main(List<String> args) async {
/*
  // Se carga toda la lista de tipos de documento que hay en la base
  listaTipos = await tiposDocumentoSvc.listarTodos();

  if (listaTipos == null) {
    // No hay tipos de documento para mostrar, ya se presento el mensaje de error
  } else {
    // Se puede utilizar la lista, se usa ! para quitar la opcion de null
    for (TipoDocumento elemento in listaTipos!) {
      print(elemento.toJson());
    }
  }
*/

/*
  // Busca un tipo de documento por la letra de su id
  TipoDocumento? tipo = await tiposDocumentoSvc.buscarPorId("N");

  if (tipo == null) {
    // Se presento un error y ya se mostro el mensaje. No hay tipos para mostrar
  } else {
    // Encontro el tipo de documento y se puede utilizar
    print(tipo.toJson());
  }
*/

/*
  // Agregar un tipo de documento. El usuario introduce todos los datos para poder crear la variable

  TipoDocumento tipo = TipoDocumento(id: "E", nombre: "Documento Migratorio Especial");

  // Se define otra variable para almacenar la respuesta ya que se necesita ? para el manejo de null

  TipoDocumento? nuevoTipo = await tiposDocumentoSvc.agregar(tipo);

  if (nuevoTipo == null) {
    // se presento un error al agregar el tipo de documento, ya se mostro el mensaje
  } else {
    // Mostrar el mensaje de tipo creado
    print(nuevoTipo.toJson());
  }
*/

/*
  // Modificar un tipo de documento, para eso se requiere tener el id. Solo se actualiza el nombre

  // Primero se debe haber cargado el tipo a modificar. El id no se puede cambiar, solo el nombre

  TipoDocumento? tipo = await tiposDocumentoSvc.buscarPorId("R");

  if (tipo == null) {
    // no se cargo el tipo de documento, ya se mostro el mensaje de error
  } else {
    // Se coloca el nuevo nombre ingresado por el usuario
    tipo.setNombre("Registro Civil de Nacimiento");

    // Para actualizar se puede usar la misma variable ya que es del tipo ? requerido
    tipo = await tiposDocumentoSvc.actualizar(tipo);
    if (tipo == null) {
      // se presento un error al agregar el tipo de documento, ya se mostro el mensaje
    } else {
      // Mostrar el de actualizacion correcta
      print(tipo.toJson());
    }
  }
*/
}
