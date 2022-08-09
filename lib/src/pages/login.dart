import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void error404() => Navigator.of(context).pushNamed('/error404');

  void _iniciarSesion() => Navigator.of(context).pushReplacementNamed('/home');
  void _scannerAdmin() =>
      Navigator.of(context).pushReplacementNamed('/scanneradmin');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white60,
              Colors.white30,
              Color.fromARGB(233, 128, 212, 235),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                  child: Image.asset(
                'assets/logo365.png',
                width: 150,
              )),
            ),

//Caja de texto Login

            Container(
              margin: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    const ListTile(
                      title: Text("Bienvenido!",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      subtitle: Text("Iniciar Sesión",
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Numero de lote (uf)",
                          hintText: "Introduzca su usuario",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9.0))),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Contraseña",
                          hintText: "Introduzca su contraseña",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9.0))),
                    ),
                    const SizedBox(height: 70),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //boton iniciar sesion
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(300, 60),
                            padding: const EdgeInsets.all(15),
                            elevation: 5.0,
                            primary: const Color.fromARGB(220, 220, 220, 220),
                          ),
                          child: const Text("Iniciar Sesión",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () => _iniciarSesion(),
                        ),

                        const SizedBox(height: 20),

                        //Boton Registrarse
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(300, 60),
                            padding: const EdgeInsets.all(15),
                            elevation: 5.0,
                            primary: const Color.fromARGB(220, 220, 220, 220),
                          ),
                          child: const Text("Registrate !!!",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () => error404(),
                        ),
                        const SizedBox(height: 25),

                        TextButton(
                          child: Text("ADMIN"),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                    title: Text("ADMINISTRADOR"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: "Usuario",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9.0))),
                                        ),
                                        const SizedBox(height: 10),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: "Contraseña",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9.0))),
                                        ),
                                        Center(
                                          child: ElevatedButton(
                                            child: Text("Ingresar"),
                                            onPressed: () {
                                              _scannerAdmin();
                                            },
                                          ),
                                        )
                                      ],
                                    )));
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
