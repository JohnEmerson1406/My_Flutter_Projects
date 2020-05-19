import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildContainer('Row 1', Colors.white),
              buildContainer('Row 2', Colors.red),
              buildContainer('Row 3', Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}

Container buildContainer(String text, Color color) {
  return Container(
    width: 100,
    height: 100,
    color: color,
    child: Text(text),
  );
}
