import 'package:flutter/material.dart';
import 'package:aguchi_prueba1/src/widgets/app_barcode_scanner_widget.dart';

/// CustomSizeScannerPage
class CustomSizeScannerPage extends StatefulWidget {
  const CustomSizeScannerPage({Key? key}) : super(key: key);

  @override
  _CustomSizeScannerPageState createState() => _CustomSizeScannerPageState();
}

class _CustomSizeScannerPageState extends State<CustomSizeScannerPage> {
  String _code = '';
  int counter = 2;
  int counterTotal = 0;
  int quantitiProd = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: AppBarcodeScannerWidget.defaultStyle(
              resultCallback: (String code) {
                if (_code == "") {
                  setState(() {
                    _code = code;
                    counter = 1;
                    counterTotal += counter;
                    showDialog(
                        context: context, builder: (context) => _buyAlert());
                  });
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(child: Text("Lista de productos  ($quantitiProd)")),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(220, 220, 220, 220),
                  ),
                  height: 300,
                  width: 300,
                  child: ListView(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buyAlert() {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(_code,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            subtitle: Text("PRECIO",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
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

            //CANTIDAD
            Text(counter.toString(),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
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
              //DESCARTAR PRODUCTO
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100, 45), primary: Colors.red),
                child: const Text("Descartar",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                onPressed: () {
                  setState(() {
                    _code = "";
                    counter = 0;
                    Navigator.of(context).pop();
                  });
                },
              ),
              const SizedBox(width: 20),
              //AGREGAR PRODUCTO
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100, 45), primary: Colors.green),
                child: const Text("Agregar",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                onPressed: () {
                  if (counter >= 1) {
                    setState(() {
                      quantitiProd += counter;
                      _code = "";
                      counter = 0;
                      Navigator.of(context).pop();
                    });
                  } else {}
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
