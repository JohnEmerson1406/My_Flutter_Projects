import 'package:flutter/material.dart';

import 'package:identity/identity.dart';
import 'package:identity_firebase/identity_firebase.dart';
import 'package:identity_firebase_github/identity_firebase_github.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void initState() {
    super.initState();

    Identity.of(context).init(
        IdentityFirebaseProvider([
          FirebaseGithubAuthenticator(
              clientId: "[client_id]",
              clientSecret: "[client_secret]",
              redirectUrl: "[firebae_redirect_url]",
              scope: "user:email",
              clearCache: false) // set to false to allow to reuse current session, default is true
        ]),
        (context) => MyHomePage());
  }
}
