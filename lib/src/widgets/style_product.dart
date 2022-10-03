import 'package:aguchi_prueba1/src/widgets/shadow_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      child: ShadowButonn(
        color: Colors.grey[200],
        height: 80,
        width: 350,
        child: ListTile(
          title: Text(
            '1    ' + title,
            textAlign: TextAlign.center,
            style: GoogleFonts.coda(
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
          subtitle: Text(
            '\$ ' + subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.coda(
              fontSize: 20,
              color: Colors.green[700],
            ),
          ),
        ),
      ),
    );
  }
}
