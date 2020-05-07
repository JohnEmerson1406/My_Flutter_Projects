import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poke App',
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    var response = http.get(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Poke App"),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Text("Hello from Pokemon App"),
      ),
    );
  }
}
