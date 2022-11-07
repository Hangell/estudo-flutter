import 'package:exemplo/pages/hello_listview.dart';
import 'package:flutter/material.dart';

class DogDetail extends StatelessWidget {

  final Dog dog;

  DogDetail(this.dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.nome),
      ),
      body: Image.asset(dog.foto),
    );
  }
}
