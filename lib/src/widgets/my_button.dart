import 'package:aguchi_prueba1/src/widgets/shadow_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String iconImage;
  final String buttonText;

  const MyButton({
    Key? key,
    required this.iconImage,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShadowButonn(
          height: 80,
          width: 80,
          color: Colors.grey[200],
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(iconImage),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          buttonText,
          style: GoogleFonts.coda(
            fontSize: 15,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
