import 'package:flutter/material.dart';

class ShadowButonn extends StatelessWidget {
  final double width;
  final double height;
  final color;
  final Widget child;
  const ShadowButonn({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 25,
            spreadRadius: 10,
          ),
        ],
      ),
      child: child,
    );
  }
}
