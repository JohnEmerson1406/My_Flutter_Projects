import 'package:flutter/material.dart';
import 'package:pokemon_app/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(pokemon.name),
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.cyan,
    );
  }
}
