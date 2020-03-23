import 'package:flutter/material.dart';
import 'package:return_flutter/api.dart';
import 'package:return_flutter/game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Return',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReturnMainPage(title: 'Return'),
    );
  }
}

class ReturnMainPage extends StatefulWidget {
  ReturnMainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ReturnMainPageState createState() => _ReturnMainPageState();

}

class _ReturnMainPageState extends State<ReturnMainPage> {
  int _counter = 0;
  Future futureGame;

  @override
  void initState() {
    super.initState();
    futureGame = ApiHelper().fetchGame(1);
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<Game>(
            future: futureGame,
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return Column(children: <Widget> [
                  Text("Game ID: ${snapshot.data.id}"),
                  Text("Turns: ${snapshot.data.turns}"),
                  Text("Food: ${snapshot.data.food}"),
                  Text("Water: ${snapshot.data.water}"),
                  Text("Ore: ${snapshot.data.ore}"),
                  Text("Units: ${snapshot.data.units}"),
                  Text("Reverse: ${snapshot.data.reserve}"),
                  Text("Generaton Effect: ${snapshot.data.unitReserveGeneration}")
                ]);
              }
              else if (snapshot.hasError){
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Refresh',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
