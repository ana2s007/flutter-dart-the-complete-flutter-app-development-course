import 'package:flutter/material.dart';
import './make_it_rain.dart';

class Home extends StatelessWidget {

  final String title;

  Home({Key key, this.title}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
        backgroundColor: Colors.lightGreen,
      ),
      body: new MakeItRain(),
    );
  }
}
