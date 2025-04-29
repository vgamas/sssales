import '../modelo/medios_pago.dart';
import '../servicio/medios_pago_servicio.dart';

List<MedioPago> listaMedios = [];
MedioPago medio = MedioPago();

MediosPagoServicio medioSvc = MediosPagoServicio();

void main(List<String> args) async {
  
  /*
  listaMedios = await medioSvc.listarTodos();
  for (MedioPago elemento in listaMedios) {
    print(elemento.toJson());
  }
  */

/*
  medio = await medioSvc.buscarPorId(1);
  print(medio.toJson());
*/

/*
    medio = await medioSvc.buscarPorNombre("DAVIPLATA");
  print(medio.toJson());
*/

/*
  medio.setNombre("nequi");
  medio.setConexion("Esta es la cadena de conexion si es que se puede");
  medio.setInstruciones("Por favor realizar la transferencia el numero 777333777 y enviar un correo a pagos@sssales.com, una vez confirmado se procedera con la facturacion y envio");
  medio.setEstado(true);

  print(await medioSvc.agregar(medio));
  */

  medio.setId(2);
  medio.setNombre("nequi");
  medio.setConexion("Esta es la cadena de conexion si es que se puede utilizar");
  medio.setInstruciones("Por favor realizar la transferencia el numero 777333777 o 55777466y enviar un correo a pagos@sssales.com, una vez confirmado se procedera con la facturacion y envio");
  medio.setEstado(true);

  print(await medioSvc.actualizar(medio));

}