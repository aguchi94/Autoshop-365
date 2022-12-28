import 'package:aguchi_prueba1/src/widgets/shadow_buttons.dart';
import 'package:flutter/material.dart';

class InfoButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const InfoButton({Key? key, required this.child, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShadowButonn(
        width: 320,
        height: 120,
        color: Colors.blue[200],
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
