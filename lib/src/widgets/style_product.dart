import 'package:flutter/material.dart';

class StyleProduct extends StatelessWidget {
  final String title;
  final String subtitle;

  StyleProduct({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 15.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Colors.deepPurple[100],
        ),
        height: 80,
        width: 350,
        child: ListTile(
          title: Text(
            '1    ' + title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            '\$ ' + subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green[700],
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
