import '../modelo/clientes.dart';

import '../servicio/clientes_servicio.dart';
import '../modelo/tipos_documento.dart';
import '../modelo/departamentos.dart';
import '../modelo/ciudades.dart';
import '../modelo/tipos_cliente.dart';
import '../modelo/roles.dart';
import '../modelo/usuarios.dart';

List<Cliente> listaClientes = [];
ClienteServicio clienteSvc = ClienteServicio();

void main(List<String> args) async {
  /*
  Cliente cliente = await clienteSvc.buscarPorUsuario(6);
  print(cliente.toJson());
*/
/*
  Cliente cliente = await clienteSvc.buscarPorId(1);
  print(cliente.toJson());
*/
/*
  listaClientes = await clienteSvc.buscarPorNombre("valentin");
  for(Cliente elemento in listaClientes) {
    print(elemento.toJson());
  }
  */

  TipoDocumento tipodoc = TipoDocumento(id: "C", nombre: "nombre");
  Departamento dpto = Departamento(id: 1, nombre: "", codigo: 1);
  Ciudad nCiudad = Ciudad(id: 1, nombre: "", idDepartamento: dpto, codigo: 1);
  TipoCliente tipoCli = TipoCliente(id: "N", nombre: "nombre", descripcion: "");
  Rol rol = Rol(id: 1, nombre: "");

  Usuario usuario = Usuario(
      id: 1,
      usuario: "vgamas",
      celular: 3177749700,
      correo: "valentin.gamas@outlook.com",
      contrasena: "Clave",
      idRol: rol,
      estado: true);

  Cliente nuevoCliente = Cliente(
      id: 0,
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

//  print(await clienteSvc.agregar(nuevoCliente));

  nuevoCliente.id = 1;

  print(await clienteSvc.actualizar(nuevoCliente));
}
