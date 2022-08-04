import 'package:flutter/material.dart';

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
        child: Container(
            width: 320,
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
                    primary: Color.fromARGB(210, 210, 210, 210),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onPressed: widget.onPressed,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.black54,
                        ),
                        Text("Hola Agustin!",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    ListTile(
                      title: Text(
                        "Saldo Actual",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        "\$500,00",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.green[800],
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ))));
  }
}
