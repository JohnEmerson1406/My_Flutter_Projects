import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flip_card/flip_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  fit: BoxFit.fill, image: AssetImage("images/image.jpg")),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: FlipCard(
                          direction: FlipDirection.HORIZONTAL, // default
                          front: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.0),
                            child: _nameDetailsContainer(),
                          ),
                          back: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.0),
                            child: _socialContainer(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _nameDetailsContainer() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 130.0,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    radius: 50,
                    // backgroundColor: Colors.red,
                    backgroundImage: AssetImage('images/image2.jpg'),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40,
                        bottom: 6
                      ),
                      child: Text('John Emerson',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Text(
                      'Flutter Developer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.9),
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
          Container(
            child: _detailsContainer(),
          ),
        ],
      ),
    );
  }

  Widget _socialContainer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 130.0,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Container(
                      width: 120.0,
                      height: 120.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage("images/image2.jpg"),
                          ))),
                  title: Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Text('Social Links',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.pink.withOpacity(0.9),
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
          Container(
            child: _socialdetailsContainer(),
          ),
        ],
      ),
    );
  }

  Widget _detailsContainer() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Student of Systems Analysis and Development at IFPI - Federal Institute of Piauí.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: Icon(FontAwesomeIcons.mapMarkerAlt,
                      color: Colors.blueAccent)),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Container(
                  child: Text(
                    'Teresina - PI, Brazil',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: Icon(FontAwesomeIcons.envelope,
                      color: Colors.blueAccent)),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Container(
                  child: Text(
                    'john.carv.sousa@gmail.com',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ],
    );
  }

  Widget _socialdetailsContainer() {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
          child: Container(
              child: Row(
            children: <Widget>[
              Container(
                  child: Icon(
                FontAwesomeIcons.twitter,
                color: Color(0xffff0d41),
                size: 30.0,
              )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  child: Text(
                    '/johnemerson1406',
                    style: TextStyle(
                      color: Color(0xffff0d41),
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
          child: Container(
              child: Row(
            children: <Widget>[
              Container(
                  child: Icon(
                FontAwesomeIcons.github,
                color: Color(0xffff0d41),
                size: 30.0,
              )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  child: Text(
                    '/johnemerson1406',
                    style: TextStyle(
                      color: Color(0xffff0d41),
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
          child: Container(
              child: Row(
            children: <Widget>[
              Container(
                  child: Icon(
                FontAwesomeIcons.linkedin,
                color: Color(0xffff0d41),
                size: 30.0,
              )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  child: Text(
                    '/johnemerson1406',
                    style: TextStyle(
                      color: Color(0xffff0d41),
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
          child: Container(
              child: Row(
            children: <Widget>[
              Container(
                  child: Icon(
                FontAwesomeIcons.facebook,
                color: Color(0xffff0d41),
                size: 30.0,
              )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  child: Text(
                    '/johnemerson1406',
                    style: TextStyle(
                      color: Color(0xffff0d41),
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ],
    );
  }
}
