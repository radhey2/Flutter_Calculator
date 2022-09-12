import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  final String text;
  final color;
  const Buttons({super.key, required this.text, this.color});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  late double num1;
  late double num2;
  late String res;
  late String operanad;
  buttonPressed(text) {
    if (text == "+" || text == "-" || text == "*" || text == "/") {
      res = "0.0";
      num1 = text;
      num2 = text;
      res = (num1 + num2).toString();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 130,
        padding: const EdgeInsets.only(top: 10, left: 5),
        width: MediaQuery.of(context).size.width / 8,
        // height: MediaQuery.of(context).size.height / 8,
        color: Colors.blueGrey,
        child: Column(children: [
          SizedBox(
            height: 50,
            child: Row(
              children: [
                FloatingActionButton(
                  backgroundColor: widget.color,
                  onPressed: (() {
                    print(widget.text);
                    buttonPressed(widget.text);
                  }),
                  child: Text(widget.text),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
