import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text('LikeApp'),
          backgroundColor: Colors.grey[900],
        ),
        body: LikePage(),
      ),
    ),
  );
}

class LikePage extends StatefulWidget {
  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  bool buttonLikePressed = false;
  bool buttonDislikePressed = false;

  void checkLike(bool userPickedLike) {
    setState(() {
      if (userPickedLike == true) {
        buttonLikePressed = !buttonLikePressed;
        buttonDislikePressed = false;
      } else {
        buttonDislikePressed = !buttonDislikePressed;
        buttonLikePressed = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: Image(
                image: buttonLikePressed
                    ? AssetImage('images/emoji_feliz.png')
                    : buttonDislikePressed
                        ? AssetImage('images/emoji_triste.png')
                        : AssetImage('images/emoji_neutro.png'),
              ),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 5),
                child: FlatButton.icon(
                  textColor: Colors.white,
                  icon: Icon(
                    Icons.thumb_up,
                    color: buttonLikePressed ? Colors.blue : Colors.white,
                  ),
                  label: Text(
                    'Like',
                    style: TextStyle(
                      color: buttonLikePressed ? Colors.blue : Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    checkLike(true);
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 15, left: 5),
                child: FlatButton.icon(
                  textColor: Colors.white,
                  icon: Icon(
                    Icons.thumb_down,
                    color: buttonDislikePressed ? Colors.blue : Colors.white,
                  ),
                  label: Text(
                    'Dislike',
                    style: TextStyle(
                      color: buttonDislikePressed ? Colors.blue : Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    checkLike(false);
                  },
                ),
              ),
            ),
          ],
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }
}
