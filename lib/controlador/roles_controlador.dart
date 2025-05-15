// Archivos que contiene las estructura y metodos basicos de las tablas a utilizar

import '../modelo/roles.dart';

// Archivos con los servicios de acceso a la base de datos para cada tabla requerida

import '../servicio/roles_servicio.dart';

// Se usa al utilizar una lista de roles, se usa la ? por si la funcion de consulta retorna null (no hay nada para retornar)

List<Rol>? listaRoles = [];

// Estas son las variables de las clases que permiten llamar a los sercicios de acceso a las tablas de la base de datos

RolesServicio rolSvc = RolesServicio();

void main(List<String> args) async {
/*
  // Trae toda la lista de roles

  listaRoles = await rolSvc.listarTodos();

  if (listaRoles == null) {
    // No hay roles, ya se mostro el mensaje de error
  } else {
    // se usa la lista de roles
    for (Rol elemento in listaRoles!) {
      print(elemento.toJson());
    }
  }
*/

/*
  // Buscar un rol por su id

  Rol? rol = await rolSvc.buscarPorId(1);

  if (rol == null) {
    // no se encontro el rol o hubo un error, ya se mostro el mensaje
  } else {
    // Se usa el rol
    print(rol.toJson());
  }
*/

/*
  // Buscar un rol por su nombre, solo busca el valor exacto

  Rol? rol = await rolSvc.buscarPorNombre("administrador");

  if (rol == null) {
    // no se encontro el rol o hubo un error, ya se mostro el mensaje
  } else {
    // Se usa el rol
    print(rol.toJson());
  }
*/

/*
  // Para agregar un nuevo rol, solo es indispensable colocar el nombre. El id se deja en 0

  Rol rol = Rol(id: 0, nombre: "INVITADO");

  // Se usa una nueva variable para la respuesta ya que se necesita saber si es null o no
  Rol? nuevoRol = await rolSvc.agregar(rol);

  if (nuevoRol == null) {
    // hubo un error al agregar el rol, ya se mostro el mensaje de error
  } else {
    // La nueva variable tiene el rol creado y se puede utilizar
    print(nuevoRol.toJson());
  }
*/

/*
  // Para modificar el rol, se requiere el id. El nombre lo modifica el usuario
  Rol? nuevoRol = await rolSvc.buscarPorId(1);

  if (nuevoRol == null) {
    // hubo un error al agregar el rol, ya se mostro el mensaje de error
  } else {
    // Se modifica el campo de nombre y se envia a actualizar
    nuevoRol.setNombre("nombre ingresado por usuario");

    // Aqui se puede usar la misma variable para la respuesta ya que esta definida ?
    nuevoRol = await rolSvc.actualizar(nuevoRol);

    if (nuevoRol == null) {
      // hubo un error al actualizar el rol, ya se mostro el mensaje de error
    } else {
      // La nueva variable tiene el rol actualizado y se puede utilizar
      print(nuevoRol.toJson());
    }
*/
}
