import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

class Contribution {
  int count;
  String color;
  String date;

  Contribution({this.count, this.color, this.date});

  Contribution.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    color = json['color'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['color'] = this.color;
    data['date'] = this.date;
    return data;
  }
}

Future<List<Contribution>> getContributions(
  String login, {
  String from,
  String to,
}) async {
  var url = 'https://github.com/$login';
  if (from != null && to != null) {
    url += '?from=$from&to=$to';
  }
  var res = await http.get(url);
  var document = parse(res.body);
  var rectNodes =
      document.querySelector('.js-calendar-graph-svg').querySelectorAll('rect');
  return rectNodes.map((rectNode) {
    return Contribution(
      color: rectNode.attributes['fill'],
      count: int.tryParse(rectNode.attributes['data-count']),
      date: rectNode.attributes['data-date'],
    );
  }).toList();
}

Future<int> getContributionsOfDay(
  String user,
  String day
) async {
  var url = 'https://urlreq.appspot.com/req?method=GET&url=https%3A%2F%2Fgithub.com%2Fusers%2F$user%2Fcontributions%3Fto%3D$day';
  // var url = 'https://github.com/$user';
  var res = await http.get(url);
  var document = parse(res.body);
  var rectNodes =
      document.querySelector('.js-calendar-graph-svg').querySelectorAll('rect');
  int dayContributions = int.tryParse(rectNodes[rectNodes.length - 1].attributes['data-count']);
  return dayContributions;
}

/// Get user contributions data as svg string
// Future<String> getContributionsSvg(
//   String login, {
//   bool keepDateText = false,
//   String from,
//   String to,
// }) async {
//   var url = 'https://github.com/$login';
//   if (from != null && to != null) {
//     url += '?from=$from&to=$to';
//   }
//   var res = await http.get(url);
//   var document = parse(res.body);
//   var svgNode = document.querySelector('.js-calendar-graph-svg');

//   if (!keepDateText) {
//     // remove text tags
//     svgNode.children[0].children.forEach((child) {
//       if (child.localName == 'text') {
//         child.remove();
//       }
//     });

//     // resize
//     // the size depend on if use check the 'Activity overview' option
//     if (svgNode.attributes['width'] == '563') {
//       svgNode.attributes['width'] = '528';
//       svgNode.attributes['height'] = '68';
//       svgNode.children[0].attributes['transform'] = 'translate(-11, 0)';
//     } else {
//       svgNode.attributes['width'] = '637';
//       svgNode.attributes['height'] = '84';
//       svgNode.children[0].attributes['transform'] = 'translate(-13, 0)';
//     }
//   }

//   return svgNode?.outerHtml;
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    var login = 'JohnEmerson1406'; // replace this with GitHub account you want
    var day = '2020-07-22';
    // var day = '2020-11-28';

    // Get the contribution of a certain year
    // If it is the past year, from: yyyy-12-01, to: yyyy-12-31
    // if not, from: The first day of the current month, to: today
    var contributions = await getContributionsOfDay(login, day);
    print('contributions count for $day: $contributions');

    // get svg string
    // String svg = await getContributionsSvg(login);
    // print(svg);

    // get color and count of this year's contribution
    var yearContributions = await getContributions(login);
    int dayIndex = yearContributions.indexWhere((element) => element.date == '2020-07-22');
    Contribution contributions1 = yearContributions[dayIndex];
    print(contributions1.count);
  }

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
