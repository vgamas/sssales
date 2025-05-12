// Archivos que contiene las estructura y metodos basicos de las tablas a utilizar

import '../modelo/departamentos.dart';

// Archivos con los servicios de acceso a la base de datos para cada tabla requerida

import '../servicio/departamentos_servicio.dart';

// Se usa al utilizar una lista de departamentos, se usa la ? por si la funcion de consulta retorna null (no hay nada para retornar)

List<Departamento>? listaDptos = [];

// Estas son las variables de las clases que permiten llamar a los sercicios de acceso a las tablas de la base de datos

DepartamentosServicio dptoSvc = DepartamentosServicio();

void main(List<String> args) async {
/*
  // Lista todos los departamentos
  // Llamado al metodo para traer la lista

  listaDptos = await dptoSvc.listarDepartamentos();

  if (listaDptos == null) {
    // No hay departamentos en la base, y se mostro el error, no se puede continuar
  } else {
    // Hay elementos en la lista para que se presenten al usuario, se utiliza ! para quitar la restriccion de null ya que se sabe que no esta vacia
    for (Departamento elemento in listaDptos!) {
      print(elemento.toJson());
    }
  }
*/

/*  
  // Busca una lista de departamentos por una parte de su nombre
  listaDptos = await dptoSvc.buscarPorNombre("mega");

  // Si la lista esta null, es por que no encotro departamentos que cumplen con el criterio de busqueda

  if (listaDptos == null) {
    // No hay departamentos en la base, y se mostro el error, no se puede continuar
  } else {
    // Se muestra la lista
    for (Departamento elemento in listaDptos!) {
      print(elemento.getId);
      print(elemento.getNombre);
      print(elemento.getCodigo);
  }
*/

/*
  // Busca un departamento por su id

  Departamento? dpto = await dptoSvc.buscarPorId(1);

  // Si no encuentra el departamento retorna null

  if (dpto == null) {
    // No hay departamento con ese id en la base, y se mostro el error, no se puede continuar
  } else {
    // Se muestra el departamento encontrado
      print(dpto.getId);
      print(dpto.getNombre);
      print(dpto.getCodigo);
  }
*/

/*
  // Para agregar un deparatmento se usan los datos capturados por pantalla, y se debe dejar el id en 0

  Departamento nuevoDepartamento =
      Departamento(id: 0, nombre: "Atlantico", codigo: 1);

  // Ser llama al metodo para agregar el departamento y se captura el resultado
  Departamento? dpto = await dptoSvc.agregar(nuevoDepartamento);

  if (dpto == null) {
    // no se pudo crear el nuevo departamento, ya se muestro el mensaje de error
  } else {
    // El nuevo departamento esta en dpto con su nuevo id
    print(dpto.toJson());
  }
*/

/*
  // Para actualizar un departamento, primero hay que buscarlo para obtener su id y se actualizan los datos ingresados por el usuario

  Departamento? dpto = await dptoSvc.buscarPorId(1);

  if (dpto == null) {
    // No se encotro el departamento, ya se mostro en error y no se puede continuar
  } else {
    // Si se encontro el departamento y se pueden actualizar los campos nuevos ingresados por el usuario. No se debe modificar el id
    dpto.setCodigo(5);
    dpto.setNombre("ATLANTICO");

    // actualiza el departamento
    Departamento? nuevoDpto = await dptoSvc.actualizar(dpto);

    if (nuevoDpto == null) {
      // hubo un error al actualizar el departamento, se mostro el error y no se puede continuar
    } else {
      // La actualizacion fue correcta, se debe mostrar el mensaje y continuar
      print(nuevoDpto.toJson());
    }
  }
*/
}
