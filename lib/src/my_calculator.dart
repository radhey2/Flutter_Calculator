import 'package:flutter/material.dart';
import 'button.dart';

class CalcButton {
  final String label;
  final ButtonType type;

  const CalcButton(this.label, this.type);
}

class MyCalculatorApp extends StatefulWidget {
  const MyCalculatorApp({super.key});

  @override
  State<MyCalculatorApp> createState() => _MyCalculatorAppState();
}

class _MyCalculatorAppState extends State<MyCalculatorApp> {
  final List<CalcButton> buttons = const [
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

  final List<String> operators = [
    '+',
    '/',
    '-',
    '*',
  ];

  String displayStr = '';

  num? operand1;
  num? operand2;
  String? operator;
  num? result;

  void onButtonPressed(String label) {
    if (operators.contains(label)) {
      setOperator(label);
    } else {
      if (label == "=") {
        operand2 ??= num.tryParse(displayStr);
        calculate();
        operator = '';
      } else if (label == "C") {
        clear();
      } else {
        setOperand(label);
      }
    }
    setState(() {});
  }

  void calculate() {
    switch (operator) {
      case '+':
        result = operand1! + operand2!;
        break;
      case '-':
        result = operand1! - operand2!;
        break;
      case '*':
        result = operand1! * operand2!;
        break;
      case '/':
        result = operand1! / operand2!;
        break;
      default:
    }

    setState(() {
      operand1 = result;
      displayStr = operand1.toString();
      operand2 = null;
    });
  }

  void setOperand(String label) {
    if (operator == null) {
      displayStr += label;
      operand1 = num.tryParse(displayStr);
    } else {
      if (result != null) {
        result = null;
        displayStr = '';
      }
      displayStr += label;
      operand2 = num.tryParse(displayStr);
    }
  }

  void setOperator(String label) {
    if (operator != null) {
      if (operand2 != null) {
        calculate();
      }
    } else {
      displayStr = '';
    }
    operator = label;
  }

  void clear() {
    operand1 = null;
    operand2 = null;
    operator = null;
    result = null;
    displayStr = '';
  }

  @override
  Widget build(BuildContext context) {
    assert(buttons.length % 4 == 0, 'Each row must have 4 buttons');
    return Scaffold(
      body: Center(
        child: Container(
            color: Colors.blueGrey,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Stack(
                      children: [
                        if (operator != null)
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                operator!, // asserts that operator is not null
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        Center(
                          child: SizedBox(
                            height: 130,
                            child: FittedBox(
                              child:
                                  Text(displayStr.isEmpty ? '0' : displayStr),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 16,
                  alignment: WrapAlignment.center,
                  children: buttons
                      .map((button) => CalculatorButton(
                            label: button.label,
                            type: button.type,
                            onPressed: onButtonPressed,
                          ))
                      .toList(),
                ),
              ],
            )),
      ),
    );
  }
}
