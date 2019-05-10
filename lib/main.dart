import 'package:flutter/material.dart';
import 'calculator.dart';
import 'calculator_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.teal,
      ),
      home: MyHomePage(title: 'Flutter Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Calculator _calculator = Calculator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            displayArea(),
            buttonArea(),
          ],
        ),
      ),
    );
  }

  Widget displayArea() {
    var text = _calculator.showingValue().toString();
    if (text.endsWith(".0")) {
      text = text.replaceAll(".0", "");
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: TextStyle(fontSize: 64)),
    );
  }

  Widget buttonArea() {
    return Expanded(
      child: Row(
        children: <Widget>[
          buttonColumn([
            numberButton(7),
            numberButton(4),
            numberButton(1),
            numberButton(0),
          ]),
          buttonColumn([
            numberButton(8),
            numberButton(5),
            numberButton(2),
            clearButton(),
          ]),
          buttonColumn([
            numberButton(9),
            numberButton(6),
            numberButton(3),
            allClearButton(),
          ]),
          buttonColumn([
            equalButton(),
            signButton(Sign.plus),
            signButton(Sign.minus),
          ]),
        ],
      ),
    );
  }

  Widget buttonColumn(List<Widget> children) {
    return Expanded(
      child: Column(children: children),
    );
  }

  Widget numberButton(int number) {
    return CalculatorButton(
        number.toString(),
        Theme.of(context).primaryColor,
            () { numberPressed(number); }
    );
  }

  Widget equalButton() {
    var color = Theme.of(context).accentColor;
    return CalculatorButton("=", color, () { equalPressed(); });
  }

  Widget signButton(Sign sign) {
    var color = Theme.of(context).accentColor;
    switch (sign) {
      case Sign.plus:
        return CalculatorButton("+", color, () { plusPressed(); });
      case Sign.minus:
        return CalculatorButton("-", color, () { minusPressed(); });
    }
  }

  Widget clearButton() {
    var color = Colors.grey;
    return CalculatorButton(
        "C",
        color,
            () { clearPressed(); }
    );
  }

  Widget allClearButton() {
    var color = Colors.grey;
    return CalculatorButton(
        "AC",
        color,
            () { allClearPressed(); }
    );
  }

  void numberPressed(int number) {
    setState(() {
      _calculator.inputNumber(number);
    });
  }
  void clearPressed() {
    setState(() {
      _calculator.clear();
    });
  }
  void allClearPressed() {
    setState(() {
      _calculator.allClear();
    });
  }
  void plusPressed() {
    setState(() {
      _calculator.inputSign(Sign.plus);
    });
  }
  void minusPressed() {
    setState(() {
      _calculator.inputSign(Sign.minus);
    });
  }
  void equalPressed() {
    setState(() {
      _calculator.calculate();
    });
  }

}