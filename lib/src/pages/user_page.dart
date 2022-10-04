import 'package:flutter/material.dart';
import 'package:aguchi_prueba1/src/widgets/appBarPages.dart';
import 'package:google_fonts/google_fonts.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            titulo(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: Colors.deepPurple[200],
                child: Column(
                  children: [
                    //Direccion
                    Row(
                      children: [
                        SizedBox(width: 50),
                        Icon(
                          Icons.house,
                          size: 50,
                          color: Colors.deepPurple[500],
                        ),
                        SizedBox(width: 50),
                        Text('agustin.direccion'),
                      ],
                    ),
                    SizedBox(height: 10),
                    //Nombre
                    Row(
                      children: [
                        SizedBox(width: 50),
                        Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.deepPurple[500],
                        ),
                        SizedBox(width: 50),
                        Text('agustin.nombre'),
                      ],
                    ),
                    SizedBox(height: 10),
                    //Correo
                    Row(
                      children: [
                        SizedBox(width: 50),
                        Icon(
                          Icons.mail,
                          size: 50,
                          color: Colors.deepPurple[500],
                        ),
                        SizedBox(width: 50),
                        Text('agustin.correo'),
                      ],
                    ),
                    SizedBox(height: 10),
                    //Saldo
                    Row(
                      children: [
                        SizedBox(width: 50),
                        Icon(
                          Icons.attach_money,
                          size: 50,
                          color: Colors.deepPurple[500],
                        ),
                        SizedBox(width: 50),
                        Text("\$500,00"),
                      ],
                    ),
                    SizedBox(height: 10),
                    //Contraseña
                    Row(
                      children: [
                        SizedBox(width: 50),
                        Icon(
                          Icons.key,
                          size: 50,
                          color: Colors.deepPurple[500],
                        ),
                        SizedBox(width: 50),
                        ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          child: const Text("Cambiar Contraseña"),
                          onPressed: () => {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding titulo() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 15.0,
      ),
      child: Row(
        children: [
          Text(
            'DATOS DEL USUARIO',
            textAlign: TextAlign.center,
            style: GoogleFonts.coda(
              color: Colors.black54,
              fontSize: 25,
              //fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 50),
          Image.asset(
            'assets/logo365.png',
            width: 40,
            height: 40,
          ),
        ],
      ),
    );
  }
}
