import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton(this.text, this.color, this.onPressed);

  final String text;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        onPressed: onPressed,
        child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 28),
            )
        ),
        shape: new CircleBorder(),
        color: color,
        padding: const EdgeInsets.all(16.0),
      ),
    );
  }

}