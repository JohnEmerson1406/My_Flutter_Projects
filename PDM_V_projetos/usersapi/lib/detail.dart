import 'package:usersapi/models/User.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final User user;

  DetailScreen({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name: ' + user.name),
            Text('Username: ' + user.username),
            Text('Email: ' + user.email)
          ],
        ),
      ),
    );
  }
}
