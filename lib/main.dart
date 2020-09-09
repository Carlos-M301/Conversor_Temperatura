import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de temperatura',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Conversor(title: 'Conversor de Temperatura F a C'),
    );
  }
}

class Conversor extends StatefulWidget {
  Conversor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ConversorState createState() => _ConversorState();
}
class _ConversorState extends State<Conversor>{
  var _output = "0.0";
  final inputController = TextEditingController();

  void _calcularTemp(){
    setState(() {
      double tempOriginal = double.parse(inputController.text);
      double nuevaTemperatura = (tempOriginal-32)* 5/9;
      _output = "$nuevaTemperatura";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: inputController,
              ),
              RaisedButton(onPressed: (){
              _calcularTemp();
              }),
              Text('$_output'),
            ],
          ),
        ),
      ),
    );
  }
}
