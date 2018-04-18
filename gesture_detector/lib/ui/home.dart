import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final String title;

  Home({Key key, this.title}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange.shade400,
        title: new Text(title),
      ),
      body: new Center(
        child: new CustomButton(),
      )
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(content: new Text("Hello Gestures!"),
          backgroundColor: Theme.of(context).backgroundColor,
          duration: new Duration(milliseconds: 500),);
        Scaffold.of(context).showSnackBar(snackBar);
      },
      
      child: new Container(
        padding: new EdgeInsets.all(30.0),
        decoration: new BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: new BorderRadius.circular(5.5),
        ),
        child: Text("First Button"),
      ),
    );
  }
}