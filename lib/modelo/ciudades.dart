import 'dart:ffi';
import 'departamentos.dart';

class Ciudad {
  Uint16 _id;
  String _nombre;
  Departamento? _departamento;
  Uint16 _codigo;

  Ciudad(this._id, this._nombre, Uint16 departamento, this._codigo) {
    this._departamento = buscarDepartamentoPorId(departamento);
  }

// Getters

  Uint16 getId() {
    return this._id;
  }

  String getNombre() {
    return this._nombre;
  }

  Departamento? getDepartamento() {
    return this._departamento;
  }

  Uint16 getCodigo() {
    return this._codigo;
  }

// Setters

  void setId(Uint16 id) {
    this._id = id;
  }

  void setNombre(String nombre) {
    this._nombre = nombre;
  }

  void setDepartamento(Departamento dpto) {
    this._departamento = dpto;
  }

  void setCodigo(Uint16 codigo) {
    this._codigo = codigo;
  }
}

// Metodos para el CRUD

Ciudad? buscarCiudadPorID(Uint16 id) {
  Ciudad? nuevaCiudad = null;

  // busca la ciudad en la tabla de cudades

  // busca el departamento

  return nuevaCiudad;
}

// Lista todas las ciudades que pertenecen a un departamento

List<Ciudad>? buscarCiudadesPorDepartamento(Departamento dpto) {
  // buscar las ciudades en la tabla por el id del departamento y crear la lista

  return null;
}

// Actualiza o crea una ciudad

int actualizarCiudad(Ciudad nuevaCiudad) {
  int estado = 0;
  Ciudad? ciudad = buscarCiudadPorID(nuevaCiudad.getId());

  if (ciudad != null) {
    // actualiza la ciudad
    // Si actualiza deja estado en 0
    // Sino, coloca algun codigo de error
  } else {
    // Crea la coidad
    // Si se crea correcto deja estado en 0
    // Sino, coloca algun codigo de error
  }

  return estado;
}

// Eliminar Ciudad
