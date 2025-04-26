import '../modelo/ciudades.dart';
import '../servicio/ciudades_servicio.dart';
import '../modelo/departamentos.dart';

List<Ciudad> listaCiudades = [];
Ciudad ciudad = Ciudad();

CiudadesServicio ciudadSvc = CiudadesServicio();

void main(List<String> args) async {
/*  ciudad = await ciudadSvc.buscarCiudadPorId(1);
  print(ciudad);
*/
 
/*  listaCiudades = await ciudadSvc.buscarCiudadesPorDepartamento(1);
  print(listaCiudades);
  for (Ciudad elemento in listaCiudades) {
    print(elemento.getId);
    print(elemento.getNombre);
    print(elemento.getCodigo);
    print(elemento.getDepartamento?.toJson());
  }
*/

/*  listaCiudades = await ciudadSvc.buscarCiudadesPorNombre(1, "cali");
  print(listaCiudades);
  for (Ciudad elemento in listaCiudades) {
    print(elemento.getId);
    print(elemento.getNombre);
    print(elemento.getCodigo);
    print(elemento.getDepartamento?.toJson());
  }
  */

  Departamento dpto = Departamento(id:3);

  ciudad.setNombre("BOGOTA");
  ciudad.setCodigo(1);
  ciudad.setDepartamento(dpto);

//   print(await ciudadSvc.agregar(ciudad));
ciudad.setId(1);

print(await ciudadSvc.actualizar(ciudad));
}
