import '../modelo/tipos_documento.dart';
import '../servicio/tipos_documento_servicio.dart';

List<TipoDocumento> listaTipos = [];
//TipoDocumento tipo = TipoDocumento();

TiposDocumentoServicio tiposDocumentoSvc = TiposDocumentoServicio();

void main(List<String> args) async {
 
 //*
  listaTipos = await tiposDocumentoSvc.listarTodos();
  for (TipoDocumento elemento in listaTipos) {
    print(elemento.toJson());
  }
//*/
/*
tipo = await tiposDocumentoSvc.buscarPorId("N");
print(tipo.toJson());
*/

/*
tipo.setId("E");
tipo.setNombre("Documento Migratorio Especial");
print(await tiposDocumentoSvc.agregar(tipo));
*/

/*
tipo.setId("R");
tipo.setNombre("Registro Civil de Nacimiento");
print(await tiposDocumentoSvc.actualizar(tipo));
*/
}