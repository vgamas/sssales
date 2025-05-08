import '../modelo/carrito.dart';
import '../modelo/clientes.dart';
import '../modelo/productos.dart';
import '../modelo/tipos_documento.dart';
import '../modelo/departamentos.dart';
import '../modelo/ciudades.dart';
import '../modelo/tipos_cliente.dart';
import '../modelo/roles.dart';
import '../modelo/usuarios.dart';
import '../modelo/categorias.dart';
import '../modelo/proveedores.dart';
import '../servicio/carrito_servicio.dart';

List<Carrito> listaArticulos = [];

CarritoServicio carritoSvc = new CarritoServicio();

void main(List<String> args) async {
/*
  listaArticulos = await carritoSvc.listarPorCliente(1);
  for (Carrito elemento in listaArticulos) {
    print(elemento.toJson());
  }
*/

//*
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

  Categoria categoria = Categoria(
      id: 1,
      nombre: "",
      descripcion: "",
      color: "",
      urlImagen: "",
      estado: true);
  Proveedor proveedor =
      Proveedor(id: 1, nombre: "", contacto: "", telefono: 0, celular: 0);

  Producto producto = Producto(
      id: 2,
      nombre: "Otro esfero de colores",
      descripcion: "Otro esfero sin marca de varios colores",
      codigo: "ESF002",
      idCategoria: categoria,
      idProveedor: proveedor,
      fechaCreacion: DateTime(2025, 5, 7),
      stockMinimo: 4,
      existencia: 5,
      cantidadReservada: 0,
      precioCompra: 10000,
      precioVenta: 12000,
      ivaVenta: 2000,
      popularidad: 1,
      destacado: true,
      estado: true);

  Carrito articulo = Carrito(
      id: 3,
      idCliente: nuevoCliente,
      idProducto: producto,
      cantidad: 1,
      precioUnitario: 10000,
      ivaUnitario: 1900,
      fechaReserva: DateTime.now());

//`  print(await carritoSvc.agregar(articulo));

//*/

//  print(await carritoSvc.actualizar(articulo));

  print(await carritoSvc.borrarPorId(3));

/*
print(await carritoSvc.borrarPorCliente(1));
*/
}
