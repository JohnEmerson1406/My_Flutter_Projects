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

Future<List<Contribution>> getContributionsOld(
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

Future<int> getContributionsOfDay(String user, String day) async {
  var url =
      'https://urlreq.appspot.com/req?method=GET&url=https%3A%2F%2Fgithub.com%2Fusers%2F$user%2Fcontributions%3Fto%3D$day';
  // var url = 'https://github.com/$user';
  var res = await http.get(url);
  var document = parse(res.body);
  var rectNodes =
      document.querySelector('.js-calendar-graph-svg').querySelectorAll('rect');
  int dayContributions =
      int.tryParse(rectNodes[rectNodes.length - 1].attributes['data-count']);
  return dayContributions;
}

Future<int> getContributions(String login, String date) async {
  var url = 'https://github.com/$login?from=$date';
  var res = await http.get(url);
  var document = parse(res.body);
  var rectNodes =
      document.querySelector('.js-calendar-graph-svg').querySelectorAll('rect');
  var yearContributions = rectNodes.map((rectNode) {
    return Contribution(
      color: rectNode.attributes['fill'],
      count: int.tryParse(rectNode.attributes['data-count']),
      date: rectNode.attributes['data-date'],
    );
  }).toList();

  var dateIndex =
      yearContributions.indexWhere((contribution) => contribution.date == date);
  return yearContributions[dateIndex].count;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _login = 'JohnEmerson1406';
  String _date = '2020-11-29';
  int _contributions = 0;

  void _showContributions() async {
    int dateContributions = await getContributions(_login, _date);

    setState(() {
      _contributions = dateContributions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contributions count for $_date:',
            ),
            Text(
              '$_contributions',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showContributions,
        tooltip: 'Show',
        child: Icon(Icons.add),
      ),
    );
  }
}
