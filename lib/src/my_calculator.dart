import 'package:flutter/material.dart';
import 'button.dart';

class CalcButton {
  final String label;
  final ButtonType type;

  const CalcButton(this.label, this.type);
}

class MyCalculatorApp extends StatelessWidget {
  static const List<CalcButton> buttons = [
    CalcButton('9', ButtonType.num),
    CalcButton('8', ButtonType.num),
    CalcButton('7', ButtonType.num),
    CalcButton('+', ButtonType.fn),
    CalcButton('6', ButtonType.num),
    CalcButton('5', ButtonType.num),
    CalcButton('4', ButtonType.num),
    CalcButton('-', ButtonType.fn),
    CalcButton('3', ButtonType.num),
    CalcButton('2', ButtonType.num),
    CalcButton('1', ButtonType.num),
    CalcButton('*', ButtonType.fn),
    CalcButton('=', ButtonType.fn),
    CalcButton('0', ButtonType.num),
    CalcButton('C', ButtonType.fn),
    CalcButton('/', ButtonType.fn),
  ];

  const MyCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    assert(buttons.length % 4 == 0, 'Each row must have 4 buttons');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Center(
        child: Container(
          color: Colors.blueGrey,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Values'),
              for (int i = 0; i < buttons.length ~/ 4; i++)
                CalculatorRow(buttons: buttons.sublist(i * 4, (i + 1) * 4))
            ],
          ),
        ),
      ),
    );
  }
}

sublist(0,4) -> 0, 1, 2, 3
sublist(4, 8) -> 4, 5, 6, 7
class CalculatorRow extends StatelessWidget {
  final List<CalcButton> buttons;
  const CalculatorRow({
    Key? key,
    required this.buttons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: buttons
            .map((e) => CalculatorButton(
                label: e.label, type: e.type, onPressed: (value) {}))
            .toList(),
      ),
    );
  }
}
