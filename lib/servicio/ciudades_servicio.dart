import 'dart:io';
import 'package:http/http.dart' as http;

import 'conexion.dart';
import '../modelo/ciudades.dart';

class CiudadesServicio {
  final String _prefijo = "ciudades/";

  // Buscar una ciudad por su id

  Future<Ciudad> buscarCiudadPorId(int id) async {
    final String endPoint = "id/${id}";
    var uri = Uri.parse(url + _prefijo + endPoint);
    var response = await http.get(uri);

    print(response.body);

    if (response.statusCode == HttpStatus.ok) {
      return ciudadFromJson(response.body);
    } else {
      if (response.statusCode == HttpStatus.notFound) {
        throw ("No hay ciudad con ese id ${id}");
      } else {
        throw ("Error desconocido, codigo ${response.statusCode}");
      }
    }
  }

/*  List<Ciudad>? listarCiudades() {
    List<Ciudad>? listaCiudades = null;
    // buscar las ciudades en la tabla por el id del departamento y crear la lista

    return listaCiudades;
  }

// Lista todas las ciudades que pertenecen a un departamento

  List<Ciudad>? buscarCiudadesPorDepartamento(int dpto) {
    List<Ciudad>? listaCiudades = null;
    // buscar las ciudades en la tabla por el id del departamento y crear la lista

    return listaCiudades;
  }

// Actualiza o crea una ciudad

  int actualizarCiudad(Ciudad nuevaCiudad) {
    int estado = 0;
    Ciudad ciudad = Ciudad();

    if (nuevaCiudad.getId != 0) {
      ciudad = buscarCiudadPorID(nuevaCiudad.getId);
    }

    if (ciudad.getId != 0) {
      // actualiza la ciudad
      // Si actualiza deja estado en 0
      // Sino, coloca algun codigo de error
    } else {
      // Crea la ciudad
      // Si se crea correcto deja estado en 0
      // Sino, coloca algun codigo de error
    }

    return estado;
  }

*/
}
