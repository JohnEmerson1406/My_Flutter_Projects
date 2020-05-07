import 'package:flutter/material.dart';
import 'package:pokemon_app/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});

  bodyWidget() => Stack(
        children: <Widget>[
          Container(
            child: Card(
              child: Column(
                children: <Widget>[
                  Text(pokemon.name),
                  Text("Height: ${pokemon.height}"),
                  Text("Weight: ${pokemon.weight}"),
                  Text("Types"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((t) => FilterChip(
                              label: Text(t),
                              onSelected: (b) {},
                            ))
                        .toList(),
                  ),
                  Text("Weakness"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses
                        .map((t) => FilterChip(
                              label: Text(t),
                              onSelected: (b) {},
                            ))
                        .toList(),
                  ),
                  Text("Next Evolution"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution
                        .map((n) => FilterChip(
                              label: Text(n.name),
                              onSelected: (b) {},
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(pokemon.name),
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.cyan,
      body: bodyWidget(),
    );
  }
}
