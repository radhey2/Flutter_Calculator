import 'package:flutter/material.dart';

enum ButtonType { fn, num }

class CalculatorButton extends StatelessWidget {
  final String label;
  final ButtonType type;
  final void Function(String value) onPressed;

  const CalculatorButton(
      {super.key,
      required this.label,
      required this.type,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 130,
        padding: const EdgeInsets.only(top: 10, left: 5),
        width: MediaQuery.of(context).size.width / 8,
        // height: MediaQuery.of(context).size.height / 8,
        child: Column(children: [
          SizedBox(
            height: 50,
            child: Row(
              children: [
                FloatingActionButton(
                  backgroundColor:
                      type == ButtonType.fn ? Colors.amber : Colors.black,
                  onPressed: (() {}),
                  child: Text(label),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
