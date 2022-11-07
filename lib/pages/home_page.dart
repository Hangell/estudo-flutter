import 'package:exemplo/pages/hello_listview.dart';
import 'package:exemplo/pages/hello_page2.dart';
import 'package:exemplo/pages/hello_page3.dart';
import 'package:exemplo/utils/nav.dart';
import 'package:exemplo/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Teste Flutter",
        ),
        centerTitle: true,
      ),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _onClickFab();
        },
      ),
      drawer: Container(
        color: Colors.amber
      ),
    );
  }

  _onClickFab() {
    print("Adicionar");
  }

  _body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 16),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _text(),
            _pageView(),
            SizedBox(
              height: 20,
            ),
            _buttons(context),
          ],
        ));
  }

  _text() {
    return Text(
      "Flutter & Material",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.overline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.wavy,
      ),
    );
  }

  _img(String caminho) {
    return Image.asset(
      caminho,
      fit: BoxFit.cover,
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print(">> $s");
  }

  _buttons(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          BlueButton(
              "ListView", () => _onClickNavigator(context, HelloListView())),
          BlueButton("Page 2", () => _onClickNavigator(context, HelloPage2())),
          BlueButton("Page 3", () => _onClickNavigator(context, HelloPage3())),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          BlueButton("Snack", () => _onClickSnack(context)),
          BlueButton("Dialog", () => _onClickDialog(context)),
          BlueButton("Toast", _onClickToast),
        ],
      ),
    ]);
  }

  _onClickSnack(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Olá Flutter"),
        action: SnackBarAction(
          textColor: Colors.yellow,
          label: "OK",
          onPressed: () {
            print("OK!");
          },
        )));
  }

  _onClickDialog(BuildContext context) {
    showDialog(context: context,
        barrierDismissible: false,
        builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text("Flutter é muito legal"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    });
  }

  _onClickToast() {
    _showToast("Show Center Toast", gravity: Toast.center);
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.all(20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png"),
        ],
      ),
    );
  }

  void _showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }
} //Close class HomePage
