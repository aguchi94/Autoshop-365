import 'package:aguchi_prueba1/src/class/class.dart';
import 'package:flutter/material.dart';
import 'package:aguchi_prueba1/src/widgets/appBarPages.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Person agustin = new Person(
      'Agustin', 'Felix Mendelsohn 1675', 'agudemoreno2@gmail.com', 100);

  @override
  Widget build(BuildContext context) {
    return CustomAppBarPages(
        title: "Datos del Usuario",
        child: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
                color: const Color.fromARGB(220, 220, 220, 220),
                child: Column(
                  children: [
                    //Direccion
                    Row(
                      children: [
                        SizedBox(width: 50),
                        Icon(
                          Icons.house,
                          size: 50,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 50),
                        Text(agustin.direccion),
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
                          color: Colors.blue,
                        ),
                        SizedBox(width: 50),
                        Text(agustin.nombre),
                      ],
                    ),
                    SizedBox(height: 10),
                    //Correo
                    Row(
                      children: [
                        SizedBox(width: 50),
                        Icon(Icons.mail, size: 50, color: Colors.blue),
                        SizedBox(width: 50),
                        Text(agustin.correo),
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
                          color: Colors.blue,
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
                          color: Colors.blue,
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
                )),
          )
        ]));
  }
}
