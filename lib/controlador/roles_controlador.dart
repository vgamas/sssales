import '../modelo/roles.dart';
import '../servicio/roles_servicio.dart';

List<Rol> listaRoles = [];
Rol rol = Rol();

RolesServicio rolSvc = RolesServicio();

void main(List<String> args) async {
 
 /* listaRoles = await rolSvc.listarTodos();
  for (Rol elemento in listaRoles) {
    print(elemento.toJson());
  }
*/

/*rol = await rolSvc.buscarPorId(1);
print(rol.toJson());
*/

/*rol = await rolSvc.buscarPorNombre("administrador");
print(rol.toJson());
*/

/*rol.setNombre("INVITADO");
print(await rolSvc.agregar(rol));
*/

rol.setId(3);
rol.setNombre("INVITADA");
print(await rolSvc.actualizar(rol));
}