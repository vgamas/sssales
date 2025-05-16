import '../modelo/categorias.dart';
import '../servicio/categorias_servicio.dart';

List<Categoria> listaCategorias = [];
Categoria categoria = Categoria();

CategoriaServicio categoriaSvc = CategoriaServicio();

void main(List<String> args) async {

/*
  listaCategorias = await categoriaSvc.listar();

  for(Categoria elemento in listaCategorias)
    print(elemento.toJson());

*/

/*
  categoria = await categoriaSvc.buscarPorId(1);
  print(categoria.toJson());
*/

/*
  listaCategorias = await categoriaSvc.buscarPorNombre("es");
  for(Categoria elemento in listaCategorias)
    print(elemento.toJson());
*/

/*
categoria.setNombre("LIBRETAS de APUNTES");
categoria.setDescripcion("Libretas personalizadas para toda ocasion");
categoria.setColor("#968575");
categoria.setUrlImagen("Ninguna");
categoria.setEstado(true);
print(await categoriaSvc.agregar(categoria));
*/

categoria.setId(4);
categoria.setNombre("LIBRETAS de APUNTES");
categoria.setDescripcion("Libretas personalizadas para toda ocasion");
categoria.setColor("#968575");
categoria.setUrlImagen("Que hasta el momento se sepa");
categoria.setEstado(true);
print(await categoriaSvc.actualizar(categoria));

}