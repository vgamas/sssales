import 'package:flutter/material.dart';
import 'dart:async';

import 'package:sssales/paginas/parametros.dart';
import 'package:sssales/paginas/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 10),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Parametros.colorFondo,
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                // define un contenedor del tamaño de la pantalla menos un espacio para colocar el pie de página
                // En esta contenedor van los mensajes y logo de bienvenida centrados en la pantalla
                height: MediaQuery.of(context).size.height - 65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bienvenido a',
                        style: TextStyle(
                          fontSize: Parametros.tamanoTitulo,
                          fontWeight: FontWeight.bold,
                        )),
                    Image.asset(
                      'lib/imagenes/sssales_rojo_solo_logo_sin_fondo.png',
                      height: 200,
                    ),
                    Text(
                      Parametros.nombreTienda,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'YesevaOne',
                      ),
                    ),
                  ],
                ),
              ),

              // Aqui se define el pie de pagina, posicionado al final de la pantalla

              Positioned(
                bottom: 50,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Tu tienda de ',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Image.asset(
                          'lib/imagenes/M_V_Solutions_SAS_logo_sin_fondo.png',
                          height: 50,
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    Text(
                      Parametros.copyRight,
                      style: TextStyle(
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
