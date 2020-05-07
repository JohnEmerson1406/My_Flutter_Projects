import 'package:flutter/material.dart';
import 'package:pokemon_app/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10,
            top:  MediaQuery.of(context).size.height * 0.1,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(pokemon.name),
                  Text("Height: ${pokemon.height}"),
                  Text("Weight: ${pokemon.weight}"),
                  Text("Types"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((t) => FilterChip(
                              backgroundColor: Colors.amber,
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
                              backgroundColor: Colors.red,
                              label: Text(
                                t,
                                style: TextStyle(color: Colors.white),
                              ),
                              onSelected: (b) {},
                            ))
                        .toList(),
                  ),
                  Text("Next Evolution"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution
                        .map((n) => FilterChip(
                              backgroundColor: Colors.green,
                              label: Text(
                                n.name,
                                style: TextStyle(color: Colors.white),
                              ),
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
      body: bodyWidget(context),
    );
  }
}
