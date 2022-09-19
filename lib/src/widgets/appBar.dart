import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget child;
  const CustomAppBar({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      child: child,
    ));
  }
}
