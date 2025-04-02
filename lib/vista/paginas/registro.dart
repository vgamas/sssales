import 'package:flutter/material.dart';
import 'package:sssales/vista/paginas/parametros.dart';

class Registro extends StatelessWidget {
  const Registro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, //AppBar(),

      // en el cuerpo va el titulo y los campos y el boton, se colocan dentro de un SingleChildScrollView para poderlos deplazar hacia
      // arriba y hacia abajo libremente, para telefonos con pantallas mas pequeñas o cuando se activa el teclado

      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const Text(
                  "¡Unete a SSsales!",
                  style: TextStyle(
                      fontSize: Parametros.tamanoTitulo,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: <Color>[Colors.yellow, Colors.orange]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          height: Parametros.altoCampoLectura,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: const TextField(
                            decoration: InputDecoration(
                              labelText: 'Nombres y Apellidos',
                              prefixIcon: Icon(Icons.person_outline_outlined),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: Parametros.altoCampoLectura,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: const TextField(
                            decoration: InputDecoration(
                              labelText: 'Correo electrónico',
                              prefixIcon: Icon(Icons.mail_outline),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: Parametros.altoCampoLectura,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: const TextField(
                            decoration: InputDecoration(
                              labelText: 'Teléfono',
                              prefixIcon: Icon(Icons.phone_outlined),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: Parametros.altoCampoLectura,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: const TextField(
                            decoration: InputDecoration(
                              labelText: 'Dirección',
                              prefixIcon: Icon(Icons.location_on_outlined),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: Parametros.altoCampoLectura,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: const TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              prefixIcon: Icon(Icons.lock),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: Parametros.altoCampoLectura,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: const TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Confirmar Contraseña',
                              prefixIcon: Icon(Icons.lock),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.infinity,
                          height: Parametros.altoCampoLectura,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Parametros.colorTexto, width: 1),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Aqui se debe validar y si el usuario se registra correctamente, crearlo en la base de datos,
                              // actualizar el archivo del usuario que ya esta logueado para poder hacer las compras
                              // de lo contrario sacar un mensaje de error...
                            },
                            child: const Text('REGISTRO'),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
