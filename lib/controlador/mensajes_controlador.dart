import '../modelo/mensajes.dart';
import '../modelo/usuarios.dart';

import '../servicio/mensajes_servicio.dart';

List<Mensaje> listaMensajes = [];
//Mensaje mensaje = Mensaje();

//Usuario remitente = Usuario();
//Usuario destinatario = Usuario();

MensajeServicio mensajeSvc = MensajeServicio();

void main(List<String> args) async {

//*
  listaMensajes = await mensajeSvc.listarPorUsuario(1);

  for (Mensaje elemento in listaMensajes) {
    print(elemento.toJson());
  }
//*/

/*
  listaMensajes = await mensajeSvc.listarEntreUsuarios(1, 3);

  for (Mensaje elemento in listaMensajes) {
    print(elemento.toJson());
  }
*/
/*
  listaMensajes = await mensajeSvc.listarEntreFechas(1, DateTime(2024,12,01), DateTime(2024,12,31));

  for (Mensaje elemento in listaMensajes) {
    print(elemento.toJson());
  }
*/
/*
  listaMensajes = await mensajeSvc.listarPorAsunto(1, "hola");

  for (Mensaje elemento in listaMensajes) {
    print(elemento.toJson());
  }
*/

/*
remitente.setId(1);
destinatario.setId(4);

mensaje.setFecha(DateTime(2025,01,01,13,15,17));
mensaje.setPromocional(false);
mensaje.setAsunto("Nuevo producto");
mensaje.setMensaje("Necesito crear una nueva tarjeta personalizada");
mensaje.setTipo("N");
mensaje.setEstado(false);
mensaje.setUsuarioOrigen(remitente);
mensaje.setUsuarioDestino(destinatario);

print(mensaje.toJson());

print(await mensajeSvc.agregar(mensaje));
*/
}