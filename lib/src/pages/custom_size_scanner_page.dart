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
  int counter = 0;
  int quantitiProd = 0;
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: AppBarcodeScannerWidget.defaultStyle(
              resultCallback: (String code) {
                if (_code == "" && counter == 0) {
                  setState(() {
                    _code = code;
                    counter = 1;
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => StatefulBuilder(
                            builder: ((context, setState) => AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const ListTile(
                                        title: Text("Yerba Playadito 500g",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold)),
                                        subtitle: Text("\$390,00",
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Row(children: [
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
                                        Text('$counter',
                                            style: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(width: 15),

                                        FloatingActionButton(
                                            child: Icon(Icons.add),
                                            onPressed: () {
                                              if (counter >= 1 && counter < 8) {
                                                counter++;
                                                setState(() {});
                                              } else {}
                                            }),
                                      ]),
                                      const SizedBox(height: 25),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          //DESCARTAR PRODUCTO
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                fixedSize: const Size(120, 45),
                                                primary: Colors.red),
                                            child: const Text("Descartar",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
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
                                                fixedSize: const Size(120, 45),
                                                primary: Colors.green),
                                            child: const Text("Agregar",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            onPressed: () {
                                              if (counter >= 1) {
                                                quantitiProd += counter;
                                                _code = "";
                                                counter = 0;
                                                Navigator.of(context).pop();
                                                setState(() {
                                                  number = number + 1;
                                                });
                                              } else {}
                                            },
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ))));
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
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(220, 220, 220, 220),
                    ),
                    height: 420,
                    width: 350,
                    child: StatefulBuilder(
                      builder: ((context, setState) => ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                color: Color.fromARGB(255, 203, 180, 241),
                                child: const ListTile(
                                  trailing: Icon(Icons.delete),
                                  title: Text("Playadito 500gr  " + "\$390,00"),
                                  subtitle: Text("subtitle"),
                                  leading: Text("1"),
                                ),
                              );
                            },
                            itemCount: number,
                          )),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
