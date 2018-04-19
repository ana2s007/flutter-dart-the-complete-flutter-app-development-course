import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  FocusNode _focusNodeUser = new FocusNode();
  FocusNode _focusNodePassword = new FocusNode();

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
        child: new SingleChildScrollView(
          child: new Column(
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
                        new EnsureVisibleWhenFocused(
                            child: new TextField(
                              focusNode: _focusNodeUser,
                              controller: _userController,
                              decoration: new InputDecoration(
                                hintText: 'Username',
                                icon: new Icon(Icons.person),
                              ),
                            ),
                            focusNode: _focusNodeUser
                        ),
                        new EnsureVisibleWhenFocused(
                          child: new TextField(
                            focusNode: _focusNodePassword,
                            controller: _passwordController,
                            obscureText: true,
                            decoration: new InputDecoration(
                              hintText: 'Password',
                              icon: new Icon(Icons.lock),
                            ),
                          ),
                          focusNode: _focusNodePassword,
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
      ),

    );
  }

}



/// A widget that ensures it is always visible when focused.
/// https://gist.github.com/collinjackson/50172e3547e959cba77e2938f2fe5ff5
/// https://github.com/flutter/flutter/issues/10826#issuecomment-313714574
class EnsureVisibleWhenFocused extends StatefulWidget {
  const EnsureVisibleWhenFocused({
    Key key,
    @required this.child,
    @required this.focusNode,
    this.curve: Curves.ease,
    this.duration: const Duration(milliseconds: 100),
  }) : super(key: key);

  /// The node we will monitor to determine if the child is focused
  final FocusNode focusNode;

  /// The child widget that we are wrapping
  final Widget child;

  /// The curve we will use to scroll ourselves into view.
  ///
  /// Defaults to Curves.ease.
  final Curve curve;

  /// The duration we will use to scroll ourselves into view
  ///
  /// Defaults to 100 milliseconds.
  final Duration duration;

  EnsureVisibleWhenFocusedState createState() => new EnsureVisibleWhenFocusedState();
}

class EnsureVisibleWhenFocusedState extends State<EnsureVisibleWhenFocused> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_ensureVisible);
  }

  @override
  void dispose() {
    super.dispose();
    widget.focusNode.removeListener(_ensureVisible);
  }

  Future<Null> _ensureVisible() async {
    // Wait for the keyboard to come into view
    // TODO: position doesn't seem to notify listeners when metrics change,
    // perhaps a NotificationListener around the scrollable could avoid
    // the need insert a delay here.
    await new Future.delayed(const Duration(milliseconds: 300));

    if (!widget.focusNode.hasFocus)
      return;

    final RenderObject object = context.findRenderObject();
    final RenderAbstractViewport viewport = RenderAbstractViewport.of(object);
    assert(viewport != null);

    ScrollableState scrollableState = Scrollable.of(context);
    assert(scrollableState != null);

    ScrollPosition position = scrollableState.position;
    double alignment;
    if (position.pixels > viewport.getOffsetToReveal(object, 0.0)) {
      // Move down to the top of the viewport
      alignment = 0.0;
    } else if (position.pixels < viewport.getOffsetToReveal(object, 1.0)) {
      // Move up to the bottom of the viewport
      alignment = 1.0;
    } else {
      // No scrolling is necessary to reveal the child
      return;
    }
    position.ensureVisible(
      object,
      alignment: alignment,
      duration: widget.duration,
      curve: widget.curve,
    );
  }

  Widget build(BuildContext context) => widget.child;
}