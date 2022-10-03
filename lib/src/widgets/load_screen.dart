import 'package:aguchi_prueba1/src/pages/home.dart';
import 'package:aguchi_prueba1/src/pages/login.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingState extends StatefulWidget {
  final VoidCallback onPressed;
  final child;
  const LoadingState({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<LoadingState> createState() => _LoadingStateState();
}

class _LoadingStateState extends State<LoadingState> {
  Future loading() async {
    showDialog(
      barrierColor: Colors.grey[300],
      context: context,
      builder: (context) {
        return Center(
          child: Column(
            children: [
              FadeInDown(
                from: 100,
                duration: Duration(
                  milliseconds: 3000,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Image.asset('assets/newlogo365.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Iniciando',
                ),
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        loading();
        Future.delayed(
            Duration(
              seconds: 4,
            ), () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => HomePage()),
            ),
          );
        });
      },
      child: null,
    );
  }
}
