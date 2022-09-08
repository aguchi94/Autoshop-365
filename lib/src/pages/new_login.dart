import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewLoginPage extends StatefulWidget {
  const NewLoginPage({Key? key}) : super(key: key);

  @override
  State<NewLoginPage> createState() => _NewLoginPageState();
}

class _NewLoginPageState extends State<NewLoginPage> {
  void error404() => Navigator.of(context).pushNamed('/error404');
  void _iniciarSesion() => Navigator.of(context).pushReplacementNamed('/home');
  void _scannerAdmin() =>
      Navigator.of(context).pushReplacementNamed('/scanneradmin');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
          child: ListView(
            children: [
              SizedBox(height: 35),
              //Logo Autoshop
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  elevation: 0,
                ),
                child: Center(
                    child: Image.asset(
                  'assets/logo365.png',
                  width: 150,
                )),
                onPressed: () => {
                  adminUser(context),
                },
              ),
              SizedBox(height: 20),

              //Bienvenido!!
              Center(
                child: Text(
                  'Bienvenido..',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 50,
                  ),
                ),
              ),
              SizedBox(height: 10),
              //Eslogan
              Center(
                child: Text(
                  'Hacemos tu vida mas sencilla!',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 50),
              //usuario
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Contraseña',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[300],
                    elevation: 0,
                  ),
                  child: Container(
                    width: 400,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () => _iniciarSesion(),
                ),
              ),
              SizedBox(height: 25),

              //Registrarse
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No tienes cuenta?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Registrarme',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () => error404(),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        )));
  }

  Future<dynamic> adminUser(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
            backgroundColor: Colors.grey[300],
            title: Center(
              child: Text("ADMINISTRADOR",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 25,
                  )),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Usuario',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Contraseña',
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[300],
                      elevation: 0,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Ingresar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      _scannerAdmin();
                    },
                  ),
                )
              ],
            )));
  }
}
