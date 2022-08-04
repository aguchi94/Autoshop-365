import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget child;
  const CustomAppBar({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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