import 'package:flutter/material.dart';


class CustomAppBarPages extends StatelessWidget {
  final Widget child;
  final String title;
  const CustomAppBarPages({required this.child,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('assets/logo365.png', width: 40,height: 40),
          )
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(233, 128, 212, 235),
        title: Text(title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(233, 128, 212, 235),
              Colors.black26,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child,
      )
    );
  }
}