// Archivo que contiene la estructura y metodos basicos de las categorias

import '../modelo/categorias.dart';

// Archivo con los servicios de acceso a la base de datos

import '../servicio/categorias_servicio.dart';

// Almacena el listado de categorias, se usa ? por si la funcion de consulta retorna null (no hay categorias para mostrar o hubo un error)

List<Categoria>? listaCategorias = [];

// Variable que permite utilizar las funciones que consumen los sercicios de acceso a las tablas de la base de datos

CategoriaServicio categoriaSvc = CategoriaServicio();

void main(List<String> args) async {
/*
  // Trae el listado de todas las categorias que hay creadas en la base de datos

  listaCategorias = await categoriaSvc.listar();

  if (listaCategorias == null) {
    // Si no hay categorias para mostrar, Ya se mostro el mensaje de error, pero no se puede hacer nada
  } else {
    // De lo contrario se hace lo que se requiere con la lista
    for (Categoria elemento in listaCategorias!) {
      print(elemento.toJson());
    }
  }
*/

/*
  // Busca una categoria por su id

  // Se define la variable que almacenara la categoria buscada, se define con ? por que puede almacenar null cuando no se encuentra

  Categoria? categoria = await categoriaSvc.buscarPorId(1);

  // Se valida si existe o no la categoria para hacer lo que se requiere
  if (categoria == null) {
    // Ya se mostro el mensaje de error, entonces no se puede hacer nada
  } else {
    // Se hace lo necesario con la categoria encontrada
    print(categoria.toJson());
  }
*/

/*
  // busca las categorias que contienen una parte del nombre, se usa cuando se quiere buscar una categoria por nombre
  listaCategorias = await categoriaSvc.buscarPorNombre("es");

  if (listaCategorias == null) {
    // Si no hay categorias para mostrar, Ya se mostro el mensaje de error, pero no se puede hacer nada
  } else {
    // De lo contrario se hace lo que se requiere con la lista
    for (Categoria elemento in listaCategorias!) {
      print(elemento.toJson());
    }
  }
*/

/*

  // Para crear una categoria nueva se deben almacenar los datos ingresados por el cliente

  Categoria categoria = Categoria(
      id: 0,
      nombre: "sobres de papel con logo",
      descripcion: "Sobres de color con logo",
      color: "#87a56f",
      urlImagen: "n/a",
      estado: true);

  // El metodo de agregar retorna null si hay error y ya mostro el error, o retorna la categoria creada con su nuevo id

  Categoria? categoriaCreada = await categoriaSvc.agregar(categoria);

  if (categoriaCreada == null) {
    // ya se mostro el error, no debe permitir continuar al cliente
  } else {
    // Ya fue grabada la categoria, se debe mostrar el mensaje.... y puede continuar
    print(categoriaCreada.toJson());
  }
*/

/*

  // Para modificar una categoria, primero se debe buscar ya sea por nombre o id

  Categoria? categoria = await categoriaSvc.buscarPorId(1);

  if (categoria == null) {
    // No se encontro la categoria, ya se mostro el mensaje, no se puede actualizar
  } else {
    // Se cambian los datos que se pueden cambiar. El id no por que ese es el que identifica la categoria
    categoria.setNombre("LIBRETAS de APUNTES");
    categoria.setDescripcion("Libretas personalizadas para toda ocasion");
    categoria.setColor("#968575");
    categoria.setUrlImagen("Que hasta el momento se sepa");
    categoria.setEstado(
        true); // si la categoria esta activa es true, de lo contrario es false

    // se manda a actualizar
    Categoria? categoriaActualizada = await categoriaSvc.actualizar(categoria);

    if (categoriaActualizada == null) {
      // ya se mostro el mensaje de error al actualizar, no debe continuar
    } else {
      // Se muestra el mensaje de actualizacion correcta
      print(categoriaActualizada.toJson());
    }
  }
*/
}
