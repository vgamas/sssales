// Archivos que contiene las estructura y metodos basicos de las tablas a utilizar

import '../modelo/empresa.dart';
import '../modelo/ciudades.dart';
import '../modelo/departamentos.dart';

// Archivos con los servicios de acceso a la base de datos para cada tabla requerida

import '../servicio/empresa_servicio.dart';

// Se usa al utilizar una lista de clientes, se usa la ? por si la funcion de consulta retorna null (no hay nada para retornar)

EmpresaServicio empresaSvc = EmpresaServicio();

void main(List<String> args) async {
/*
  // Trae la informacion de la empresa

  Empresa? empresa = await empresaSvc.traer();

  if (empresa == null) {
    //no hay una empresa creada, por lo que no puede traer la informacion. Ya mostro el mensaje y no se puede continuar
  } else {
    // Se trae la informacion de la empresa
    print(empresa.toJson());
  }
*/

/*
  // Para agregar la empresa es necesario seleccionar el departamento y la ciudad

  Departamento departamento = Departamento(id: 1, codigo: 1, nombre: "");
  Ciudad ciudad =
      Ciudad(id: 1, nombre: "", codigo: 1, idDepartamento: departamento);

  // Hay que crear la empresa con los datos ingresados

  Empresa empresa = Empresa(
      nombre: "M&V Solutions SAS",
      direccion: "En la calle lejos de todo ruido",
      telefonoFijo: 0,
      telefonoCelular: 3177749700,
      idCiudad: ciudad,
      nombreTienda: "SSsales ventas de todo y mas",
      urlLogo: "Aun no se implementa la subida de imagenes",
      estado: true);

  Empresa? nuevaEmpresa = await empresaSvc.agregar(empresa);

  if (nuevaEmpresa == null) {
    // hubo un errol al crear la empresa, se mostro el mensaje y no se pudo almacenar la empresa
  } else {
    // Se almacena la empresa y se debe mostrar el mensaje correspondiente
    print(nuevaEmpresa.toJson());
  }
*/

/*
  // Para actalizar los datos de la empresa, hay que tenerla ya creada y con los nuevos datos capturados

  Empresa? nuevaEmpresa = await empresaSvc.actualizar(empresa);

  if (nuevaEmpresa == null) {
    // Hubo un error al actualizar la empresa, se mostro el error y no se puede continuar
  } else {
    // Se actualiza correctamente la empresa, se debe mostrar el mensaje y continuar
    print(nuevaEmpresa.toJson());
  }
*/

/*
  // Actualiza el estado actual de la empresa, poner true para tener la empresa activa, false para inactivarla

  Empresa? nuevaEmpresa = await empresaSvc.actualizarEstado(true);

  if (nuevaEmpresa == null) {
    // Hubo un error al actualizar la empresa, se mostro el error y no se puede continuar
  } else {
    // Se actualiza correctamente la empresa, se debe mostrar el mensaje y continuar
    print(nuevaEmpresa.toJson());
  }
*/
}
