import 'package:flutter/material.dart';

import 'calculator_app.dart';

class MyCalculatorApp extends StatelessWidget {
  const MyCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Values'),
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Buttons(
                  text: '9',
                  color: Colors.black,
                ),
                Buttons(
                  text: '8',
                  color: Colors.black,
                ),
                Buttons(
                  text: '7',
                  color: Colors.black,
                ),
                Buttons(
                  text: '+',
                  color: Colors.amber,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Buttons(
                  text: '6',
                  color: Colors.black,
                ),
                Buttons(
                  text: '5',
                  color: Colors.black,
                ),
                Buttons(
                  text: '4',
                  color: Colors.black,
                ),
                Buttons(
                  text: '-',
                  color: Colors.amber,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Buttons(
                  text: '3',
                  color: Colors.black,
                ),
                Buttons(
                  text: '2',
                  color: Colors.black,
                ),
                Buttons(
                  text: '1',
                  color: Colors.black,
                ),
                Buttons(
                  text: '*',
                  color: Colors.amber,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Buttons(
                text: 'C',
                color: Colors.amber,
              ),
              Buttons(
                text: 'AC',
                color: Colors.amber,
              ),
              Buttons(
                text: '0',
                color: Colors.amber,
              ),
              Buttons(
                text: '/',
                color: Colors.amber,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
