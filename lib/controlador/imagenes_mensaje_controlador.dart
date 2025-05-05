import '../modelo/imagenes_mensaje.dart';
import '../modelo/mensajes.dart';

import '../servicio/imagenes_mensaje_servicio.dart';

List<ImagenMensaje> listaImagenesMensaje = [];
//ImagenMensaje imagen = ImagenMensaje();

//Mensaje mensaje = Mensaje();

ImagenMensajeServicio imgMensajeSvc = ImagenMensajeServicio();

void main(List<String> args) async {

//*
  listaImagenesMensaje = await imgMensajeSvc.listar(1);
  for (ImagenMensaje elemento in listaImagenesMensaje)
    print(elemento.toJson());
//*/

/*
  mensaje.setId(2);
  imagen.setUrlImagen("url de la imagen 1 mensaje 2");
  imagen.setIdMensaje(mensaje);
  print(await imgMensajeSvc.agregar(imagen));
*/
}