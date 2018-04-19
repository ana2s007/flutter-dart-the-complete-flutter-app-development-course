import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {

  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomeString = '';

  void _login() {
    setState(() {
      if (_userController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        _welcomeString = _userController.text;
      } else {
        _welcomeString = "Nothing";
      }
    });
  }

  void _erase() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),

      backgroundColor: Colors.blueGrey,

      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            //image/profile
            new Image.asset(
                'images/face.png', width: 90.0, height: 90.0, color: Colors.greenAccent,),
            //form
            new Padding(
              padding: new EdgeInsets.all(10.0),
              child: new Container(
                color: Colors.white,
                child: new Padding(
                  padding: EdgeInsets.all(10.0),
                  child: new Column(
                    children: <Widget>[
                      new TextField(
                        controller: _userController,
                        decoration: new InputDecoration(
                          hintText: 'Username',
                          icon: new Icon(Icons.person),
                        ),
                      ),
                      new TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: new InputDecoration(
                          hintText: 'Password',
                          icon: new Icon(Icons.lock),
                        ),
                      ),

                      new Padding(padding: const EdgeInsets.all(10.5),),
                      new Center(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(left: 38.0),
                              child: new RaisedButton(
                                  color: Colors.redAccent,
                                  onPressed: _login,
                                  child: new Text("Login")),
                            ),
                            new Container(
                              margin: const EdgeInsets.only(right: 38.0),
                              child: new RaisedButton(
                                  color: Colors.redAccent,
                                  onPressed: _erase,
                                  child: new Text("Clean")),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ), // Form,

            new Padding(padding: const EdgeInsets.all(10.5),),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Welcome, $_welcomeString",
                  style: new TextStyle(color: Colors.white,
                    fontSize: 19.4,
                    fontWeight: FontWeight.w500,
                  ),),
              ],
            )
          ],
        ),
      ),

    );
  }

}