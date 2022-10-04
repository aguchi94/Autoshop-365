import 'package:aguchi_prueba1/src/pages/custom_size_scanner_page.dart';
import 'package:flutter/material.dart';
import 'package:aguchi_prueba1/src/providers/product_provider.dart';
import 'package:aguchi_prueba1/src/models/products.dart';
import 'package:provider/provider.dart';
import 'package:aguchi_prueba1/src/pages/scanner_page.dart';

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  int count = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            builder: ((context, snapshot) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                        product.productScanedList[0].description!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '\$ ' + product.productScanedList[0].price.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        const SizedBox(width: 50),
                        //BOTON (-)
                        FloatingActionButton(
                          child: Icon(Icons.remove),
                          onPressed: () {
                            if (count >= 2) {
                              setState(() => count--);
                            } else {}
                          },
                        ),
                        const SizedBox(width: 15),

                        //CANTIDAD
                        Text(
                          '$count',
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(width: 15),

                        //BOTON (+)
                        FloatingActionButton(
                          child: Icon(Icons.add),
                          onPressed: () {
                            if (count >= 1 && count < 8) {
                              count++;
                              setState(() {});
                            } else {}
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //DESCARTAR
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(120, 45),
                              primary: Colors.red),
                          child: const Text(
                            "Descartar",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            setState(
                              () {
                                Navigator.pop(context);
                                product.productScanedList.clear();
                              },
                            );
                          },
                        ),
                        const SizedBox(width: 20),

                        //AGREGAR
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(120, 45),
                              primary: Colors.green),
                          child: const Text(
                            "Agregar",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            setState(
                              () {
                                product.addProductShop(
                                    product.productScanedList[0]);
                                Navigator.pop(
                                    context, 'El producto ha sido asignado!');
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Row contador() {
    int cant = 1;
    return Row(
      children: [
        const SizedBox(width: 50),
        //BOTON (-)
        FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: () {
            if (cant >= 2) {
              setState(() => cant--);
            } else {}
          },
        ),
        const SizedBox(width: 15),

        //CANTIDAD
        Text(
          '$cant',
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),

        const SizedBox(width: 15),

        //BOTON (+)
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            if (cant >= 1 && cant < 8) {
              cant++;
              setState(() {});
            } else {}
          },
        ),
      ],
    );
  }
}
