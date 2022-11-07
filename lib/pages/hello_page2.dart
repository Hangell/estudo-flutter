import 'package:flutter/material.dart';
import 'package:exemplo/widgets/blue_button.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: BlueButton(
          "Voltar",
          () => _onClickVoltar(
              context) // Navigator.pop(context) is the same as Navigator.of(context).pop()
          ),
    );
  }

  _onClickVoltar(BuildContext context) {
    Navigator.pop(context, "Tela 2");
  }
}
