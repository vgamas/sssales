import '../modelo/ciudades.dart';
import '../servicio/ciudades_servicio.dart';

List<Ciudad> listaCiudades = [];
Ciudad ciudad = Ciudad();

CiudadesServicio ciudadSvc = CiudadesServicio();

void main(List<String> args) async {
  ciudad = await ciudadSvc.buscarCiudadPorId(1);
  print(ciudad);
}
