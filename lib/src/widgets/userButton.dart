import 'package:aguchi_prueba1/src/widgets/shadow_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserButton extends StatefulWidget {
  final VoidCallback onPressed;
  const UserButton({required this.onPressed});

  @override
  State<UserButton> createState() => _UserButtonState();
}

class _UserButtonState extends State<UserButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShadowButonn(
        width: 320,
        height: 120,
        color: Colors.grey[200],
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.deepPurple[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          onPressed: widget.onPressed,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.deepPurple[500],
                  ),
                  SizedBox(width: 40),
                  Text(
                    "Hola Agustin!",
                    style: GoogleFonts.coda(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              ListTile(
                title: Text(
                  "Saldo Actual",
                  style: GoogleFonts.coda(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  "\$500,00",
                  style: GoogleFonts.coda(
                    fontSize: 25,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
