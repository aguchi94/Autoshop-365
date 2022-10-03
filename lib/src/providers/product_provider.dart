import 'package:flutter/material.dart';
import 'package:aguchi_prueba1/src/models/products.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  List<Product> productScanedList = [];
  List<Product> productsCartShop = [];
  double total = 0;

  //Lista Back End
  addProduct(Product product) {
    products.add(product);
  }

  addProducts(List<Product> product) {
    products = product;
  }

  //Producto Escaneado
  addProductScan(Product product) {
    if (productScanedList.length >= 1) {
      productScanedList.removeLast();
      productScanedList.add(product);
    } else {
      productScanedList.add(product);
    }
  }

  deleteProductScan(Product product) {
    productScanedList.removeLast();
  }

  //Lista carrito
  addProductShop(Product productScaned) {
    productsCartShop.add(productScaned);
  }

  deleteProduct(Product productScaned) {
    productsCartShop.removeLast();
  }
}
