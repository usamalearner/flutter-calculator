import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
// flutter pub add math_expressions
// install by above command

class Calculator extends StatefulWidget {
  // const Calculator({ Key? key }) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic result = '';

  Widget button(dynamic value) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            result = result + '$value';
          });
        },
        child: Text('$value'));
  }

  clear() {
    setState(() {
      result = '';
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel contextModal = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, contextModal);

    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 130),
        Text(result,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            button(1),
            button(2),
            button(3),
            button(4),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            button(5),
            button(6),
            button(7),
            button(8),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            button(9),
            button(0),
            button('+'),
            button('-'),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            button('*'),
            button('/'),
            ElevatedButton(onPressed: clear, child: Text("Clear")),
            ElevatedButton(onPressed: output, child: Text("=")),
          ],
        ),
      ],
    ));
  }
}
