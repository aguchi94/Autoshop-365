import 'package:flutter/material.dart';
import 'package:aguchi_prueba1/src/routes/routes.dart';
import 'package:aguchi_prueba1/src/widgets/error404.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Autoshop365 Beta",
      debugShowCheckedModeBanner: false,
      routes: getApplicationRoutes(),
      initialRoute: '/login',
      onUnknownRoute: (RouteSettings){
        return MaterialPageRoute(builder: (BuildContext context)=> const Error404page(),
        );
      },
    );
  }
}





