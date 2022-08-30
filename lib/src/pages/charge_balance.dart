import 'package:aguchi_prueba1/src/widgets/appBarPages.dart';
import 'package:aguchi_prueba1/src/widgets/infoButtonLarge.dart';
import 'package:flutter/material.dart';
import 'package:aguchi_prueba1/src/widgets/customButtonMini.dart';

class CargarSaldo extends StatefulWidget {
  const CargarSaldo({Key? key}) : super(key: key);

  @override
  State<CargarSaldo> createState() => _CargarSaldoState();
}

class _CargarSaldoState extends State<CargarSaldo> {
  @override
  void _cart() => Navigator.of(context).pushNamed('/cart');

  Widget build(BuildContext context) {
    return CustomAppBarPages(
      title: "Cargar Saldo",
      child: ListView(
        children: <Widget>[
          InfoButton(
            onPressed: () {},
            child: const ListTile(
              title: Text("Saldo Actual",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              subtitle: Text("\$500,00",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(197, 27, 115, 13))),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtonMini(
                child: Image.asset('assets/billetero.png', width: 100),
                onPressed: () => {},
              ),
              const SizedBox(width: 5),
              CustomButtonMini(
                child: Image.asset('assets/mp_logo.png', width: 100),
                onPressed: () => {},
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtonMini(
                child: Image.asset('assets/banco.png', width: 100),
                onPressed: () => {},
              ),
              const SizedBox(width: 5),
              CustomButtonMini(
                child: Image.asset('assets/enviar_dinero.png', width: 100),
                onPressed: () => {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
