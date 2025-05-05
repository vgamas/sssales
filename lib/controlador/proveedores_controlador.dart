import '../modelo/proveedores.dart';
import '../servicio/proveedores_servicio.dart';

List<Proveedor> listaProveedores = [];
//Proveedor proveedor = Proveedor();

ProveedorServicio proveedorSvc = ProveedorServicio();

void main(List<String> args) async {

/*
  listaProveedores = await proveedorSvc.listarTodos(); 
  for(Proveedor elemento in listaProveedores){
    print(elemento.toJson());
  }
*/
/*
  proveedor = await proveedorSvc.buscarPorId(2);
  print(proveedor.toJson());
*/

/*
  listaProveedores = await proveedorSvc.buscarPorNombre("V"); 
  for(Proveedor elemento in listaProveedores){
    print(elemento.toJson());
  }
*/

/*
  Proveedor proveedor = Proveedor(id: 0, nombre: "M&V Solutions SAS", contacto: "Monica Alexandra Jaime Burgos", celular: 3213549851, telefono: 0);

  print(await proveedorSvc.agregar(proveedor));
*/

/*
  proveedor.setId(2);
  proveedor.setNombre("Monica Alexandra Jaime Burgos");
  proveedor.setContacto("Mónica Alexandra Jaime Burgos");
  proveedor.setTelefono(0);
  proveedor.setCelular(3213549851);

  print(await proveedorSvc.actualizar(proveedor));
*/
}