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

List<Venta> listaVentas = [];

VentaServicio ventaSvc = VentaServicio();

void main(List<String> args) async {
  Venta venta = await ventaSvc.buscarFactura(1);
  print(venta.toJson());
}
