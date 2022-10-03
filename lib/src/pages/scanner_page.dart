import 'package:flutter/material.dart';
import 'package:aguchi_prueba1/src/providers/product_provider.dart';
import 'package:aguchi_prueba1/src/widgets/shadow_buttons.dart';
import 'package:aguchi_prueba1/src/models/products.dart';
import 'package:aguchi_prueba1/src/pages/custom_size_scanner_page.dart';
import 'package:aguchi_prueba1/src/widgets/buyAlert.dart';
import 'package:aguchi_prueba1/src/widgets/style_product.dart';
import 'package:aguchi_prueba1/src/widgets/app_barcode_scanner_widget.dart';
import 'package:provider/provider.dart';

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
    id: 3,
    description: 'Bizcochito Don Satur',
    price: 120,
    weight: 200,
    code: 7795735000328,
  );

  get index => null;

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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          SizedBox(height: 50),
          scannerBar(product),
          SizedBox(height: 40),
          titulo(),
          ListProduct(),
          finalizarCompra(),
        ],
      ),
    );
  }

  Center scannerBar(ProductProvider product) {
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
                } else if (_code == _brahma) {
                  product.addProductScan(brahma);
                } else if (_code == _bolsa) {
                  product.addProductScan(bolsa);
                } else if (_code == _bizcohito) {
                  product.addProductScan(donSatur);
                } else if (_code == _jamon) {
                  product.addProductScan(jamon);
                }
                ;
                //Navigator.of(context).push(
                //MaterialPageRoute(
                //builder: ((context) => AddProduct()),
                //),
                //);
              },
            );
          },
        ),
      ),
    );
  }

  ShadowButonn titulo() {
    return ShadowButonn(
      width: 350,
      height: 80,
      color: Colors.grey[200],
      child: Center(
        child: Text(
          _code,
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

class _ListProductState extends State<ListProduct> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return StyleProduct(
            title: product.productScanedList[index].description!,
            subtitle: product.productScanedList[index].price!.toString(),
          );
        },
        itemCount: product.productScanedList.length,
      ),
    );
  }
}
