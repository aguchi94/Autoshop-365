import 'package:aguchi_prueba1/src/pages/admin_scanner_page.dart';
import 'package:aguchi_prueba1/src/pages/charge_balance.dart';
import 'package:aguchi_prueba1/src/pages/custom_size_scanner_page.dart';
import 'package:aguchi_prueba1/src/pages/new_login.dart';
import 'package:aguchi_prueba1/src/pages/scanner_page.dart';
import 'package:aguchi_prueba1/src/pages/shopping_cart.dart';
import 'package:aguchi_prueba1/src/pages/user_page.dart';
import 'package:aguchi_prueba1/src/pages/wallet.dart';
import 'package:flutter/material.dart';
import 'package:aguchi_prueba1/src/pages/home.dart';
import 'package:aguchi_prueba1/src/pages/login.dart';
import 'package:aguchi_prueba1/src/widgets/error404.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/home': (BuildContext context) => const HomePage(),
    '/login': (BuildContext context) => const LoginPage(),
    '/error404': (BuildContext context) => const Error404page(),
    '/cargar': (BuildContext context) => const WalletPage(),
    '/user': (BuildContext context) => const UserPage(),
    '/cart': (BuildContext context) => const Cart(),
    '/scannerpage': (BuildContext context) => CustomSizeScannerPage(),
    '/scanneradmin': (BuildContext context) => AdminScannerPage(),
    '/newlogin': (BuildContext context) => NewLoginPage(),
    '/newscan': (BuildContext context) => ScannerPage(),
    '/carga': (BuildContext context) => CargarSaldo(),
  };
}
