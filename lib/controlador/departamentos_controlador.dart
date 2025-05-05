//import 'package:flutter/material.dart';
import '../modelo/departamentos.dart';
import '../servicio/departamentos_servicio.dart';

List<Departamento> listaDptos = [];
Departamento dpto = Departamento();

DepartamentosServicio dptoServicio = DepartamentosServicio();

void main(List<String> args) async {
  listaDptos = await dptoServicio.listarDepartamentos();

  print("La lista de departamentos es ->");
  for (Departamento elemento in listaDptos) {
    print(elemento.toJson());
  }

/*  listaDptos = await dptoServicio.buscarPorNombre("mega");

  print("La lista de departamentos es ->");
  print(listaDptos);
  for (Departamentos elemento in listaDptos) {
    print(elemento.getId);
    print(elemento.getNombre);
    print(elemento.getCodigo);
  }
  */

/*  dpto = await dptoServicio.buscarPorId(1);
  print(dpto);
  print(dpto?.getId);
  print(dpto?.getNombre);
  print(dpto?.getCodigo);
  */

/*  dpto.setCodigo(5);
  dpto.setNombre("Atlantico");
  print(dptoServicio.agregar(dpto));
  */

/*
  dpto.setId(5);
  dpto.setCodigo(5);
  dpto.setNombre("ATLANTICO");
  print(dptoServicio.actualizar(dpto));
*/
}
