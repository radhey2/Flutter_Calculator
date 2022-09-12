import 'package:flutter/material.dart';

enum ButtonType { fn, num }

class CalculatorButton extends StatelessWidget {
  final String label;
  final ButtonType type;
  final void Function(String) onPressed;

  const CalculatorButton(
      {super.key,
      required this.label,
      required this.type,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      padding: const EdgeInsets.only(top: 10, left: 5),
      child: Column(children: [
        SizedBox(
          height: 50,
          child: Row(
            children: [
              FloatingActionButton(
                backgroundColor:
                    type == ButtonType.fn ? Colors.amber : Colors.black,
                onPressed: () => onPressed(label),
                child: Text(label),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
