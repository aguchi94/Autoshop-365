import 'package:aguchi_prueba1/src/widgets/infoButtonLarge.dart';
import 'package:aguchi_prueba1/src/widgets/load_screen.dart';
import 'package:aguchi_prueba1/src/widgets/userButton.dart';
import 'package:flutter/material.dart';
import 'package:aguchi_prueba1/src/widgets/appBar.dart';
import 'package:aguchi_prueba1/src/widgets/customButton.dart';
import 'package:aguchi_prueba1/src/widgets/helpButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String barcode = ("");

  @override
  void initState() {
    super.initState();
  }

  void _cerrarSesion() =>
      Navigator.of(context).pushReplacementNamed('/newlogin');
  void _pagError() => Navigator.of(context).pushNamed('/error404');
  void _cargarSaldo() => Navigator.of(context).pushNamed('/cargar');
  void _userPage() => Navigator.of(context).pushNamed('/user');
  void _scannerPage() => Navigator.of(context).pushNamed('/newscan');
  void _cargando() => Navigator.of(context).pushNamed('/cargando');

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      child: ListView(
        children: <Widget>[
//SALDO
          UserButton(onPressed: _userPage),
          const SizedBox(height: 5),

//BOTON ESCANEAR
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                width: 150,
                imageRoute: 'assets/cod_barra.png',
                onPressed: () => _scannerPage(),
              ),
              const HelpButton(
                info: "Presione aquí para iniciar una compra",
                imageRoute: 'assets/cod_barra.png',
              )
            ],
          ),
          const SizedBox(height: 5),

//CARGAR DINERO
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                width: 110,
                imageRoute: 'assets/billetera.png',
                onPressed: () => _cargarSaldo(),
              ),
              const HelpButton(
                info: "Presione aquí para cargar dinero a su cuenta",
                imageRoute: 'assets/billetera.png',
              )
            ],
          ),
          const SizedBox(height: 5),

//LISTA DE PRODUCTOS
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                width: 110,
                imageRoute: 'assets/listado.png',
                onPressed: () => HomePage(),
              ),
              const HelpButton(
                info:
                    "Presione aquí para ver los productos en stock y sus precios",
                imageRoute: 'assets/listado.png',
              )
            ],
          ),
          const SizedBox(height: 5),

//ABRIR PUERTA
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                width: 110,
                imageRoute: 'assets/puerta_abierta.png',
                onPressed: () => openDoor(context),
              ),
              const HelpButton(
                info: "Presione aquí para abrir la puerta de Autoshop",
                imageRoute: 'assets/puerta_abierta.png',
              ),
            ],
          ),
          const SizedBox(height: 5),

//CERRAR SESION
          InfoButton(
            child: Image.asset('assets/boton_off.png', width: 95),
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                barrierColor: const Color.fromARGB(233, 175, 224, 239),
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Cerrar Sesion"),
                  content: const Text("¿Desea cerrar sesion?"),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          child: const Text("Ok"),
                          onPressed: () => _cerrarSesion(),
                        ),
                        TextButton(
                          child: const Text("Cancelar"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> openDoor(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) => AlertDialog(
            title: Image.asset('assets/open-door.gif', width: 95),
            content: Text(
              'Ya puedes ingresar!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      child: Row(
                        children: [
                          Text(
                            'OK!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.thumb_up,
                            size: 35,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
