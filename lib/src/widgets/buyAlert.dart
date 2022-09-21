import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  int counter1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: Column(
        children: [
          alertDialog(context),
        ],
      ),
    );
  }

  AlertDialog alertDialog(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ListTile(
            title: Text(
              "Yerba Playadito 500gr",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "\$390,00",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ),
          const SizedBox(height: 25),
          contador(),
          const SizedBox(height: 25),
          descartarOAgregar(context),
        ],
      ),
    );
  }

  Row descartarOAgregar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //DESCARTAR
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(120, 45), primary: Colors.red),
          child: const Text(
            "Descartar",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            setState(
              () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
        const SizedBox(width: 20),

        //AGREGAR
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(120, 45), primary: Colors.green),
          child: const Text(
            "Agregar",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            if (counter1 >= 1) {
              Navigator.of(context).pop();
            } else {}
          },
        )
      ],
    );
  }

  Row contador() {
    return Row(
      children: [
        const SizedBox(width: 50),
        //BOTON (-)
        FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: () {
            if (counter1 >= 2) {
              setState(() => counter1--);
            } else {}
          },
        ),
        const SizedBox(width: 15),

        //CANTIDAD
        Text(
          "$counter1",
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),

        const SizedBox(width: 15),

        //BOTON (+)
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            if (counter1 >= 1 && counter1 < 8) {
              counter1++;
              setState(() {});
            } else {}
          },
        ),
      ],
    );
  }
}
