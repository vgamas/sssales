import 'dart:convert';

class TipoDocumento {
    String id = "";
    String nombre = "";

    TipoDocumento({required this.id, required this.nombre});

    // Getters

    String get getId => this.id;
    String get getNombre => this.nombre;

    // Setters

    void setId(String id) => this.id = id;
    void setNombre(String nombre) => this.nombre = nombre;

    factory TipoDocumento.fromJson(Map<String, dynamic> json) => TipoDocumento(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
    };
}

// Manejo de listas de tiposdocumento <-> json

List<TipoDocumento> tiposDocumentoFromJson(String str) => List<TipoDocumento>.from(json.decode(str).map((x) => TipoDocumento.fromJson(x)));

String tiposDocumentoToJson(List<TipoDocumento> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Manejo de items de tipodocumento <-> json

TipoDocumento tipoDocumentoFromJson(String str) => TipoDocumento.fromJson(json.decode(str));

String tipoDocumentoToJson(TipoDocumento data) => json.encode(data.toJson());