import 'package:flutter/material.dart';
import 'package:aguchi_prueba1/src/widgets/appBarPages.dart';
import 'package:aguchi_prueba1/src/widgets/customButton.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return CustomAppBarPages(
        title: "Carrito",
        child: ListView(
          children: [
            CustomButton(
                width: 100,
                imageRoute: 'assets/listado.png',
                onPressed: () => {})
          ],
        ));
  }
}
