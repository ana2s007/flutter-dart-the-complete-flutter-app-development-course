import 'package:flutter/material.dart';
import './ui/home.dart';

void main() {
  const title = 'Gestures';
  runApp(new MaterialApp(
    title: title,
    home: new Home(title: title,),
  ));
}