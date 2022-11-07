import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {

String text;
Function onPressed;

BlueButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(onSurface: Colors.red),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onPressed: () {
          onPressed();
        });
  }
}
