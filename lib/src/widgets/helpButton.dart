import 'package:aguchi_prueba1/src/widgets/shadow_buttons.dart';
import 'package:flutter/material.dart';

class HelpButton extends StatelessWidget {
  final String info;
  final String imageRoute;
  const HelpButton({required this.info, required this.imageRoute});
  @override
  Widget build(BuildContext context) {
    return ShadowButonn(
      width: 70,
      height: 120,
      color: Colors.blue[200],
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            barrierColor: Colors.white54,
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.grey[300],
              title: ShadowButonn(
                width: 240,
                height: 120,
                color: Colors.grey[200],
                child: Image.asset(imageRoute),
              ),
              content: Text(info),
              actions: [
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: const Text("Entendido"),
                    onPressed: () => {Navigator.of(context).pop()},
                  ),
                )
              ],
            ),
          );
        },
        child: Image.asset(
          'assets/ayuda.png',
        ),
      ),
    );
  }
}
