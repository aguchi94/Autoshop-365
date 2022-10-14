import 'package:aguchi_prueba1/src/models/person.dart';
import 'package:aguchi_prueba1/src/providers/person_provider.dart';
import 'package:aguchi_prueba1/src/widgets/shadow_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Users agustin = Users(
    id: 28,
    name: 'Agustin Sanchez',
    balance: 1250.00,
    email: 'agudemoreno2@gmail.com',
    location: 'H M. Victoria',
  );

  @override
  void initState() {
    Provider.of<PersonProvider>(context, listen: false).addPerson(agustin);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<PersonProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            titulo(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: ShadowButonn(
                width: 50,
                height: 60,
                color: Colors.white54,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(
                      Icons.account_circle,
                      color: Colors.blue[400],
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Nombre : ',
                      style: GoogleFonts.coda(
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      user.users[0].name.toString(),
                      style: GoogleFonts.coda(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: ShadowButonn(
                width: 50,
                height: 60,
                color: Colors.white54,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(
                      Icons.home,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Direccion : ',
                      style: GoogleFonts.coda(
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      user.users[0].location.toString(),
                      style: GoogleFonts.coda(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: ShadowButonn(
                width: 50,
                height: 60,
                color: Colors.white54,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(
                      Icons.email,
                      color: Colors.red[300],
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Email : ',
                      style: GoogleFonts.coda(
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      user.users[0].email.toString(),
                      style: GoogleFonts.coda(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: ShadowButonn(
                width: 50,
                height: 60,
                color: Colors.white54,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(
                      Icons.paid,
                      color: Colors.green[500],
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Saldo actual : ',
                      style: GoogleFonts.coda(
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '\$ ' + user.users[0].balance.toString(),
                      style: GoogleFonts.coda(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(80.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[300],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Cambiar clave'),
                      Icon(Icons.key),
                    ],
                  ),
                  onPressed: () {},
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
        vertical: 15.0,
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
          SizedBox(width: 35),
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
