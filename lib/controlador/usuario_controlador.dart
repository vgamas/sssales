import '../modelo/usuarios.dart';
import '../servicio/usuarios_servicio.dart';

Usuario usuario = Usuario();

UsuarioServicio usuarioSvc = UsuarioServicio();

void main(List<String> args) async {

  usuario = await usuarioSvc.validar("3177749700", "PASSword");  

  print(usuario.toJson());
}