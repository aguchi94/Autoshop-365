import 'package:flutter/material.dart';
import 'package:aguchi_prueba1/src/widgets/app_barcode_scanner_widget.dart';

/// CustomSizeScannerPage
class CustomSizeScannerPage extends StatefulWidget {
  @override
  _CustomSizeScannerPageState createState() => _CustomSizeScannerPageState();
}

class _CustomSizeScannerPageState extends State<CustomSizeScannerPage> {
  String _code = '';
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: AppBarcodeScannerWidget.defaultStyle(
              resultCallback: (String code) {
                if (counter == 0 && _code == "") {
                  setState(() {
                    _code = code;
                    counter = 1;
                  });
                }
              },
              openManual: true,
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: const Color.fromARGB(220, 220, 220, 220),
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          title: Text(_code,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                          subtitle: const Text("Precio",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const SizedBox(width: 20),
                      FloatingActionButton(
                          child: Icon(Icons.remove),
                          onPressed: () {
                            if (counter >= 2) {
                              setState(() => counter--);
                            } else {}
                          }),
                      const SizedBox(width: 15),
                      Text('$counter',
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 15),
                      FloatingActionButton(
                          child: Icon(Icons.add),
                          onPressed: () {
                            if (counter >= 1 && counter < 8) {
                              setState(() => counter++);
                            } else {}
                          }),
                    ]),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(150, 45),
                              primary: Colors.red),
                          child: const Text("Descartar",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            setState(() {
                              _code = "";
                              counter = 0;
                            });
                          },
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(150, 45),
                              primary: Colors.green),
                          child: const Text("Agregar",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            setState(() {
                              _code = "";
                              counter = 0;
                            });
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(160, 45)),
                      child: const Text("Mi Carrito",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
