// Archivos que contiene las estructura y metodos basicos de las tablas a utilizar

import '../modelo/clientes.dart';
import '../modelo/tipos_documento.dart';
import '../modelo/departamentos.dart';
import '../modelo/ciudades.dart';
import '../modelo/tipos_cliente.dart';
import '../modelo/roles.dart';
import '../modelo/usuarios.dart';

// Archivos con los servicios de acceso a la base de datos para cada tabla requerida

import '../servicio/clientes_servicio.dart';

// Se usa al utilizar una lista de clientes, se usa la ? por si la funcion de consulta retorna null (no hay nada para retornar)

List<Cliente>? listaClientes = [];

// Estas son las variables de las clases que permiten llamar a los sercicios de acceso a las tablas de la base de datos

ClienteServicio clienteSvc = ClienteServicio();

void main(List<String> args) async {
/*
  // Se busca un cliente por el id del usuario que se autentica en el sistema

  Cliente? cliente = await clienteSvc.buscarPorUsuario(1);

  if (cliente == null) {
    // no se encontro el cliente para ese usuario, se mostro el mensaje y no se puede continuar
  } else {
    // Se encontro el cliente, se puede continuar
    print(cliente.toJson());
  }
*/

/*
  // Se busca un cliente por su id
  Cliente? cliente = await clienteSvc.buscarPorId(1);

  if (cliente == null) {
    // si no se encuentra el cliente o hubo un error se mostro el mensaje
  } else {
    // Si hay un cliente con ese id
    print(cliente.toJson());
  }
*/

/*
  // Busca los clientes que cumplen un parametro de nombre

  listaClientes = await clienteSvc.buscarPorNombre("valentin");

  if (listaClientes == null) {
    // No hay clientes con ese nombre, ya se mostro el error
  } else {
    // La lista tiene los clientes con ese nombre. Se usa ! para quitar el null ya que no esta vacia
    for (Cliente elemento in listaClientes!) {
      print(elemento.toJson());
    }
  }
*/

/*
  //Para crear un cliente se necesitan unos parametros de otras tablas, que se ingresan por pantalla

  // Estas tablas se cargan con sus respectivos servicios. Aqui se llenan con los datos que selecciona el cliente

  TipoDocumento tipodoc = TipoDocumento(id: "C", nombre: "nombre");
  Departamento dpto = Departamento(id: 1, nombre: "", codigo: 1);
  Ciudad nCiudad = Ciudad(id: 1, nombre: "", idDepartamento: dpto, codigo: 1);
  TipoCliente tipoCli = TipoCliente(id: "N", nombre: "nombre", descripcion: "");
  Rol rol = Rol(id: 1, nombre: "");

  // El usuario se crea con los datos capturados en pantalla de registro del cliente

  Usuario usuario = Usuario(
      id: 0, // Para usuario nuevo hay que dejar este id en 0
      usuario: "vgamas",
      celular: 3177749700,
      correo: "valentin.gamas@outlook.com",
      contrasena: "Clave",
      idRol: rol,
      estado: true);

  // El cliente se crea con los datos capturados en pantalla de registro del cliente

  Cliente nuevoCliente = Cliente(
      id: 0, // Para cliente nuevo se deja este id en 0
      nombreCompleto: "Valentin Gamas Maldonado",
      tipoDocumento: tipodoc,
      numeroDocumento: "80414768",
      correoElectronico: "valentin.gamas@outlook.com",
      celular: 3177749700,
      direccion: "Calle 104a 47 21",
      idCiudad: nCiudad,
      estado: true,
      observaciones: "Alergia al cangrejo y a la groceria",
      tipoCliente: tipoCli,
      facebook: "",
      instagram: "",
      whatsapp: "",
      tiktok: "",
      fechaNacimiento: DateTime(1968, 08, 29),
      idUsuario: usuario,
      urlImagen: "");

  // Una vez creadas las variables se puede hacer la creacion del cliente, retorna null en caso de error o el nuevo cliente con su nuevo id

  Cliente? clienteCreado = await clienteSvc.agregar(nuevoCliente);

  // El cliente no solo crea el cliente sino tambien el usuario
  if (clienteCreado == null) {
    // Si hubo un error en la creacion del usuario o del cliente, se imprimio el mensaje y retorna null
  } else {
    // Se muestra el mensaje de creacion correcto
    print(clienteCreado.toJson());
  }
*/

/*
  // Para actualizar un cliente se debe tener ya cargado, ya sea buscado por usuario o por id

  Cliente? nuevoCliente = await clienteSvc.buscarPorId(1);

  if (nuevoCliente == null) {
    // Hubo un error al buscar el cliente, ya se mostro el error y no se puede continuar
  } else {
    // Se actualizan los campos que se considera que se pueden actualizar y se envia a grabar

    Cliente? clienteActualizado = await clienteSvc.actualizar(nuevoCliente);

    if (clienteActualizado == null) {
      // si retorna null es por que hubo un error al actualizar el cliente y se mostro el mensaje.
    } else {
      // El cliente fue actualizado, hay que mostrar el mensaje y continuar
      print(clienteActualizado.toJson());
    }
  }
*/
}
