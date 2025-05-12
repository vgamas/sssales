// Archivos que contiene las estructura y metodos basicos de las tablas a utilizar

import 'package:flutter/material.dart';

import '../modelo/mensajes.dart';
import '../modelo/usuarios.dart';

// Archivos con los servicios de acceso a la base de datos para cada tabla requerida

import '../servicio/mensajes_servicio.dart';
import '../servicio/usuarios_servicio.dart';

// Se usa al utilizar una lista de mensajes, se usa la ? por si la funcion de consulta retorna null (no hay nada para retornar)

List<Mensaje>? listaMensajes = [];

// Estas son las variables de las clases que permiten llamar a los sercicios de acceso a las tablas de la base de datos

MensajeServicio mensajeSvc = MensajeServicio();
UsuarioServicio usuarioSvc = UsuarioServicio();

void main(List<String> args) async {
/*
  // Lista todos los mensajes en los que ha participado un usuario, ya sea como emisor o receptor

  listaMensajes = await mensajeSvc.listarPorUsuario(1);

  if (listaMensajes == null) {
    // Si la lista tiene null, es por que hubo error al recuperar los mensajes, ya se mostro el error y no se puede continuar
  } else {
    // Se muestra un mensaje y los mensajes. Se usa ! para quitar la posibilidad del null
    for (Mensaje elemento in listaMensajes!) {
      print(elemento.toJson());
    }
  }
*/

/*
  // Buscar un mensaje por su id

  Mensaje? mensaje = await mensajeSvc.buscarPorId(1);

  if (mensaje == null) {
    // ya se mostro el mensaje y no se puede continuar
  } else {
    // Encontro el mensaje y se mostro, se puede continuar
    print(mensaje.toJson());
  }
*/

/*
  // Busca todos los mensajes que hubo entre dos usuarios

  listaMensajes = await mensajeSvc.listarEntreUsuarios(1, 3);

  if (listaMensajes == null) {
    // Hubo un problema y ya se mostro el mensaje no se puede continuar
  } else {
    // Se muestra el mesaje y se presenta la lista
    for (Mensaje elemento in listaMensajes!) {
      print(elemento.toJson());
    }
  }
*/

/*
  // Busca todos los mensajes de un usuario que fueron enviados o recibidos engtre las dos fechas
  listaMensajes = await mensajeSvc.listarEntreFechas(1, DateTime(2024,12,01), DateTime(2024,12,31));

  if (listaMensajes == null) {
    // Hubo un problema y ya se mostro el mensaje no se puede continuar
  } else {
    // Se muestra el mesaje y se presenta la lista
    for (Mensaje elemento in listaMensajes!) {
      print(elemento.toJson());
    }
  }
*/

/*
  // Lista todos los mensajes de un usuario que contienen un texto en el asunto
  listaMensajes = await mensajeSvc.listarPorAsunto(1, "hola");

  if (listaMensajes == null) {
    // Hubo un problema y ya se mostro el mensaje no se puede continuar
  } else {
    // Se muestra el mesaje y se presenta la lista
    for (Mensaje elemento in listaMensajes!) {
      print(elemento.toJson());
    }
  }
*/

/*
  // Almacenar el un nuevo mensaje. Se debe tener el id de los dos usuarios
  // Ademas ya tener los datos que ingresa el usuario, asi como la fecha y la hora del sistema
  // Se deha el id en 0 ya que es un nuevo mensaje

  Usuario? remitente = await usuarioSvc.buscarPorId(1);
  Usuario? destinatario = await usuarioSvc.buscarPorId(4);

  // primero hay que validar que el usuario destinatario sea diferente al remitente y que existe
  // Se usa ! teniendo en cuenta que ya se validaron

  Mensaje mensaje = Mensaje(
      id: 0,
      usuarioOrigen: remitente!,
      usuarioDestino: destinatario!,
      fechaHora: DateTime.now(),
      promocional: false,
      asunto: "Nuevo producto",
      mensaje: "Nuevo producto",
      tipo: "N",
      estado: false);

  Mensaje? resultadoMensaje = await mensajeSvc.agregar(mensaje);

  if (resultadoMensaje == null) {
    // Hubo un error al almacenar el mensaje y ya se mostro.
  } else {
    // se debe mostrar el mensaje correspondiente y continuar
    print(resultadoMensaje.toJson());
  }
*/

/*
  // Marcar un mensaje como leido es la unica actualizacion que se permite hacer a los mensajes
  // ya se tiene el id del mensaje
  Mensaje? mensaje = await mensajeSvc.buscarPorId(1);

  if (mensaje == null) {
    // ya se mostro el error
  } else {
    mensaje = await mensajeSvc.mensajeLeido(mensaje.getId);

    if (mensaje == null) {
      // hubo un error al marcar el mensaje, ya se mostro el mensaje no se puede continuar
    } else {
      // Mostrar el mensaje y Continuar
      print(mensaje.toJson());
    }
  }
*/
}
