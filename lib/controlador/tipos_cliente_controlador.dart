import '../modelo/tipos_cliente.dart';
import '../servicio/tipos_cliente_servicio.dart';

List<TipoCliente> listaTipos = [];
TipoCliente tipo = TipoCliente();

TiposClienteServicio tiposClienteSvc = TiposClienteServicio();

void main(List<String> args) async {
 
 /*
  listaTipos = await tiposClienteSvc.listarTodos();
  for (TipoCliente elemento in listaTipos) {
    print(elemento.toJson());
  }
*/
/*
tipo = await tiposClienteSvc.buscarPorId("N");
print(tipo.toJson());
*/

/*
tipo.setId("J");
tipo.setNombre("Persona Juridica");
tipo.setDescripcion("Empresa con capacidad legal para contratar");
print(await tiposClienteSvc.agregar(tipo));
*/

/*
tipo.setId("j");
tipo.setNombre("Persona Jurídica");
tipo.setDescripcion("Entidad con capacidad legal para contratar con terceros");
print(await tiposClienteSvc.actualizar(tipo));
*/
}