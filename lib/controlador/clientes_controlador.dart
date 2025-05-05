import '../modelo/clientes.dart';

import '../servicio/clientes_servicio.dart';

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
  listaClientes = await clienteSvc.buscarPorNombre("valentin");
  for(Cliente elemento in listaClientes) {
    print(elemento.toJson());
  }
}