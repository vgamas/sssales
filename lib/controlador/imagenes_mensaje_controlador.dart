// Archivos que contiene las estructura y metodos basicos de las tablas a utilizar

import '../modelo/imagenes_mensaje.dart';
import '../modelo/mensajes.dart';

// Archivos con los servicios de acceso a la base de datos para cada tabla requerida

import '../servicio/imagenes_mensaje_servicio.dart';
import '../servicio/mensajes_servicio.dart';

// Se usa al utilizar una lista de Imagenes, se usa la ? por si la funcion de consulta retorna null (no hay nada para retornar)

List<ImagenMensaje>? listaImagenesMensaje = [];

// Estas son las variables de las clases que permiten llamar a los sercicios de acceso a las tablas de la base de datos

ImagenMensajeServicio imgMensajeSvc = ImagenMensajeServicio();
MensajeServicio msgSvc = MensajeServicio();

void main(List<String> args) async {
/*

  // Carga la lista de imagenes de un mensaje

  listaImagenesMensaje = await imgMensajeSvc.listar(1);

  if (listaImagenesMensaje == null) {
    // Si la lista tiene valor null, es por que hubo un error y ya se mostro el mensaje
  } else {
    // se muestra la lista de imagenes
    for (ImagenMensaje elemento in listaImagenesMensaje!)
      print(elemento.toJson());

  }
*/

/*
  // Agregar una imagen a la lista de mensajes de un mensaje

  // primero hay que tener el mensaje

  Mensaje? mensaje = await msgSvc.buscarPorId(1);
  if (mensaje == null) {
    // No hay mensaje con ese numero de id, ya se mostro el error no se puede agregar la imagen
  } else {
    // Se actualiza la imagen con los datos ingresados por el usuario
    ImagenMensaje imagen = ImagenMensaje(
        id: 0, idMensaje: mensaje, urlImagen: "url de la imagen 1 mensaje 2");

    // Se agrega la imagen y se valida que haya sido correcto

    if ((await imgMensajeSvc.agregar(imagen)) == null) {
      // Hubo un error al agregar la imagen, ya se mostro el error, no se puede continuar
    } else {
      // Mostrar el mensaje correspondiente
    }
  }
*/
}
