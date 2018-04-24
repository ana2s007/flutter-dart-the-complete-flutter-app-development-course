import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


void main() async {

  List _data = await getJson();

  print(_data[1]['title']); //just a string
  String _body = "";

//  for (int i = 0; i < _data.length; i++) {
//    print("Title ${_data[i]['title']}");
//    print("Body: ${_data[i]['body']}");
//  }
//
//  _body = _data[0]['body'];

  debugPrint("${_data.length}");
  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text('JSON Parse'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: new Center(
          child: new ListView.builder(
              itemCount: _data.length,
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (BuildContext context, int position) {
                if (position.isOdd) return new Divider();

                final index = position ~/ 2; // we are dividing position by 2
                debugPrint("$index - ${_data[index]['id']}");
                // and returning an integer result
                return new ListTile(
                    title: new Text("${_data[index]['title']}",

                        style: new TextStyle(fontSize: 14.9)),

                    subtitle: new Text("${_data[index]['body']}",
                      style: new TextStyle(fontSize: 13.4,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic),),

/*
  var format = new DateFormat("yMd");

                var date = format.format(new DateTime.fromMicrosecondsSinceEpoch(_features[index]['properties']['updated']*1000, isUtc: false));
 */

                    leading: new CircleAvatar(
                      backgroundColor: Colors.green,
                      child: new Text("${_data[index]['title'][0].toString().toUpperCase()}",
                        style: new TextStyle(fontSize: 19.4,
                            color: Colors.orangeAccent ),),
                    ),

                    onTap: () { _showOnTapMessage(context, "${_data[index]['title']}"); }

                );




              })
      ),
    ),
  ));
}

void _showOnTapMessage(BuildContext context, String message) {
  var alert = new AlertDialog(
    title: new Text('App'),
    content: new Text(message),
    actions: <Widget>[
      new FlatButton(onPressed: (){Navigator.pop(context);},
          child: new Text('OK'))
    ],
  );
  showDialog(context: context, builder: (ctx) => alert);
}



Future<List> getJson() async {
  String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  http.Response response = await http.get(apiUrl);

  return JSON.decode(response.body); // returns a List type




}

//import 'package:flutter/material.dart';
//import 'dart:async';
//import 'dart:convert';
//import 'package:http/http.dart' as http;
//void main() async {
//  List _data = await getJson();
//
//  runApp(new MaterialApp(
//    home: new Scaffold(
//      appBar: new AppBar(
//        title: new Text('JSON Parse'),
//        centerTitle: true,
//        backgroundColor: Colors.orangeAccent,
//      ),
//      body: new Center(
//        child: new ListView.builder(
//          itemCount: _data.length,
//          padding: const EdgeInsets.all(16.0),
//          itemBuilder: (BuildContext context, int position) {
//            return new Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                new ListTile(
//                  title: new Text("${_data[position]['id']} - ${_data[position]['title']}",
//                  style: const TextStyle(fontSize: 14.9)),
//                  leading: const Icon(Icons.person),
//                  trailing: const Icon(Icons.lock),
//                ),
//                const Divider(),
//              ],
//            );
//          },
//        ),
//      ),
//    ),
//  ));
//}
//
//
//Future<List> getJson() async {
//  String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
//
//  http.Response response = await http.get(apiUrl);
//
//  return json.decode(response.body); // returns a List type
//
//}