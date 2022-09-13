import 'package:calculator/src/my_calculator.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';

const windowSize = Size(425, 600);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DesktopWindow.setWindowSize(windowSize);
  await DesktopWindow.setMinWindowSize(windowSize);
  await DesktopWindow.setMaxWindowSize(windowSize);
  runApp(const MyCalculator());
}

class MyCalculator extends StatelessWidget {
  const MyCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyCalculatorApp());
  }
}
