import 'package:aguchi_prueba1/src/helpers/base_request.dart';
import 'package:aguchi_prueba1/src/helpers/item_request.dart';
import 'package:aguchi_prueba1/src/models/item.dart';
import 'package:aguchi_prueba1/src/widgets/request_widget.dart';
import 'package:aguchi_prueba1/src/widgets/style_product.dart';
import 'package:flutter/material.dart';

class ProductPageAdmin extends StatefulWidget {
  @override
  State<ProductPageAdmin> createState() => _ProductPageAdminState();
}

class _ProductPageAdminState extends State<ProductPageAdmin> {
  final req = const RequestItem(url: 'http://a365.com.ar/api/getProductos');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Text('Lista de Productos'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return HTTPWidget(req);
        },
      ),
    );
  }
}
