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
        child: Container(
            width: 260,
            height: 120,
            margin: const EdgeInsets.all(7),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45,
                      offset: Offset(2, 4),
                      blurRadius: 6)
                ]),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(240, 240, 240, 240),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              child: Image.asset(imageRoute, width: width),
              onPressed: onPressed,
            )));
  }
}
