import 'package:flutter/material.dart';

class BoxDialog extends StatefulWidget {
  final String data;
  BoxDialog({required this.data});

  @override
  State<BoxDialog> createState() => _BoxDialogState();
}

class _BoxDialogState extends State<BoxDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 120,
        margin: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black45, offset: Offset(2, 4), blurRadius: 6)
            ]),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(210, 210, 210, 210),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
            onPressed: () {
              showDialog(
                  barrierColor: Colors.white54,
                  context: context,
                  builder: (context) => AlertDialog(
                        backgroundColor: Colors.white,
                        title: const Text("AVISO"),
                        content: Text("${widget.data}"),
                        actions: [
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                              child: const Text("Entendido"),
                              onPressed: () => {Navigator.of(context).pop()},
                            ),
                          )
                        ],
                      ));
            },
            child: const Text("")));
  }
}
