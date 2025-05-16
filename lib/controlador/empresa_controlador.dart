import '../modelo/empresa.dart';
import '../servicio/empresa_servicio.dart';

import '../modelo/ciudades.dart';

Empresa empresa = Empresa();

EmpresaServicio empresaSvc = EmpresaServicio();

void main(List<String> args) async {

/*
empresa = await empresaSvc.traer();
print(empresa.toJson()) ; 
*/

Ciudad ciudad = Ciudad(id:1);

empresa.setNombre("M&V Solutions SAS");
empresa.setDireccion("En la calle lejos de todo ruido");
empresa.setTelefonoFijo(0);
empresa.setTelefonoCelular(3177749700);
empresa.setCiudad(ciudad);
empresa.setUrlLogo("Aun no se implementa la subida de imagenes");
empresa.setNombreTienda("SSsales ventas de todo y mas");
empresa.setEstado(true);

//print(await empresaSvc.agregar(empresa));

//print(await empresaSvc.actualizar(empresa));

print(await empresaSvc.actualizarEstado(true));

}