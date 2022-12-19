// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

class User {
  User({
    required this.estado,
    required this.mensaje,
    required this.datos,
  });

  bool estado;
  String mensaje;
  Datos datos;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        estado: json["estado"],
        mensaje: json["mensaje"],
        datos: Datos.fromMap(json["datos"]),
      );

  Map<String, dynamic> toMap() => {
        "estado": estado,
        "mensaje": mensaje,
        "datos": datos.toMap(),
      };
}

class Datos {
  Datos({
    required this.usuario,
    required this.contrasena,
    this.email,
    this.perfiles,
    this.token,
    this.expira,
  });

  String usuario;
  dynamic contrasena;
  String? email;
  dynamic perfiles;
  String? token;
  String? expira;

  factory Datos.fromJson(String str) => Datos.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datos.fromMap(Map<String, dynamic> json) => Datos(
        usuario: json["usuario"],
        contrasena: json["contrasena"],
        email: json["email"],
        perfiles: json["perfiles"],
        token: json["token"],
        expira: json["expira"],
      );

  Map<String, dynamic> toMap() => {
        "usuario": usuario,
        "contrasena": contrasena,
        "email": email,
        "perfiles": perfiles,
        "token": token,
        "expira": expira,
      };
}
