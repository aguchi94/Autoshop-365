import 'package:aguchi_prueba1/src/providers/person_provider.dart';
import 'package:aguchi_prueba1/src/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:aguchi_prueba1/src/routes/routes.dart';
import 'package:aguchi_prueba1/src/widgets/error404.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => PersonProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Autoshop365 Beta",
        debugShowCheckedModeBanner: false,
        routes: getApplicationRoutes(),
        initialRoute: '/backend',
        onUnknownRoute: (RouteSettings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => const Error404page(),
          );
        },
      ),
    );
  }
}
