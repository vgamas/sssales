// Archivos que contiene las estructura y metodos basicos de las tablas a utilizar para el carrito

import '../modelo/ciudades.dart';
import '../modelo/departamentos.dart';

// Archivos con los servicios de acceso a la base de datos para cada tabla requerida

import '../servicio/ciudades_servicio.dart';
import '../servicio/departamentos_servicio.dart';

// Se usa al consultar la lista de articulos, se usa la ? por si la funcion de consulta retorna null (no hay nada para retornar)

List<Ciudad>? listaCiudades = [];

// Estas son las variables de las clases que permiten llamar a los sercicios de acceso a las tablas de la base de datos

CiudadesServicio ciudadSvc = CiudadesServicio();
DepartamentosServicio dptoSvc = DepartamentosServicio();

void main(List<String> args) async {
/*  
  // Busca una ciudad por su id, se utiliza la ? por si la funcion de busqueda no encuentra y retorna null

  Ciudad? ciudad = await ciudadSvc.buscarCiudadPorId(1);

  if (ciudad == null) {
    // si no se encuentra la ciudad, ya se mostro el mensaje de error y no se puede continuar
  } else {
    // Si existe la ciudad y se puede continuar
    print(ciudad.toJson());
  }
*/

/*
  // Busca las ciudades que corresponden a un departamento (se busca el departamento por su id)

  listaCiudades = await ciudadSvc.buscarCiudadesPorDepartamento(1);

  if (listaCiudades == null) {
    // Si no hay ciudades para mostrar, ya se mostro un error y no se puede continuar
  } else {
    // De lo contrario se hace lo necesario con la lista de ciudades. Se utiliza el ! para quitar la posibilidad de null
    for (Ciudad elemento in listaCiudades!) {
      print(elemento.getId); // se obtiene el id de la ciudad
      print(elemento.getNombre); // se obtiene el nombre de la ciudad
      print(elemento.getCodigo); // se obtiene el codigo de la ciudad
      print(elemento.getDepartamento.toJson()); // se obtiene el departamento completo de la ciudad
    }
  }
*/

/*
  // Busca la lista de ciudades de un departamento que cumplen con un criterio de nombre
  listaCiudades = await ciudadSvc.buscarCiudadesPorNombre(1, "cali");

  if (listaCiudades == null) {
    // Si no hay ciudades para mostrar, ya se mostro un error y no se puede continuar
  } else {
    // De lo contrario se hace lo necesario con la lista de ciudades. Se utiliza el ! para quitar la posibilidad de null
    for (Ciudad elemento in listaCiudades!) {
      print(elemento.getId); // se obtiene el id de la ciudad
      print(elemento.getNombre); // se obtiene el nombre de la ciudad
      print(elemento.getCodigo); // se obtiene el codigo de la ciudad
      print(elemento.getDepartamento.toJson()); // se obtiene el departamento completo de la ciudad
    }
  }
*/

/*
  // Para agregar una ciudad es necesario haber seleccionado el departamento

  Departamento? dpto = await dptoSvc.buscarPorId(3);

  if (dpto == null) {
    // No se encontro el departamento y se saco un mensaje de error y no se puede continuar
  } else {
    // Si se encontro el departamento se puede proceder con la creacion de la ciudad con los datos ingresados por el cliente
    // Para una nueva ciudad se debe colocar el id en 0
    Ciudad nuevaCiudad =
        Ciudad(id: 0, nombre: "BOGOTA", idDepartamento: dpto, codigo: 1);

    Ciudad ciudadRetorno = await ciudadSvc.agregar(nuevaCiudad);

    if (ciudadRetorno == null) {
      // si retorna null es por que no se pudo crear la ciudad, ya se mostro el error y no se puede continuar
    } else {
      // mostrar mensaje de creacion correcta y continuar
      print(ciudadRetorno.toJson());
    }
  }
*/

/*
  // Para actualizar una ciudad, ya se debe haber buscado y encontrado
  Ciudad? ciudad = await ciudadSvc.buscarCiudadPorId(1);

  // Si no se encontro la ciudad
  if (ciudad == null) {
    // Ya se mostro el mensaje de error y no se puede hacer la actualizacion
  } else {
    // Si se encuentra la ciudad, se actualizan los campos con lo ingresado por el cliente, no se debe cambiar el id
    ciudad.setNombre("nuevo nombre");
    ciudad.setCodigo(1);
    ciudad.setDepartamento(ciudad
        .getDepartamento); // coloca el departamento ingresado por el cliente

    // se envia a actualizar la ciudad
    Ciudad? ciudadActualizada = await ciudadSvc.actualizar(ciudad);

    if (ciudadActualizada == null) {
      // Hubo un error al actualizar y ya se mostro un mensaje, no se puede continuar
    } else {
      // Se actualizo correctamente la ciudad, se puede continuar
      print(ciudadActualizada.toJson())
    }
  }
*/
}
