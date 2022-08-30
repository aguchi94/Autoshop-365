import 'package:flutter/material.dart';

class CustomButtonMini extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const CustomButtonMini({required this.child, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 150,
            height: 120,
            margin: const EdgeInsets.all(10),
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
              child: child,
              onPressed: onPressed,
            )));
  }
}
