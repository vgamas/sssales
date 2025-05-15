import '../modelo/ventas.dart';
import '../modelo/clientes.dart';
import '../modelo/medios_pago.dart';
import '../modelo/tipos_documento.dart';
import '../modelo/departamentos.dart';
import '../modelo/ciudades.dart';
import '../modelo/tipos_cliente.dart';
import '../modelo/roles.dart';
import '../modelo/usuarios.dart';

import '../servicio/ventas_servicio.dart';

//List<Venta> listaVentas = [];

VentaServicio ventaSvc = VentaServicio();

void main(List<String> args) async {
/*
  // Para consultar una factura por su numero

  Venta? venta = await ventaSvc.buscarFactura(2);

  if (venta == null) {
    // ya se sabe que hubo un error al buscar o grabar
  } else {
    // Continuar con la ejecucion del programa
    print(venta.toJson());
  }
*/

/*
  // Para consultar una lista de facturas de un cliente entre fechas

  List<Venta>? listaVentas = await ventaSvc.facturasDeClienteEntreFechas(
      1, DateTime(2025, 01, 01), DateTime(2025, 12, 31));

  // si la lista esta vacia

  if (listaVentas == null) {
    // ya se sabe que hubo un error al buscar o grabar
  } else {
    // Continuar con la ejecucion del programa
    for (Venta elemento in listaVentas) {
      print(elemento.toJson());
    }
  }
*/

/*
  // Para consultar una lista de facturas de un cliente entre fechas

  List<Venta>? listaVentas = await ventaSvc.facturasDeClienteEntreFechas(
      1, DateTime(2025, 01, 01), DateTime(2025, 12, 31));

  // si la lista esta vacia

  if (listaVentas == null) {
    // ya se sabe que hubo un error al buscar o grabar
  } else {
    // Continuar con la ejecucion del programa
    for (Venta elemento in listaVentas) {
      print(elemento.toJson());
    }
  }
*/

/*
  // Para consultar una lista de facturas de un cliente que esten pagadas o no
  // Se pasa pagada = true o false dependiendo si se quieren consultar las pagadas o no

  List<Venta>? listaVentas =
      await ventaSvc.facturasDeClientePorEstado(2, false);

  // si la lista esta vacia

  if (listaVentas == null) {
    // ya se sabe que hubo un error al buscar o grabar
  } else {
    // Continuar con la ejecucion del programa
    for (Venta elemento in listaVentas) {
      print(elemento.toJson());
    }
  }
*/

/*
  // Consulta para el dueño del negocio - Administrador que permite saber la facturas que estan pagadas y no despachadas

  List<Venta>? listaVentas = await ventaSvc.facturasNoDespachadas();

  // si la lista esta vacia

  if (listaVentas == null) {
    // ya se sabe que hubo un error al buscar o grabar
  } else {
    // Continuar con la ejecucion del programa
    for (Venta elemento in listaVentas) {
      print(elemento.toJson());
    }
  }
*/

/*
  // Marca una factura como pagada y le coloca la referencia del pago

  Venta? venta = await ventaSvc.facturaPagada(1, "123109841");

  if (venta == null) {
    // ya se sabe que hubo un error al buscar o grabar
  } else {
    // Continuar con la ejecucion del programa
    print(venta.toJson());
  }
*/

/*
  // Despachar una factura y colocar los datos de envio

  Venta? venta = await ventaSvc.facturaDespachada(
      2, DateTime(2025, 05, 08), "Servientrega", "20254440");

  if (venta == null) {
    // ya se sabe que hubo un error al buscar o grabar
  } else {
    // Continuar con la ejecucion del programa
    print(venta.toJson());
  }
*/

/*
  // Agregar el encabezado de una factura

  // Hay que traer el cliente...

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
      id: 1,
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

  // Hay que traer el medio de pago

  MedioPago medioPago = MedioPago(
      id: 1, nombre: "", conexion: "", estado: true, instrucciones: "");


// crear la venta.

  Venta nuevaVenta = Venta(
      id: 0,
      idCliente: nuevoCliente,
      fecha: DateTime.now(),
      valorProductos: 10000,
      ivaProductos: 2000,
      idMedioPago: medioPago,
      referenciaPago: null, // se puede crear vacia "" o null
      pagada: false,
      fechaEnvio: null,
      empresaTransporte: null, // se puede crear vacia "" o null
      guia: null // se puede crear vacia "" o null
      );

  Venta? venta = await ventaSvc.agregar(nuevaVenta);

  if (venta == null) {
    // Error al crear la factura
  } else {
    print(venta.toJson());
  }
  */
}
