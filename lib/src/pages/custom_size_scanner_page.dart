import 'package:aguchi_prueba1/src/pages/home.dart';
import 'package:aguchi_prueba1/src/widgets/style_product.dart';
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
  String precio1 = "00,00";
  String precio2 = "390,00";

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
                  setState(
                    () {
                      _code = code;
                      counter = 1;
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                              builder: ((context) => BuyAlert(number))))
                          .then(
                        (result) {
                          if (result != null) {
                            setState(
                              () {
                                number = 1;
                                quantitiProd = 1;
                                precio1 = precio2;
                              },
                            );
                          }
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "LISTA DE PRODUCTOS  ($quantitiProd)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.white24,
                  ),
                  height: 350,
                  width: 360,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return StyleProduct(
                        subtitle: '',
                        title: '',
                      );
                    },
                    itemCount: 0,
                  ),
                ),
              ),
            ],
          ),
          precioTotal(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(180, 45), primary: Colors.green),
              child: const Text("Finalizar compra"),
              onPressed: () {
                _buyFinished(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Container precioTotal() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Color.fromARGB(238, 168, 240, 253),
      ),
      height: 68,
      width: 350,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "TOTAL : ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "                 \$$precio1",
            style: TextStyle(
              color: Colors.red,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class BuyAlert extends StatefulWidget {
  final int number;
  BuyAlert(this.number);

  @override
  State<BuyAlert> createState() => _BuyAlertState();
}

class _BuyAlertState extends State<BuyAlert> {
  int counter1 = 1;

  late ProductController number;

  @override
  void initState() {
    number = ProductController(widget.number);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: ((context, snapshot) {
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
              contador(),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //DESCARTAR
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(120, 45), primary: Colors.red),
                    child: const Text(
                      "Descartar",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      if (counter1 >= 1) {
                        Navigator.of(context).pop(number);
                      } else {}
                    },
                  )
                ],
              ),
            ],
          ),
        );
      }),
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
          "$number",
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

class ProductController {
  ProductController(int number);
}

void _buyFinished(BuildContext context) {
  showDialog(
    barrierColor: Colors.black87,
    barrierDismissible: false,
    context: context,
    builder: ((context) => AlertDialog(
          title: ListTile(
            title: Icon(
              Icons.verified,
              size: 80,
              color: Colors.green,
            ),
            subtitle: Text("Su compra fue exitosa!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(180, 45), primary: Colors.blueAccent),
                child: const Center(
                  child: Text("Ir al menú"),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const HomePage()),
                    ),
                  );
                },
              ),
            ),
          ],
        )),
  );
}
