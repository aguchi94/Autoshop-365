import 'package:flutter/material.dart';
import 'package:aguchi_prueba1/src/pages/custom_size_scanner_page.dart';
import 'package:aguchi_prueba1/src/providers/products_provider.dart';
import 'package:aguchi_prueba1/src/widgets/buyAlert.dart';
import 'package:aguchi_prueba1/src/widgets/style_product.dart';
import 'package:aguchi_prueba1/src/widgets/app_barcode_scanner_widget.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  final List _listProduct = [
    'Yerba Playadito 500gr',
    'Bolsa de compras',
    'Jamon Paladini 200gr',
  ];

  String _code = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          SizedBox(height: 50),
          scannerBar(),
          SizedBox(height: 40),
          titulo(),
          ListProduct(),
          finalizarCompra(),
        ],
      ),
    );
  }

  Center scannerBar() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        width: 350,
        height: 250,
        child: AppBarcodeScannerWidget.defaultStyle(
          resultCallback: (String code) {
            if (_code == '') {
              _code = code;
              setState(
                () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => AddProduct()),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Container titulo() {
    return Container(
      width: 350,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.deepPurple[100],
      ),
      child: Center(
        child: Text(
          'No hay productos asignados',
        ),
      ),
    );
  }

  ElevatedButton finalizarCompra() {
    return ElevatedButton(
      child: Text(
        'Finalizar Compra',
      ),
      onPressed: () {},
    );
  }
}

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  State<ListProduct> createState() => _ListProductState();
}

class Product {
  String fullname, codigo, precio;
  Product(this.fullname, this.codigo, this.precio);
}

class _ListProductState extends State<ListProduct> {
  late List<Product> products;

  @override
  void initState() {
    products = [
      Product('Bolsa de compras', '1234567', '100'),
      Product('Playadito 500gr', '7791720024041', '390'),
      Product('Jamon Paladini 200gr', '2314123', '380'),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return StyleProduct(
            title: products[index].fullname,
            subtitle: products[index].precio,
          );
        },
        itemCount: products.length,
      ),
    );
  }
}
