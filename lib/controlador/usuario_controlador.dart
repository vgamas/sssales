import '../modelo/usuarios.dart';
import '../servicio/usuarios_servicio.dart';
import '../modelo/roles.dart';

Rol rol = Rol(id: 1, nombre: "") ;

UsuarioServicio usuarioSvc = UsuarioServicio();

void main(List<String> args) async {


  Usuario usuario = await usuarioSvc.validar("3177749700", "PASSword");  

  print(usuario.toJson());


/* 
  usuario.setUsuario("Nuevousuario1");
  usuario.setCelular(3106995159);
  usuario.setContrasena("NuevoPASS1");
  usuario.setCorreo("correo@servidor.com");
  usuario.setRol(rol);
  usuario.setEstado(true);

*/
//  print(await usuarioSvc.agregar(usuario));

//  usuario.setId(8);

/*
  usuario.estado = false; 
  print(await usuarioSvc.actualizar(usuario));
*/
}