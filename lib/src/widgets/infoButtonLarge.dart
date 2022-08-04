import 'package:flutter/material.dart';

class InfoButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const InfoButton({Key? key, required this.child, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 320,
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
                    primary: Color.fromARGB(210, 210, 210, 210),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onPressed: onPressed,
                child: child)));
  }
}
