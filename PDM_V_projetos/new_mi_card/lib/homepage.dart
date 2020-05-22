import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("images/image.jpg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
