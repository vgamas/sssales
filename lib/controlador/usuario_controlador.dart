// Archivos que contiene las estructura y metodos basicos de las tablas a utilizar

import '../modelo/usuarios.dart';
import '../modelo/roles.dart';

// Archivos con los servicios de acceso a la base de datos para cada tabla requerida

import '../servicio/usuarios_servicio.dart';
import '../servicio/roles_servicio.dart';

// Estas son las variables de las clases que permiten llamar a los sercicios de acceso a las tablas de la base de datos

UsuarioServicio usuarioSvc = UsuarioServicio();

void main(List<String> args) async {
/*
  // Para validar si el usuario y contraseña son correctas y corresponden a un usuario, con esto se autentica en el sistema

  Usuario? usuario = await usuarioSvc.validar("3177749700", "PASSword");

  if (usuario == null) {
    // Hay un error al validar el usuario, ya se mostro el mensaje
  } else {
    // Autenticacion correcta, se muestra el mensaje y se puede continuar con la ejecucion
    print(usuario.toJson());
  }
*/

/* 
  // Se utiliza para crear un usuario, se debe buscar la lista de la base de datos
  // Los usuarios se crean al crear un cliente, pero esto es por si se requiere crear un usuario sin cliente

  // Hay que seleccionar el rol
  Rol rol = Rol(id: 1, nombre: "") ;

  // se deben capturar los datos del usuario para el registro

  Usuario usuario = Usuario(id: 0, usuario: "Nuevousuario1", celular: 3106995159, correo: "correo@servidor.com", contrasena: "NuevoPASS1", idRol: rol, estado: true); 

  Usuario? nuevoUsuario = await usuarioSvc.agregar(usuario);

  if (nuevoUsuario == null) {
    // hubo algun problema al agregar al usuario, se mostro el mensaje
  } else {
    // Ya se tiene el usuario agregado a la base de datos
    print(nuevoUsuario.toJson());
  }
*/

/*
  // Actualizar un usuario, primero se debe validar el usuario y luego se deben capturar los datos en pantalla, excepto el id

  Usuario? usuario = await usuarioSvc.buscarPorId(1);

  // Se actualizan los demas datos y se actualiza. 

  if (usuario == null) {
    // no esta el usuario, se mostro el mensaje 
  } else {
    // Se actualizan los datos del usuario y se almacenan en la variable usuario
    // Se puede utilizar la misma variable ya que es del tipo que permite null (?)
    usuario = await usuarioSvc.actualizar(usuario);

    if (usuario == null) {
      // Hubo un error al actualizar el usuario, se mostro el error
    } else {
      // Usuario actualizado
      print(usuario.toJson())
    }
  }
*/
}
