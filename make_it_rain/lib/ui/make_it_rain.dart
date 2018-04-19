import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MakeItRainState();
  }
}

class MakeItRainState extends State<MakeItRain> {

  int _moneyCounter = 0;
  void _rainMoney() {
    setState(() {
      _moneyCounter = _moneyCounter + 1000;
    });
  }
  @override
  Widget build(BuildContext context) {
    Color color = Colors.greenAccent;
    if (_moneyCounter == 0) {
      color = Colors.grey;

    } else if (_moneyCounter >= 5000) {
      color = Colors.yellow.shade700;
    }

    return new Container(
      child: Column(
        children: <Widget>[
          new Center(
            child: new Text("Get Rich!",
                style: new TextStyle(color: Colors.grey, fontSize: 29.9)),
          ),
          new Expanded(
              child: new Center(
            child: new Text(
              'R\$$_moneyCounter',
              style: new TextStyle(
                color: color,
                fontSize: 46.9,
                fontWeight: FontWeight.w800,
              ),
            ),
          )),
          new Expanded(
              child: new Center(
            child: new FlatButton(
              color: Colors.lightGreen,
              textColor: Colors.white70,
              onPressed: _rainMoney,
              child: new Text(
                "Let It Rain!",
                style: new TextStyle(fontSize: 19.9),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
