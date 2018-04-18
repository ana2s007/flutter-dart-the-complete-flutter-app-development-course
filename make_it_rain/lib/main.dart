import 'package:flutter/material.dart';
import './ui/home.dart';

void main () {
  const title = 'Make it rain!';
  runApp(new MaterialApp(
    title: title,
    home: new Home(title: title,),
  ));
}