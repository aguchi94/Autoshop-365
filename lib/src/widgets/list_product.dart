import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  final String child;

  ListProduct({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Colors.deepPurple[100],
        ),
        height: 80,
        child: Center(
          child: Text(child),
        ),
      ),
    );
  }
}
