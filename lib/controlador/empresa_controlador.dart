import '../modelo/empresa.dart';
import '../servicio/empresa_servicio.dart';

import '../modelo/ciudades.dart';
import '../modelo/departamentos.dart';

EmpresaServicio empresaSvc = EmpresaServicio();

void main(List<String> args) async {

//*
Empresa empresa = await empresaSvc.traer();
print(empresa.toJson()) ; 
//*/

/*
Departamento departamento = Departamento(id: 1, codigo: 1, nombre: "");
Ciudad ciudad = Ciudad(id:1, nombre: "", codigo: 1, idDepartamento: departamento);

Empresa empresa = Empresa(nombre: "M&V Solutions SAS", direccion: "En la calle lejos de todo ruido", telefonoFijo: 0, telefonoCelular: 3177749700, idCiudad: ciudad, nombreTienda: "SSsales ventas de todo y mas", urlLogo: "Aun no se implementa la subida de imagenes", estado: true);
*/
//print(await empresaSvc.agregar(empresa));

//print(await empresaSvc.actualizar(empresa));

//print(await empresaSvc.actualizarEstado(true));

}