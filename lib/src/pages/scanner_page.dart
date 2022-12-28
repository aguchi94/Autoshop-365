import 'package:aguchi_prueba1/src/pages/home.dart';
import 'package:aguchi_prueba1/src/providers/person_provider.dart';
import 'package:flutter/material.dart';
import 'package:aguchi_prueba1/src/providers/product_provider.dart';
import 'package:aguchi_prueba1/src/widgets/shadow_buttons.dart';
import 'package:aguchi_prueba1/src/models/products.dart';
import 'package:aguchi_prueba1/src/widgets/buyAlert.dart';
import 'package:aguchi_prueba1/src/widgets/style_product.dart';
import 'package:aguchi_prueba1/src/widgets/app_barcode_scanner_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ai_barcode/ai_barcode.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  String _code = '';

  Product bolsa = Product(
    id: 0,
    description: 'Bolsa de compras',
    price: 50,
    weight: 10,
    code: 0643131504575,
  );
  Product yerba = Product(
    id: 1,
    description: 'Yerba Playadito',
    price: 390,
    weight: 500,
    code: 7793704000911,
  );
  Product jamon = Product(
    id: 2,
    description: 'Jamon Paladini',
    price: 430,
    weight: 200,
    code: 7796953311111,
  );
  Product brahma = Product(
    id: 3,
    description: 'Cerveza Brahma',
    price: 200,
    weight: 200,
    code: 7792798005888,
  );
  Product donSatur = Product(
    id: 4,
    description: 'Bizcochito Don Satur',
    price: 120,
    weight: 200,
    code: 7795735000328,
  );

  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).addProduct(
      bolsa,
    );
    Provider.of<ProductProvider>(context, listen: false).addProduct(
      yerba,
    );
    Provider.of<ProductProvider>(context, listen: false).addProduct(
      jamon,
    );
    Provider.of<ProductProvider>(context, listen: false).addProduct(
      brahma,
    );
    Provider.of<ProductProvider>(context, listen: false).addProduct(
      donSatur,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 30),
            scannerBar(context, product),
            SizedBox(height: 20),
            saldo(),
            SizedBox(height: 10),
            subTotal(),
            SizedBox(height: 10),
            cantidadProductos(),
            SizedBox(height: 10),
            ListProduct(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: finalizarCompra(),
            ),
          ],
        ),
      ),
    );
  }

  Center scannerBar(BuildContext context, ProductProvider product) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        height: 220,
        child: AppBarcodeScannerWidget.defaultStyle(
          resultCallback: (String code) {
            _code = code;
            String _playadito = '7793704000911';
            String _jamon = '7796953311111';
            String _brahma = '7792798005888';
            String _bolsa = '0643131504575';
            String _bizcohito = '7795735000328';
            setState(
              () {
                if (_code == _playadito) {
                  product.addProductScan(yerba);
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddProduct()))
                      .then(
                    (result) {
                      if (result != null) {
                        setState(() {});
                      }
                    },
                  );
                } else if (_code == _brahma) {
                  product.addProductScan(brahma);
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddProduct()))
                      .then(
                    (result) {
                      if (result != null) {
                        setState(() {});
                      }
                    },
                  );
                } else if (_code == _bolsa) {
                  product.addProductScan(bolsa);
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddProduct()))
                      .then(
                    (result) {
                      if (result != null) {
                        setState(() {});
                      }
                    },
                  );
                } else if (_code == _bizcohito) {
                  product.addProductScan(donSatur);
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddProduct()))
                      .then(
                    (result) {
                      if (result != null) {
                        setState(() {});
                      }
                    },
                  );
                } else if (_code == _jamon) {
                  product.addProductScan(jamon);
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddProduct()))
                      .then(
                    (result) {
                      setState(() {
                        product.productScanedList.removeLast();
                        _code = '';
                      });
                    },
                  );
                } else if (product.productScanedList.length == 0) {
                  showDialog(
                    context: context,
                    builder: ((context) => AlertDialog(
                          content: Text('No se detectaron productos'),
                        )),
                  );
                  setState(() {});
                }
                ;
              },
            );
          },
        ),
      ),
    );
  }

  ShadowButonn subTotal() {
    final product = Provider.of<ProductProvider>(context);
    return ShadowButonn(
      width: 330,
      height: 50,
      color: Colors.grey[200],
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Total a debitar :',
            style: GoogleFonts.coda(
              color: Colors.black54,
              fontSize: 20,
            ),
          ),
          SizedBox(width: 30),
          Text(
            '\$ ' + '00.0',
            style: GoogleFonts.coda(
              color: Colors.green[700],
              fontSize: 20,
            ),
          ),
        ],
      )),
    );
  }

  ShadowButonn saldo() {
    final product = Provider.of<ProductProvider>(context);
    final user = Provider.of<PersonProvider>(context);
    return ShadowButonn(
      width: 330,
      height: 50,
      color: Colors.grey[200],
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Tu saldo actual es :',
            style: GoogleFonts.coda(
              color: Colors.black54,
              fontSize: 20,
            ),
          ),
          SizedBox(width: 30),
          Text(
            '\$ 1250,00',
            style: GoogleFonts.coda(
              color: Colors.green[700],
              fontSize: 20,
            ),
          ),
        ],
      )),
    );
  }

  ShadowButonn cantidadProductos() {
    final product = Provider.of<ProductProvider>(context);
    return ShadowButonn(
      width: 330,
      height: 50,
      color: Colors.grey[200],
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Productos en carrito :',
            style: GoogleFonts.coda(
              color: Colors.black54,
              fontSize: 20,
            ),
          ),
          SizedBox(width: 30),
          Text(
            product.productsCartShop.length.toString(),
            style: GoogleFonts.coda(
              color: Colors.green[700],
              fontSize: 20,
            ),
          ),
        ],
      )),
    );
  }

  ElevatedButton finalizarCompra() {
    final product = Provider.of<ProductProvider>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
      child: Text(
        'Finalizar Compra',
      ),
      onPressed: () {
        if (product.productsCartShop.length >= 0) {
          setState(
            () {
              comprando(context);
              Future.delayed(
                Duration(
                  seconds: 5,
                ),
                () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => HomePage()),
                    ),
                  );
                },
              );
            },
          );
        } else {}
      },
    );
  }
}

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);
    return Container(
      height: 200,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return StyleProduct(
            title: product.productsCartShop[index].description!,
            subtitle: product.productsCartShop[index].price!.toString(),
          );
        },
        itemCount: product.productsCartShop.length,
      ),
    );
  }
}

Future<dynamic> comprando(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: ((context) => AlertDialog(
          title: Image.asset('assets/cart-loading.gif', width: 95),
          content: Text(
            'Finalizando su compra..',
            style: GoogleFonts.coda(
              fontSize: 20,
              color: Colors.black45,
            ),
          ),
        )),
  );
}

          //product.productsCartShop.clear();
          //product.productScanedList.clear();
          //_code = ''