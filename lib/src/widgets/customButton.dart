import 'package:aguchi_prueba1/src/widgets/shadow_buttons.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String imageRoute;
  final VoidCallback onPressed;
  final double width;
  const CustomButton(
      {Key? key,
      required this.imageRoute,
      required this.onPressed,
      required this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShadowButonn(
        width: 240,
        height: 120,
        color: Colors.grey[200],
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: Image.asset(imageRoute, width: width),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
