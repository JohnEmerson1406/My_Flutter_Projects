import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qrcode_app/models/item.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'QRCode App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Future<Item> createItem(String title) async {
  final http.Response response = await http.post(
    'https://todo-api-github.herokuapp.com',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    return Item.fromJson(json.decode(response.body));
  } else {
    throw Exception('Erro ao criar item.');
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Item> _futureItem;

  Future scanQR() async {
    String response = await FlutterBarcodeScanner.scanBarcode(
        "#f44336", "Cancelar", true, ScanMode.QR);

    setState(() {
      _futureItem = createItem(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: (_futureItem == null)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Ler código QR'),
                    onPressed: () => scanQR(),
                  ),
                ],
              )
            : FutureBuilder<Item>(
                future: _futureItem,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${snapshot.data.title}",
                          textAlign: TextAlign.center,
                        ),
                        RaisedButton(
                          child: Text('Ler outro código QR'),
                          onPressed: () => scanQR(),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${snapshot.error}"),
                        RaisedButton(
                          child: Text('Ler outro código QR'),
                          onPressed: () => scanQR(),
                        ),
                      ],
                    );
                  }

                  return CircularProgressIndicator();
                },
              ),
      ),
    );
  }
}
