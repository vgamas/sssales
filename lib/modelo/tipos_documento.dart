import 'dart:convert';

class TipoDocumento {
    String _id = "";
    String _nombre = "";

    TipoDocumento({String id = "", String nombre = ""}) {
      this._id = id;
      this._nombre = nombre;
    }

    // Getters

    String get getId => this._id;
    String get getNombre => this._nombre;

    // Setters

    void setId(String id) => this._id = id;
    void setNombre(String nombre) => this._nombre = nombre;

    factory TipoDocumento.fromJson(Map<String, dynamic> json) => TipoDocumento(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": _id,
        "nombre": _nombre,
    };
}

// Manejo de listas de tiposdocumento <-> json

List<TipoDocumento> tiposDocumentoFromJson(String str) => List<TipoDocumento>.from(json.decode(str).map((x) => TipoDocumento.fromJson(x)));

String tiposDocumentoToJson(List<TipoDocumento> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Manejo de items de tipodocumento <-> json

TipoDocumento tipoDocumentoFromJson(String str) => TipoDocumento.fromJson(json.decode(str));

String tipoDocumentoToJson(TipoDocumento data) => json.encode(data.toJson());